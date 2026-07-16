local ADDON_NAME, ns = ...
local L = ns.L

-- Tooltip lines on profession reagents. Per profession that uses the
-- hovered item, a section is added:
--   <Profession> (<current skill>)          -- gold header
--     <recipe name>            1-44 64 84   -- difficulty color + scale
--     ...
--     +N more recipes give points
-- Recipe lines only appear while they can still give skill points; when a
-- profession's recipes are ALL gray, its section collapses to a single
-- gray "no skillups" line - the item is safe to sell/bank.
--
-- Raw materials that are first processed into the actual reagent (cloth ->
-- bolt, ore -> bar, hide -> cured hide, ...) also show the recipes of the
-- processed material, marked "(via <material>)".
--
-- Nothing is shown on characters without the profession (unless the
-- "Show for missing professions" setting is on: then skill 0 is assumed).
--
-- Locale safety: ALL matching is by item/spell ID. The only string
-- comparison is localized-vs-localized (profession spell name == skill
-- line name), which holds on every client language.

-- 0 = professions-only (headers with accumulated ranges, no recipe rows).
-- 1 makes no sense (lowest and highest recipe are always shown together),
-- so it acts as 2.
local function MaxLines()
    local v = ns.db.maxLines or 6
    if v == 1 then v = 2 end
    return v
end

-- Optional modifier gate: only add tooltip info while the key is held.
local MODIFIER_CHECK = {
    SHIFT = IsShiftKeyDown,
    CTRL  = IsControlKeyDown,
    ALT   = IsAltKeyDown,
}
local function ModifierOK()
    local check = MODIFIER_CHECK[ns.db.modifier or "NONE"]
    return not check or check()
end

local module = {}
ns.ProfessionTips = module

-- skillSpell: the profession spell whose localized name matches the skill
-- line name on every client language. Data tables are resolved via ns[...];
-- professions whose data file is not loaded on this game flavor (e.g.
-- Jewelcrafting on Vanilla) stay inert automatically. Exposed on the module
-- so Options.lua can generate one checkbox per available profession.
local PROFESSIONS = {
    { dbKey = "alchemy",        skillSpell = 2259,  prefix = "ALCHEMY" },
    { dbKey = "blacksmithing",  skillSpell = 2018,  prefix = "BLACKSMITHING" },
    { dbKey = "cooking",        skillSpell = 2550,  prefix = "COOKING" },
    { dbKey = "enchanting",     skillSpell = 7411,  prefix = "ENCHANTING" },
    { dbKey = "engineering",    skillSpell = 4036,  prefix = "ENGINEERING" },
    { dbKey = "firstAid",       skillSpell = 3273,  prefix = "FIRSTAID" },
    { dbKey = "jewelcrafting",  skillSpell = 25229, prefix = "JEWELCRAFTING" }, -- TBC
    { dbKey = "leatherworking", skillSpell = 2108,  prefix = "LEATHERWORKING" },
    { dbKey = "mining",         skillSpell = 2575,  prefix = "SMELTING" },
    { dbKey = "tailoring",      skillSpell = 3908,  prefix = "TAILORING" },
}
for _, prof in ipairs(PROFESSIONS) do
    prof.recipes = prof.prefix .. "_RECIPES"
    prof.byReagent = prof.prefix .. "_BY_REAGENT"
end
module.PROFESSIONS = PROFESSIONS

-- Raw material -> what it is processed into (the actual recipe reagent).
-- Chains are followed transitively (Iron Ore -> Iron Bar -> Steel Bar).
local CONVERSIONS = {
    -- cloth -> bolt
    [2589]  = 2996,  -- Linen Cloth -> Bolt of Linen Cloth
    [2592]  = 2997,  -- Wool Cloth -> Bolt of Woolen Cloth
    [4306]  = 4305,  -- Silk Cloth -> Bolt of Silk Cloth
    [4338]  = 4339,  -- Mageweave Cloth -> Bolt of Mageweave
    [14047] = 14048, -- Runecloth -> Bolt of Runecloth
    -- ore -> bar (-> steel)
    [2770]  = 2840,  -- Copper Ore -> Copper Bar
    [2771]  = 3576,  -- Tin Ore -> Tin Bar
    [2775]  = 2842,  -- Silver Ore -> Silver Bar
    [2772]  = 3575,  -- Iron Ore -> Iron Bar
    [3575]  = 3859,  -- Iron Bar -> Steel Bar
    [2776]  = 3577,  -- Gold Ore -> Gold Bar
    [3858]  = 3860,  -- Mithril Ore -> Mithril Bar
    [7911]  = 6037,  -- Truesilver Ore -> Truesilver Bar
    [10620] = 12359, -- Thorium Ore -> Thorium Bar
    [11370] = 11371, -- Dark Iron Ore -> Dark Iron Bar
    [18562] = 17771, -- Elementium Ore -> Elementium Bar
    -- stone -> grinding stone (blacksmithing reagent)
    [2835]  = 3470,  -- Rough Stone -> Rough Grinding Stone
    [2836]  = 3478,  -- Coarse Stone -> Coarse Grinding Stone
    [2838]  = 3486,  -- Heavy Stone -> Heavy Grinding Stone
    [12365] = 12644, -- Solid Stone -> Solid Grinding Stone
    [12799] = 12849, -- Dense Stone -> Dense Grinding Stone
    -- leatherworking intermediates
    [2934]  = 2318,  -- Ruined Leather Scraps -> Light Leather
    [783]   = 4231,  -- Light Hide -> Cured Light Hide
    [4232]  = 4233,  -- Medium Hide -> Cured Medium Hide
    [4235]  = 4236,  -- Heavy Hide -> Cured Heavy Hide
    [8169]  = 8172,  -- Thick Hide -> Cured Thick Hide
    [8171]  = 15414, -- Rugged Hide -> Cured Rugged Hide
}

local DIFFICULTY_COLOR = {
    orange = "ffff8040",
    yellow = "ffffff00",
    green  = "ff40c040",
    gray   = "ff9d9d9d",
}

local function DifficultyAt(skill, recipe)
    if skill >= recipe.gray then return "gray"
    elseif skill >= recipe.green then return "green"
    elseif skill >= recipe.yellow then return "yellow"
    else return "orange" end
end

-- Renders the color-coded breakpoint scale, e.g. "1-44 64 84": guaranteed
-- skill point per craft while orange, declining chance until the yellow /
-- green upper bounds. Matters when buying mats: yellow needs ~1-4 per
-- point, green far more.
local function FormatScale(orange, yellow, green, gray)
    return ("|c%s%d-%d|r |c%s%d|r |c%s%d|r"):format(
        DIFFICULTY_COLOR.orange, orange, yellow - 1,
        DIFFICULTY_COLOR.yellow, green - 1,
        DIFFICULTY_COLOR.green, gray - 1)
end

local function GetSkill(prof)
    prof.name = prof.name or GetSpellInfo(prof.skillSpell)
    for i = 1, GetNumSkillLines() do
        local name, isHeader, _, rank = GetSkillLineInfo(i)
        if not isHeader and name == prof.name then
            return rank
        end
    end
    return nil -- character doesn't have this profession
end

local playerFaction
local function PlayerFaction()
    playerFaction = playerFaction or UnitFactionGroup("player")
    return playerFaction
end

-- Collects the recipes of the item AND of everything it can be processed
-- into. Returns the non-gray candidates ({spellId, via}) sorted by required
-- skill, whether the item is a (considered) reagent for this profession at
-- all, and the ACCUMULATED breakpoint range over all considered recipes:
-- lowest required skill, but the highest yellow/green/gray bounds - because
-- while leveling you would always craft whichever recipe has the best color.
--
-- Not considered at all: recipes locked to the other faction, and - with
-- the per-profession "only learned" setting - recipes the character hasn't
-- learned.
local function GatherCandidates(prof, itemId, skill, onlyLearned)
    local recipes, index = ns[prof.recipes], ns[prof.byReagent]
    if not recipes or not index then return nil, false, nil end

    local out, seen = {}, {}
    local isReagent = false
    local range
    local id, via = itemId, nil
    for _ = 1, 5 do -- conversion chains are short; hard depth cap
        local spells = index[id]
        if spells then
            for _, spellId in ipairs(spells) do
                if not seen[spellId] then
                    seen[spellId] = true
                    local locked = ns.RECIPE_FACTION and ns.RECIPE_FACTION[spellId]
                    if (not locked or locked == PlayerFaction())
                        and (not onlyLearned or IsPlayerSpell(spellId)) then
                        isReagent = true
                        local r = recipes[spellId]
                        if not range then
                            range = { orange = r.orange, yellow = r.yellow,
                                      green = r.green, gray = r.gray }
                        else
                            if r.orange < range.orange then range.orange = r.orange end
                            if r.yellow > range.yellow then range.yellow = r.yellow end
                            if r.green  > range.green  then range.green  = r.green  end
                            if r.gray   > range.gray   then range.gray   = r.gray   end
                        end
                        if skill < r.gray then
                            out[#out + 1] = { spellId = spellId, via = via }
                        end
                    end
                end
            end
        end
        if not ns.db.includeProcessed then break end
        id = CONVERSIONS[id]
        if not id then break end
        via = id
    end

    table.sort(out, function(a, b)
        return recipes[a.spellId].orange < recipes[b.spellId].orange
    end)
    return out, isReagent, range
end

local function AddRecipeLine(tooltip, skill, cand, recipe, hasProfession)
    local name = GetSpellInfo(cand.spellId) or ("#" .. cand.spellId)
    local color = DIFFICULTY_COLOR[DifficultyAt(skill, recipe)]

    local left = ("  |c%s%s|r"):format(color, name)
    if cand.via then
        local viaName = GetItemInfo(cand.via) or L["processed material"]
        left = left .. (" |cff9d9d9d(%s)|r"):format(format(L["via %s"], viaName))
    end
    -- Without the profession every recipe is unlearned - skip the noise.
    if hasProfession and not IsPlayerSpell(cand.spellId) then
        left = left .. (" |cffff5050(%s)|r"):format(L["not learned"])
    end

    tooltip:AddDoubleLine(left,
        FormatScale(recipe.orange, recipe.yellow, recipe.green, recipe.gray))
end

local function AddProfessionLines(tooltip, prof, itemId)
    if not ns.db[prof.dbKey] then return end
    -- Without the profession, optionally still show the lines (e.g. to
    -- decide what to keep for alts) at skill 0: everything reads orange
    -- and the full breakpoint scales stay visible.
    local skill = GetSkill(prof)
    local hasProfession = skill ~= nil
    if not hasProfession then
        if not ns.db.showMissing then return end
        skill = 0
    end

    -- "Only learned" is meaningless without the profession (nothing is
    -- learned), so it only applies on characters that have it.
    local onlyLearned = hasProfession and ns.db[prof.dbKey .. "OnlyLearned"]
    local candidates, isReagent, range = GatherCandidates(prof, itemId, skill, onlyLearned)
    if not isReagent then return end

    -- Emphasizes the just-added line's left text with the tooltip header
    -- font ("bold"). Tooltip fontstrings are recycled between tooltips, so
    -- the module tracks them and resets the font on OnTooltipCleared.
    local function EmphasizeLastLine()
        local fs = _G[tooltip:GetName() .. "TextLeft" .. tooltip:NumLines()]
        if fs then
            fs:SetFontObject(GameTooltipHeaderText)
            tooltip.professionTipsHeaderFS = tooltip.professionTipsHeaderFS or {}
            tinsert(tooltip.professionTipsHeaderFS, fs)
        end
    end

    if #candidates == 0 then
        -- Every recipe using this item is gray: one clear "sell it" line.
        tooltip:AddDoubleLine(
            ("|c%s%s|r"):format(DIFFICULTY_COLOR.gray, prof.name),
            ("|c%s%s|r"):format(DIFFICULTY_COLOR.gray, L["no skillups"]))
        EmphasizeLastLine()
        tooltip:Show()
        return
    end

    -- Section header: profession name + current skill on the left, the
    -- material's ACCUMULATED skill range on the right.
    local header
    if hasProfession then
        header = ("|cffffd100%s (%d)|r"):format(prof.name, skill)
    else
        header = ("|cffffd100%s|r"):format(prof.name)
    end
    tooltip:AddDoubleLine(header,
        FormatScale(range.orange, range.yellow, range.green, range.gray))
    EmphasizeLastLine()

    -- maxLines 0 = professions-only mode (just the header rows).
    -- 1 acts as 2: with any recipes shown, the lowest- and the
    -- highest-requirement one always appear together.
    local recipes = ns[prof.recipes]
    local maxLines = MaxLines()
    if maxLines > 0 then
        local show = candidates
        if #candidates > maxLines then
            show = {}
            local picked = {}
            local function pick(cand)
                if not picked[cand] and #show < maxLines then
                    picked[cand] = true
                    show[#show + 1] = cand
                end
            end
            pick(candidates[1])           -- lowest required skill
            pick(candidates[#candidates]) -- highest required skill
            -- Middle slots: recipes usable at the current skill first
            -- (learned before unlearned, highest requirement first - the
            -- ones just below the skill are the best training value);
            -- then not-yet-usable ones, nearest requirement first.
            local rest = {}
            for _, cand in ipairs(candidates) do rest[#rest + 1] = cand end
            table.sort(rest, function(a, b)
                local ra, rb = recipes[a.spellId], recipes[b.spellId]
                local ua, ub = ra.orange <= skill, rb.orange <= skill
                if ua ~= ub then return ua end
                if ua then
                    if hasProfession then
                        local la = IsPlayerSpell(a.spellId)
                        local lb = IsPlayerSpell(b.spellId)
                        if la ~= lb then return la end
                    end
                    return ra.orange > rb.orange
                end
                return ra.orange < rb.orange
            end)
            for _, cand in ipairs(rest) do pick(cand) end
            table.sort(show, function(a, b)
                return recipes[a.spellId].orange < recipes[b.spellId].orange
            end)
        end

        for _, cand in ipairs(show) do
            AddRecipeLine(tooltip, skill, cand, recipes[cand.spellId], hasProfession)
        end
        local hidden = #candidates - #show
        if hidden > 0 then
            tooltip:AddLine(("  |cff9d9d9d+%d|r "):format(hidden) .. L["more recipes give points"])
        end
    end
    tooltip:Show() -- recalculate tooltip size for the added lines
end

local function HandleTooltip(tooltip, data)
    if tooltip ~= GameTooltip and tooltip ~= ItemRefTooltip then return end
    if not ModifierOK() then return end
    local itemId = data and data.id
    if not itemId and tooltip.GetItem then
        local _, link = tooltip:GetItem()
        itemId = link and tonumber(link:match("item:(%d+)"))
    end
    if not itemId then return end
    for _, prof in ipairs(PROFESSIONS) do
        AddProfessionLines(tooltip, prof, itemId)
    end
end

ns.OnInit(function()
    -- With a modifier configured, pressing/releasing it while already
    -- hovering should update the tooltip: re-run the owner's OnEnter so
    -- the tooltip is rebuilt (and our post-call runs again).
    local events = CreateFrame("Frame")
    events:RegisterEvent("MODIFIER_STATE_CHANGED")
    events:SetScript("OnEvent", function()
        if (ns.db.modifier or "NONE") == "NONE" then return end
        if not GameTooltip:IsShown() then return end
        local owner = GameTooltip:GetOwner()
        if not owner or not GameTooltip.GetItem then return end
        local _, link = GameTooltip:GetItem()
        if not link then return end
        local onEnter = owner:GetScript("OnEnter")
        if onEnter then
            GameTooltip:Hide()
            onEnter(owner, true)
        end
    end)

    -- Runs for both tooltip API paths: resets the "bold" header fonts
    -- (tooltip line fontstrings are recycled) and the duplicate guard.
    local function OnCleared(tooltip)
        tooltip.professionTipsDone = nil
        local list = tooltip.professionTipsHeaderFS
        if list then
            for i = #list, 1, -1 do
                list[i]:SetFontObject(GameTooltipText)
                list[i] = nil
            end
        end
    end
    GameTooltip:HookScript("OnTooltipCleared", OnCleared)
    ItemRefTooltip:HookScript("OnTooltipCleared", OnCleared)

    if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall
        and Enum.TooltipDataType and Enum.TooltipDataType.Item then
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, HandleTooltip)
    else
        -- Pre-10.0 tooltip API fallback; OnTooltipSetItem can fire twice for
        -- the same item, hence the cleared-on-hide guard.
        local function OnSetItem(tooltip)
            if tooltip.professionTipsDone then return end
            tooltip.professionTipsDone = true
            HandleTooltip(tooltip)
        end
        GameTooltip:HookScript("OnTooltipSetItem", OnSetItem)
        ItemRefTooltip:HookScript("OnTooltipSetItem", OnSetItem)
    end
end)
