local ADDON_NAME, ns = ...
local L = ns.L

-- WhatsTraining-style recipe browser for professions: a side tab on the
-- trade-skill window (and on the Craft window - Enchanting uses that one
-- on these clients) opens an overlay listing the open profession's FULL
-- catalogue - what you can learn now, what comes up later (sorted by
-- required skill) and, per recipe, WHERE it comes from: trainer / vendor
-- / mob drop / world drop / quest, with costs. Sources ship in
-- Data/<flavor>/<Profession>Sources.lua (ns.<PREFIX>_SOURCES).
--
-- Layout adapts to widened profession windows (Leatrix Plus "Enhance
-- professions" & co. resize the frame to ~714px): the tab anchors to the
-- frame's right edge (so it follows any width), and on a wide frame the
-- overlay splits into list (left) + detail pane (right) showing the
-- selected recipe; on the default 384px frame the list fills the overlay
-- and details live in the hover tooltip (which exists in both modes).
--
-- WoW Forever has no trade skill / craft window: there the tab joins the
-- profession-tab column of Retail's ProfessionsFrame and the overlay
-- covers its crafting page (see the "hosts" section at the end).
--
-- Locale safety: recipes are spell IDs, names resolved at runtime
-- (ns.api.GetSpellName); vendor/mob names localized via ns.GetNpcName
-- (server query, English data fallback); zones localized from their area
-- id where the data has one (Forever), else shipped English. The open
-- profession is identified by localized-vs-localized name match on the
-- classic windows (profession spell name == GetTradeSkillLine/
-- CraftDisplay name), by skill line id on Forever.

local ROW_HEIGHT = 21
local WIDE_THRESHOLD = 500 -- default frame is 384 wide; wide skins ~714

-- source kinds: display order, colors, compact row letters
local SOURCE_ORDER = { t = 1, v = 2, d = 3, q = 4, w = 5, u = 6 }
local SOURCE_COLOR = {
    t = "ff80b0ff", -- trainer: light blue
    v = "ff40c040", -- vendor: green
    d = "ffff6060", -- drop: red
    q = "ffffd100", -- quest: gold
    w = "ffc060f0", -- world drop: purple
    u = "ff909090", -- unknown: gray
}
local function SourceWord(kind)
    if kind == "t" then return L["Trainer"]
    elseif kind == "v" then return L["Vendor"]
    elseif kind == "d" then return L["Drop"]
    elseif kind == "q" then return L["Quest"]
    elseif kind == "w" then return L["World drop"]
    else return L["Source unknown"] end
end

-- ---------------------------------------------------------------- model

-- Colored word tag for a row (user request 2026-08-05): the PRIMARY
-- (most accessible) source kind as a word - "Trainer", "Vendor", ... -
-- plus a grey "+N" when more kinds exist; full detail in the tooltip.
-- No data yet / unknown renders a grey "?".
local function SourceTag(sources)
    local seen, kinds = {}, {}
    if sources then
        for _, src in ipairs(sources) do
            local kind = SOURCE_ORDER[src.k] and src.k or "u"
            if not seen[kind] then
                seen[kind] = true
                kinds[#kinds + 1] = kind
            end
        end
        table.sort(kinds, function(a, b) return SOURCE_ORDER[a] < SOURCE_ORDER[b] end)
    end
    if #kinds == 0 or (#kinds == 1 and kinds[1] == "u") then
        return "|c" .. SOURCE_COLOR.u .. "?|r"
    end
    local tag = "|c" .. SOURCE_COLOR[kinds[1]] .. SourceWord(kinds[1]) .. "|r"
    if #kinds > 1 then
        tag = tag .. " |cff909090+" .. (#kinds - 1) .. "|r"
    end
    return tag
end
ns.BrowserSourceTag = SourceTag -- exposed for tests

-- Which faction a recipe is locked to, or nil when both can get it.
-- Two sources of truth: the curated ns.RECIPE_FACTION list, and the
-- source data itself (every single source tagged with the same faction
-- means only that faction can obtain it).
local function EntryFaction(spellId, sources)
    local locked = ns.RECIPE_FACTION and ns.RECIPE_FACTION[spellId]
    if locked then return locked end
    if not sources or #sources == 0 then return nil end
    local f
    for _, src in ipairs(sources) do
        if not src.faction then return nil end
        if f and src.faction ~= f then return nil end
        f = src.faction
    end
    return f
end

-- A recipe locked to the OTHER faction is not automatically hopeless:
-- when it is taught by an ITEM (pattern/recipe/plans), that item can
-- travel through the neutral auction house (Booty Bay / Gadgetzan) -
-- unless it is soulbound, which the data does not record. Recipes the
-- other faction only learns DIRECTLY (quest turn-ins without an item)
-- can never cross. (user request 2026-08-06)
local function CrossFactionItem(sources)
    for _, src in ipairs(sources or {}) do
        if src.item then return true end
    end
    return false
end

-- Builds the section model for one profession at a given skill rank:
--   { available = {entry...}, upcoming = {...}, known = {...} }
-- entry = { spell, req, recipe, sources, learned, faction, crossAH };
-- sections sorted by required skill (then spell ID for a stable order).
-- Faction-locked recipes are INCLUDED and flagged - the display filter
-- decides what is shown (default: only what my faction can obtain).
function ns.BuildBrowserModel(prof, skill)
    local recipes = ns[prof.recipes]
    local sources = ns[prof.prefix .. "_SOURCES"]
    if not recipes then return nil end
    local model = { available = {}, upcoming = {}, known = {} }
    for spellId, recipe in pairs(recipes) do
        local srcList = sources and sources[spellId]
        local entry = {
            spell = spellId,
            req = recipe.orange,
            recipe = recipe,
            sources = srcList,
            learned = ns.api.IsSpellKnown(spellId),
            faction = EntryFaction(spellId, srcList),
        }
        entry.crossAH = entry.faction ~= nil and CrossFactionItem(srcList)
        if entry.learned then
            model.known[#model.known + 1] = entry
        elseif entry.req <= skill then
            model.available[#model.available + 1] = entry
        else
            model.upcoming[#model.upcoming + 1] = entry
        end
    end
    local function bySkill(a, b)
        if a.req ~= b.req then return a.req < b.req end
        return a.spell < b.spell
    end
    table.sort(model.available, bySkill)
    table.sort(model.upcoming, bySkill)
    table.sort(model.known, bySkill)
    return model
end


-- Faction colors + the localized faction name (FACTION_ALLIANCE /
-- FACTION_HORDE are localized by the client).
local FACTION_COLOR = { Alliance = "ff4a7fda", Horde = "ffe03030" }

local playerFaction
local function PlayerFaction()
    playerFaction = playerFaction or UnitFactionGroup("player")
    return playerFaction
end

-- The faction crests from the unit-frame PvP icons - part of the base UI
-- in every client since vanilla, so no availability guesswork. Cropped
-- to the crest itself via the inline texture escape's coord form.
local FACTION_ICON = {
    Alliance = "|TInterface\\TargetingFrame\\UI-PVP-Alliance:14:14:0:0:64:64:5:38:2:36|t",
    Horde    = "|TInterface\\TargetingFrame\\UI-PVP-Horde:14:14:0:0:64:64:5:38:2:36|t",
}

local function FactionName(faction)
    if faction == "Alliance" then return FACTION_ALLIANCE or "Alliance" end
    return FACTION_HORDE or "Horde"
end

-- Row badge for faction-locked recipes: the faction crest (falls back to
-- the colored initial if the texture ever fails), nothing for recipes
-- both factions can obtain. (user request 2026-08-06)
local function FactionMark(entry)
    if not entry.faction then return "" end
    local icon = FACTION_ICON[entry.faction]
    if icon then return icon .. " " end
    return ("|c%s[%s]|r "):format(FACTION_COLOR[entry.faction] or "ffffffff",
        string.sub(FactionName(entry.faction), 1, 1))
end
ns.BrowserFactionMark = FactionMark -- exposed for tests

-- Faction-exclusive recipes are listed per faction checkbox (user
-- request 2026-08-06 - clearer than the old mine/all/neutral cycle):
-- unset = "my own faction only", resolved per character; both unchecked
-- = only recipes BOTH factions can obtain.
function ns.BrowserFactionShown(faction)
    local cfg = ns.db.browserFactions
    if not cfg then return faction == PlayerFaction() end
    return cfg[faction] == true
end

function ns.BrowserToggleFaction(faction)
    local cfg = ns.db.browserFactions
    if not cfg then -- materialize the effective default, then flip
        cfg = { Alliance = false, Horde = false }
        cfg[PlayerFaction() or "Alliance"] = true
        ns.db.browserFactions = cfg
    end
    cfg[faction] = not cfg[faction]
end

-- Crest + the localized faction name in faction colors, for text lines
-- (info block, source lines).
local function FactionLabel(faction)
    return ("%s|c%s%s|r"):format(FACTION_ICON[faction] or "",
        FACTION_COLOR[faction] or "ffffffff", FactionName(faction))
end
ns.BrowserFactionLabel = FactionLabel -- exposed for tests


-- Forever's recipe vendors take "Merchant's Favor", a currency earned by
-- trading with merchants (What's Training data: favor = amount).
local MERCHANTS_FAVOR = 3402
local function FavorText(amount)
    local info = C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo
        and C_CurrencyInfo.GetCurrencyInfo(MERCHANTS_FAVOR)
    local icon = info and info.iconFileID and ("|T" .. info.iconFileID .. ":0|t ") or ""
    local text = ("%d %s%s"):format(amount, icon, info and info.name or L["Merchant's Favor"])
    if info and info.quantity and info.quantity < amount then
        text = "|cffff2020" .. text .. "|r"
    end
    return text
end

-- "Requires Friendly with <faction>" - alternatives (a Horde and an
-- Alliance faction of the same vendor pair) joined with " / ".
local function RepText(rep)
    local names, standing = {}, nil
    for _, pair in ipairs(rep) do
        local name = ns.api.GetFactionName(pair[1])
        if name then names[#names + 1] = name end
        standing = standing or pair[2]
    end
    if #names == 0 then return nil end
    local label = _G["FACTION_STANDING_LABEL" .. (standing or 4)] or ""
    return (ITEM_REQ_REPUTATION or "Requires %s - %s"):format(table.concat(names, " / "), label)
end

-- One rendered line per source entry (full text - tooltip + detail pane).
-- Money is colored by affordability, npc names localized on demand, zones
-- localized from their area id when the data carries one (Forever).
local function SourceLine(src)
    local kind = SOURCE_ORDER[src.k] and src.k or "u"
    local head = "|c" .. SOURCE_COLOR[kind] .. SourceWord(kind) .. "|r"
    local bits = {}
    local zone = ns.api.GetAreaName(src.area) or src.zone
    -- "t" normally has no npc, but special NPC-teachers (e.g. the BWL
    -- Elementium smelt) ship one - show them like a vendor/dropper
    local who
    if src.npc and (kind == "t" or kind == "v" or kind == "d") then
        who = ns.GetNpcName(src.npc, src.name)
    elseif kind == "q" and (src.quest or src.name) then
        who = (src.quest and ns.api.GetQuestTitle(src.quest)) or src.name
            or ("#" .. src.quest)
    end
    if who then
        bits[#bits + 1] = who .. (zone and (" (" .. zone .. ")") or "")
    elseif zone then
        bits[#bits + 1] = zone
    end
    if src.auto then bits[#bits + 1] = L["learned with the profession"] end
    if src.cost then
        local money = ns.api.CoinString(src.cost)
        if GetMoney and GetMoney() < src.cost then
            money = "|cffff2020" .. money .. "|r"
        end
        bits[#bits + 1] = money
    end
    if src.favor then bits[#bits + 1] = FavorText(src.favor) end
    if src.limited then bits[#bits + 1] = L["limited stock"] end
    if src.rep then
        local text = RepText(src.rep)
        if text then bits[#bits + 1] = text end
    end
    if src.faction then bits[#bits + 1] = FactionLabel(src.faction) end
    if #bits == 0 then return head end
    return head .. ": " .. table.concat(bits, " - ")
end
ns.BrowserSourceLine = SourceLine -- exposed for tests
-- ---------------------------------------------------------------- state

local module = {}
ns.RecipeBrowser = module

local hosts = {} -- host frame -> host record, see the "hosts" section below
local overlay, listFrame, scrollFrame, scrollContent, detailFrame
local searchBox, filterBar
local filterButtons = {}
local FILTER_KINDS = { "t", "v", "d", "w", "q" } -- bar order
local FILTER_ROW_HEIGHT = 21
local rows = {}
local displayList = {}
local searchFilter = ""
local activeHost -- host frame the overlay is currently attached to
local activeProf, activeSkill, activeMax
local selectedSpell -- wide mode: recipe shown in the detail pane

local function Professions()
    return ns.ProfessionTips and ns.ProfessionTips.PROFESSIONS or {}
end

-- Identify the open profession: localized skill-line name (from the host
-- window's API) matched against each profession spell's localized name.
-- Returns nil for Beast Training (a Craft window without a profession).
local function MatchProfession(name)
    if not name then return nil end
    for _, prof in ipairs(Professions()) do
        if ns[prof.recipes] and ns.api.GetSpellName(prof.skillSpell) == name then
            return prof
        end
    end
    return nil
end

local function TradeLine()
    if GetTradeSkillLine then return GetTradeSkillLine() end
end

local function CraftLine()
    if GetCraftDisplaySkillLine then
        local name, rank, maxRank = GetCraftDisplaySkillLine()
        if name then return name, rank, maxRank end
    end
    return nil
end

-- ---------------------------------------------------------------- rows

local function RecipeName(spellId)
    return ns.api.GetSpellName(spellId) or ("spell " .. spellId)
end

-- Spell icons: for spells the character has not learned, the client may
-- resolve the icon to the "Temp" placeholder (the Samwise face) until
-- the spell record is loaded (live finding 2026-08-05). Request the
-- async load and show a question mark meanwhile; SPELL_DATA_LOAD_RESULT
-- triggers a refresh (registered on the overlay).
local TEMP_ICON_FILE_ID = 136235
local function RecipeIcon(spellId)
    -- prefer the CRAFTED ITEM's icon (Data/ProductData.lua) - like
    -- Blizzard's own trade skill list. Craft SPELL icons are unreliable:
    -- all First Aid bandages share one generic texture, Engineering
    -- spell records never resolve past the placeholder (live findings
    -- 2026-08-06). Item icons come from GetItemInfoInstant's local data,
    -- no server round trip.
    local product = ns.CRAFT_PRODUCT and ns.CRAFT_PRODUCT[spellId]
    if product then
        local icon = ns.api.GetItemIcon(product)
        if icon then return icon end
    end
    local tex = ns.api.GetSpellIcon(spellId)
    local placeholder = not tex or tex == TEMP_ICON_FILE_ID
        or (type(tex) == "string" and tex:lower():find("temp", 1, true) ~= nil)
    if placeholder then
        if C_Spell and C_Spell.RequestLoadSpellData then
            pcall(C_Spell.RequestLoadSpellData, spellId)
        end
        return "Interface\\Icons\\INV_Misc_QuestionMark"
    end
    return tex
end

-- Reagent names resolve through the async item cache. Request each item
-- once per session; the display list PRE-warms every listed recipe's
-- reagents on build, so names are usually cached before the first hover
-- (live finding 2026-08-06: tooltips opened with "... x1" placeholders).
local requestedItems = {}
local function RequestItem(itemId)
    if requestedItems[itemId] then return end
    requestedItems[itemId] = true
    if C_Item and C_Item.RequestLoadItemDataByID then
        pcall(C_Item.RequestLoadItemDataByID, itemId)
    else
        ns.api.GetItemName(itemId) -- the query itself triggers the server request
    end
end

-- Dismissed ("hidden") recipes, account-wide per profession: a recipe
-- you never intend to chase (a world-drop pattern, another faction's
-- quest reward) moves to a collapsible section at the end of the list
-- instead of cluttering the sections you act on. (user request
-- 2026-08-06)
local function DismissedSet(create)
    local all = ns.db.dismissed
    if not all then
        if not create then return nil end
        all = {}
        ns.db.dismissed = all
    end
    local key = activeProf and activeProf.prefix
    if not key then return nil end
    local set = all[key]
    if not set and create then
        set = {}
        all[key] = set
    end
    return set
end

local function IsDismissed(entry)
    local set = DismissedSet(false)
    return set ~= nil and set[entry.spell] == true
end

function ns.BrowserToggleDismiss(spellId)
    local set = DismissedSet(true)
    if not set then return end
    set[spellId] = (not set[spellId]) or nil
end

-- The info block shared by the hover tooltip and the wide-mode detail
-- pane (user request 2026-08-05: the tooltip should carry what the pane
-- shows, so the default-size window loses nothing): requirement +
-- breakpoint scale, learned status, all sources with costs, reagents.
-- Returns a list of color-escaped lines; "" = spacer.
local function BuildInfoLines(entry)
    local mod = ns.ProfessionTips
    local lines = {}
    local reqColor = entry.req <= (activeSkill or 0) and "ff20ff20" or "ffff5050"
    lines[#lines + 1] = ("|c%s%s|r  %s"):format(reqColor,
        (L["Requires %d"]):format(entry.req),
        mod.FormatScale(entry.recipe.orange, entry.recipe.yellow,
            entry.recipe.green, entry.recipe.gray))
    -- faction lock: what it means for THIS character
    if entry.faction then
        -- crest + colored faction name, explanation in grey so the
        -- faction itself stands out (user request 2026-08-06)
        local line = ("%s|c%s%s|r"):format(FACTION_ICON[entry.faction] or "",
            FACTION_COLOR[entry.faction] or "ffffffff",
            (L["%s only"]):format(FactionName(entry.faction)))
        if entry.faction ~= PlayerFaction() then
            line = line .. "|cffb0b0b0 - " .. (entry.crossAH
                and L["your faction can only get it traded via the neutral auction house"]
                or L["your faction cannot obtain this recipe"]) .. "|r"
        end
        lines[#lines + 1] = line
    end
    if entry.recipe.gray >= mod.NEVER_TRIVIAL then
        -- special smelts: the game data defines no trivial point
        lines[#lines + 1] = "|cff909090"
            .. L["Never turns trivial - the skill-up chance decreases with skill but has no defined end."]
            .. "|r"
    end
    if entry.learned then
        lines[#lines + 1] = "|cff909090" .. L["Already known"] .. "|r"
    end
    lines[#lines + 1] = ""
    lines[#lines + 1] = "|cfff0f0f0" .. L["Source"] .. ":|r"
    if entry.sources and #entry.sources > 0 then
        for _, src in ipairs(entry.sources) do
            lines[#lines + 1] = SourceLine(src)
        end
    else
        lines[#lines + 1] = "|cff909090" .. L["Source unknown"] .. "|r"
    end
    lines[#lines + 1] = ""
    lines[#lines + 1] = "|cfff0f0f0" .. (SPELL_REAGENTS or "Reagents:") .. "|r"
    local reagents = {}
    for itemId, count in pairs(entry.recipe.reagents) do
        reagents[#reagents + 1] = { id = itemId, count = count }
    end
    table.sort(reagents, function(a, b) return a.id < b.id end)
    for _, r in ipairs(reagents) do
        -- nil until the item cache answers; GET_ITEM_INFO_RECEIVED
        -- re-renders the tooltip/pane once the name arrives
        local name = ns.api.GetItemName(r.id)
        if not name then RequestItem(r.id) end
        lines[#lines + 1] = ("%s x%d"):format(name or "|cff909090...|r", r.count)
    end
    return lines
end
ns.BrowserInfoLines = BuildInfoLines -- exposed for tests

local function ShowRecipeTooltip(entry, anchor)
    GameTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
    local mod = ns.ProfessionTips
    local diff = mod.DifficultyAt(activeSkill or 0, entry.recipe)
    GameTooltip:AddLine(("|c%s%s|r"):format(mod.DIFFICULTY_COLOR[diff], RecipeName(entry.spell)))
    for _, line in ipairs(BuildInfoLines(entry)) do
        if line == "" then
            GameTooltip:AddLine(" ")
        else
            GameTooltip:AddLine(line, 1, 1, 1, true)
        end
    end
    GameTooltip:AddLine(" ")
    if ns.CRAFT_PRODUCT and ns.CRAFT_PRODUCT[entry.spell] then
        GameTooltip:AddLine(L["<Hold Shift for the crafted item>"], 0.5, 0.5, 0.5)
    end
    GameTooltip:AddLine(IsDismissed(entry) and L["Right-click: show this recipe again"]
        or L["Right-click: hide this recipe"], 0.5, 0.5, 0.5)
    GameTooltip:Show()
end

-- The real item tooltip of the crafted product. Narrow mode: hovering a
-- row while SHIFT is held swaps to it (you cannot hover into a tooltip);
-- wide mode: hovering the detail pane's header shows it directly.
local function ShowProductTooltip(product, anchor)
    GameTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
    if GameTooltip.SetItemByID then
        GameTooltip:SetItemByID(product)
    else
        GameTooltip:SetHyperlink("item:" .. product)
    end
    GameTooltip:Show()
end

local hoveredRow -- row currently under the mouse (narrow-mode tooltips)

local function UpdateRowTooltip(row)
    local entry = row.entry
    if not entry then return end
    local product = ns.CRAFT_PRODUCT and ns.CRAFT_PRODUCT[entry.spell]
    if product and IsShiftKeyDown() then
        ShowProductTooltip(product, row)
    else
        ShowRecipeTooltip(entry, row)
    end
end

local RefreshDetail -- forward declaration

local RefreshBrowserList -- forward declaration (rebuild + redraw)

local function OnRowClick(self, button)
    -- section headers: only the dismissed one is collapsible
    if self.headerSection == "dismissed" then
        ns.db.browserDismissedCollapsed = not ns.db.browserDismissedCollapsed
        RefreshBrowserList()
        return
    end
    local entry = self.entry
    if not entry then return end
    -- right-click dismisses (and restores from the dismissed section)
    if button == "RightButton" then
        ns.BrowserToggleDismiss(entry.spell)
        if selectedSpell == entry.spell then selectedSpell = nil end
        GameTooltip:Hide()
        RefreshBrowserList()
        return
    end
    if IsModifiedClick and IsModifiedClick("CHATLINK") then
        local link = ns.api.GetSpellLink(entry.spell)
        if link then ChatEdit_InsertLink(link) end
        return
    end
    if detailFrame and detailFrame:IsShown() then
        selectedSpell = entry.spell
        RefreshDetail()
        -- move the selection highlight without a full list rebuild
        for _, row in ipairs(rows) do
            if row.selected then
                row.selected:SetShown(row.entry and row.entry.spell == selectedSpell)
            end
        end
    end
end

local function GetRow(i)
    local row = rows[i]
    if row then return row end
    row = CreateFrame("Button", nil, scrollContent)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row:SetHeight(ROW_HEIGHT)
    row:SetPoint("TOPLEFT", 2, -(i - 1) * ROW_HEIGHT)
    row:SetPoint("TOPRIGHT", scrollContent, "TOPRIGHT", -2, -(i - 1) * ROW_HEIGHT)
    row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

    row.selected = row:CreateTexture(nil, "BACKGROUND")
    row.selected:SetAllPoints()
    row.selected:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    row.selected:SetVertexColor(0.3, 0.5, 1, 0.35)
    row.selected:Hide()

    row.icon = row:CreateTexture(nil, "ARTWORK")
    row.icon:SetSize(ROW_HEIGHT - 4, ROW_HEIGHT - 4)
    row.icon:SetPoint("LEFT", 2, 0)
    row.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

    row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    row.text:SetPoint("LEFT", row.icon, "RIGHT", 4, 0)
    row.text:SetJustifyH("LEFT")
    row.text:SetWordWrap(false)

    row.right = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    row.right:SetPoint("RIGHT", -2, 0)
    row.right:SetJustifyH("RIGHT")
    row.text:SetPoint("RIGHT", row.right, "LEFT", -6, 0)

    row:SetScript("OnEnter", function(self)
        -- wide mode has the detail pane - no tooltip on top of it
        -- (user request 2026-08-06)
        if self.entry and not (detailFrame and detailFrame:IsShown()) then
            hoveredRow = self
            UpdateRowTooltip(self)
        end
    end)
    row:SetScript("OnLeave", function(self)
        if hoveredRow == self then hoveredRow = nil end
        GameTooltip:Hide()
    end)
    row:SetScript("OnClick", OnRowClick)

    -- the ICON is its own hover target showing the crafted item's real
    -- tooltip - in BOTH modes (user request 2026-08-06; in wide mode
    -- this is the only row-level tooltip). Clicks pass through to the
    -- normal row behavior, and the row highlight stays lit.
    row.iconHover = CreateFrame("Button", nil, row)
    row.iconHover:SetAllPoints(row.icon)
    row.iconHover:SetScript("OnEnter", function()
        local entry = row.entry
        if not entry then return end
        row:LockHighlight()
        local product = ns.CRAFT_PRODUCT and ns.CRAFT_PRODUCT[entry.spell]
        if product then
            ShowProductTooltip(product, row)
        elseif not (detailFrame and detailFrame:IsShown()) then
            ShowRecipeTooltip(entry, row) -- no product (enchants): recipe info
        end
    end)
    row.iconHover:SetScript("OnLeave", function()
        row:UnlockHighlight()
        GameTooltip:Hide()
    end)
    row.iconHover:SetScript("OnClick", function() OnRowClick(row) end)
    rows[i] = row
    return row
end

-- ---------------------------------------------------------------- list

local function MatchesSearch(entry)
    if searchFilter == "" then return true end
    return strfind(strlower(RecipeName(entry.spell)), searchFilter, 1, true) ~= nil
end

-- Quick filters (user request 2026-08-06): source kinds, faction and the
-- known-recipes toggle. Source filtering is only active while at least
-- one kind is off - with everything on, recipes WITHOUT source data
-- ("?") stay visible; filtering by kind deliberately hides them, since
-- they match no requested kind.
local function PassesFilters(entry)
    -- recipes both factions can obtain are always listed; the faction
    -- checkboxes only decide which EXCLUSIVE ones come along
    if entry.faction and not ns.BrowserFactionShown(entry.faction) then
        return false
    end

    local f = ns.db.browserFilters or {}
    if not (f.t and f.v and f.d and f.w and f.q) then
        local ok = false
        for _, src in ipairs(entry.sources or {}) do
            if f[src.k] then ok = true break end
        end
        if not ok then return false end
    end
    return MatchesSearch(entry)
end

local function BuildDisplayList()
    wipe(displayList)
    if not activeProf then return end
    local model = ns.BuildBrowserModel(activeProf, activeSkill or 0)
    if not model then return end

    local dismissed = {} -- pulled out of every section, listed at the end

    local function AddSection(headerText, list, color)
        local headerItem -- keep the header handle; #displayList moves on
        for _, entry in ipairs(list) do
            if PassesFilters(entry) then
                if IsDismissed(entry) then
                    dismissed[#dismissed + 1] = entry
                else
                    if not headerItem then
                        headerItem = { header = headerText, count = 0 }
                        displayList[#displayList + 1] = headerItem
                    end
                    headerItem.count = headerItem.count + 1
                    displayList[#displayList + 1] = { entry = entry, color = color }
                end
            end
        end
    end

    AddSection(L["Available now"], model.available, "available")
    AddSection(L["Coming up"], model.upcoming, "upcoming")
    if ns.db.browserShowKnown then
        AddSection(L["Already known"], model.known, "known")
    end

    -- dismissed recipes live in a collapsible section at the very bottom
    if #dismissed > 0 then
        local collapsed = ns.db.browserDismissedCollapsed
        displayList[#displayList + 1] = {
            header = L["Dismissed"], count = #dismissed,
            section = "dismissed", collapsed = collapsed,
        }
        if not collapsed then
            for _, entry in ipairs(dismissed) do
                displayList[#displayList + 1] = { entry = entry, color = "dismissed" }
            end
        end
    end

    -- pre-warm the item cache for every listed recipe's reagents so
    -- tooltips rarely open with "..." placeholders
    for _, item in ipairs(displayList) do
        if item.entry then
            for itemId in pairs(item.entry.recipe.reagents) do
                RequestItem(itemId)
            end
        end
    end
end

-- headless hook: build the display list for a profession without the UI
-- (the AddSection counter bug shipped because only the model was tested)
function ns.BrowserBuildList(prof, skill)
    activeProf, activeSkill = prof, skill
    BuildDisplayList()
    return displayList
end

local function RefreshRows()
    local mod = ns.ProfessionTips
    for i, item in ipairs(displayList) do
        local row = GetRow(i)
        row:Show()
        if item.header then
            row.entry = nil
            row.headerSection = item.section
            row.selected:Hide()
            row.icon:SetTexture(nil)
            row.text:SetPoint("LEFT", row.icon, "RIGHT", -14, 0) -- headers start at the row edge
            local label = ("%s (%d)"):format(item.header, item.count)
            if item.section == "dismissed" then
                -- collapsible: arrow shows the state, click toggles
                label = (item.collapsed and "|cffb0b0b0+|r " or "|cffb0b0b0-|r ") .. label
            end
            row.text:SetText(label)
            row.text:SetTextColor(0.95, 0.85, 0.4)
            row.right:SetText("")
        else
            row.headerSection = nil
            local entry = item.entry
            row.entry = entry
            row.selected:SetShown(detailFrame and detailFrame:IsShown()
                and entry.spell == selectedSpell)
            row.icon:SetTexture(RecipeIcon(entry.spell))
            row.text:SetPoint("LEFT", row.icon, "RIGHT", 4, 0)
            row.text:SetTextColor(1, 1, 1)
            local name = FactionMark(entry) .. RecipeName(entry.spell)
            if item.color == "dismissed" then
                row.text:SetText("|cff707070" .. name .. "|r")
            elseif item.color == "upcoming" then
                row.text:SetText(name)
            else
                -- available AND known: the difficulty color at the
                -- current skill, matching the detail pane's recipe name
                -- (user request 2026-08-06 - known rows were flat grey)
                local diff = mod.DifficultyAt(activeSkill or 0, entry.recipe)
                row.text:SetText(("|c%s%s|r"):format(
                    mod.DIFFICULTY_COLOR[diff], name))
            end
            local reqColor = entry.req <= (activeSkill or 0) and "ffffffff" or "ffff5050"
            row.right:SetText(("%s  |c%s%d|r"):format(SourceTag(entry.sources),
                reqColor, entry.req))
        end
    end
    for i = #displayList + 1, #rows do
        rows[i]:Hide()
        rows[i].entry = nil
    end
    scrollContent:SetHeight(math.max(1, #displayList * ROW_HEIGHT))
end

-- ---------------------------------------------------------------- detail

-- Wide mode only: pane on the right showing the selected recipe in full.
local detailWidgets

local function EnsureDetail()
    if detailFrame then return end
    detailFrame = CreateFrame("Frame", nil, overlay, "BackdropTemplate")
    detailFrame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    detailFrame:SetBackdropColor(0.05, 0.05, 0.05, 0.9)

    local w = {}
    detailWidgets = w
    w.icon = detailFrame:CreateTexture(nil, "ARTWORK")
    w.icon:SetSize(32, 32)
    w.icon:SetPoint("TOPLEFT", 10, -10)
    w.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

    w.name = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    w.name:SetPoint("TOPLEFT", w.icon, "TOPRIGHT", 8, -1)
    w.name:SetPoint("RIGHT", detailFrame, "RIGHT", -10, 0)
    w.name:SetJustifyH("LEFT")

    w.req = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    w.req:SetPoint("TOPLEFT", w.icon, "BOTTOMLEFT", 0, -8)
    w.req:SetPoint("RIGHT", detailFrame, "RIGHT", -10, 0)
    w.req:SetJustifyH("LEFT")

    w.body = detailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    w.body:SetPoint("TOPLEFT", w.req, "BOTTOMLEFT", 0, -8)
    w.body:SetPoint("RIGHT", detailFrame, "RIGHT", -10, 0)
    w.body:SetJustifyH("LEFT")
    w.body:SetSpacing(3)

    -- hovering the header (icon + name) shows the crafted item's real
    -- tooltip (user request 2026-08-06); shift-click links it to chat
    w.hover = CreateFrame("Button", nil, detailFrame)
    w.hover:SetPoint("TOPLEFT", w.icon, "TOPLEFT", 0, 0)
    w.hover:SetPoint("BOTTOMRIGHT", w.name, "BOTTOMRIGHT", 0, 0)
    w.hover:SetScript("OnEnter", function(self)
        if self.product then ShowProductTooltip(self.product, self) end
    end)
    w.hover:SetScript("OnLeave", function() GameTooltip:Hide() end)
    w.hover:SetScript("OnClick", function(self)
        if self.product and IsModifiedClick and IsModifiedClick("CHATLINK") then
            local link = ns.api.GetItemLink(self.product)
            if link then ChatEdit_InsertLink(link) end
        end
    end)
end

local function FindEntry(spellId)
    for _, item in ipairs(displayList) do
        if item.entry and item.entry.spell == spellId then return item.entry end
    end
end

function RefreshDetail() -- assigns the forward-declared local
    if not detailFrame or not detailFrame:IsShown() then return end
    local mod = ns.ProfessionTips
    local w = detailWidgets
    local entry = selectedSpell and FindEntry(selectedSpell)
    w.hover.product = entry and ns.CRAFT_PRODUCT
        and ns.CRAFT_PRODUCT[entry.spell] or nil
    if not entry then
        w.icon:SetTexture(nil)
        w.name:SetText(L["Select a recipe"])
        w.name:SetTextColor(0.7, 0.7, 0.7)
        w.req:SetText("")
        w.body:SetText("")
        return
    end

    w.icon:SetTexture(RecipeIcon(entry.spell))
    local diff = mod.DifficultyAt(activeSkill or 0, entry.recipe)
    w.name:SetText(("|c%s%s|r"):format(mod.DIFFICULTY_COLOR[diff], RecipeName(entry.spell)))
    w.req:SetText("")
    w.body:SetText(table.concat(BuildInfoLines(entry), "\n"))
end

-- ---------------------------------------------------------------- layout

-- Narrow: the list fills the overlay. Wide (Leatrix & co.): list on the
-- left at its default proportions, detail pane in the remaining space.
-- Flow-lays the filter buttons across the available width, wrapping to
-- further rows when needed. Returns the bar's total height, so the list
-- can be anchored beneath it in any window width.
local function LayoutFilterBar(width)
    if not filterBar or #filterButtons == 0 then return 0 end
    local gap, rowsUsed, x = 3, 1, 0
    for _, btn in ipairs(filterButtons) do
        if btn.Sync then btn:Sync() end -- label/width may change (faction)
        local w = btn:GetWidth()
        if x > 0 and x + w > width then -- wrap
            rowsUsed = rowsUsed + 1
            x = 0
        end
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", filterBar, "TOPLEFT", x, -(rowsUsed - 1) * FILTER_ROW_HEIGHT)
        x = x + w + gap
    end
    local height = rowsUsed * FILTER_ROW_HEIGHT
    filterBar:SetHeight(height)
    return height
end

local function ApplyLayout()
    local info = overlay and activeHost and hosts[activeHost]
    if not info then return end
    local wide = info.isWide(activeHost)
    if info.layout then info.layout(overlay, activeHost, wide) end
    local overlayWidth = overlay:GetWidth() or 0
    if overlayWidth == 0 then -- rect not resolved yet this frame
        overlayWidth = info.fallbackWidth(activeHost)
    end
    -- header block (6 top inset + 30 high) + the wrapped filter bar
    -- (2 gap) decide where the list starts
    local barHeight = LayoutFilterBar(overlayWidth - 16)
    local listTop = -(42 + barHeight)
    listFrame:ClearAllPoints()
    listFrame:SetPoint("TOPLEFT", overlay, "TOPLEFT", 0, listTop)
    listFrame:SetPoint("BOTTOMLEFT", overlay, "BOTTOMLEFT", 0, 0)
    local listWidth
    if wide then
        EnsureDetail()
        listWidth = math.max(280, overlayWidth * 0.46)
        listFrame:SetWidth(listWidth)
        detailFrame:ClearAllPoints()
        detailFrame:SetPoint("TOPLEFT", listFrame, "TOPRIGHT", 6, 0)
        detailFrame:SetPoint("BOTTOMRIGHT", overlay, "BOTTOMRIGHT", 0, 0)
        detailFrame:Show()
        RefreshDetail()
    else
        listFrame:SetPoint("TOPRIGHT", overlay, "TOPRIGHT", 0, 0)
        listFrame:SetPoint("BOTTOMRIGHT", overlay, "BOTTOMRIGHT", 0, 0)
        listWidth = overlayWidth
        if detailFrame then detailFrame:Hide() end
    end
    -- size the scroll child NOW instead of trusting OnSizeChanged timing:
    -- rows anchor to both content edges, so a stale 1px width collapses
    -- every row into invisibility
    scrollContent:SetWidth(math.max(1, listWidth - 30))
end

-- ---------------------------------------------------------------- overlay

local function EnsureOverlay()
    if overlay then return end
    overlay = CreateFrame("Frame", "ProfessionTipsBrowser", UIParent)
    overlay:EnableMouse(true) -- block the widgets underneath
    overlay:EnableMouseWheel(true) -- swallow wheel outside our own scroll
    overlay:SetScript("OnMouseWheel", function() end)
    overlay:Hide()
    -- fully OPAQUE, dark-textured background (the WhatsTraining/PetTips
    -- look; user request 2026-08-05): black underlay for guaranteed
    -- opacity + tiled dark marble on top. The tooltip background texture
    -- tried first has translucency baked in - do not go back to it.
    local underlay = overlay:CreateTexture(nil, "BACKGROUND", nil, -1)
    underlay:SetAllPoints()
    underlay:SetColorTexture(0, 0, 0, 1)
    -- the host paints it: dark marble on the classic windows, the
    -- profession window's own background art on Forever
    overlay.bg = overlay:CreateTexture(nil, "BACKGROUND")
    overlay.bg:SetAllPoints()

    -- header: skill level + search + show-known toggle
    local header = CreateFrame("Frame", nil, overlay)
    header:SetPoint("TOPLEFT", 8, -6)
    header:SetPoint("TOPRIGHT", -8, -6)
    header:SetHeight(30)
    overlay.header = header

    overlay.skillText = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    overlay.skillText:SetPoint("LEFT", 2, 0)

    -- search stretches from the skill text to the header's right edge;
    -- every toggle lives in the filter bar below (user request 2026-08-06)
    searchBox = CreateFrame("EditBox", "ProfessionTipsBrowserSearch", header, "SearchBoxTemplate")
    searchBox:SetHeight(22)
    searchBox:SetPoint("LEFT", overlay.skillText, "RIGHT", 18, 0)
    searchBox:SetPoint("RIGHT", header, "RIGHT", -4, 0)
    searchBox:SetAutoFocus(false)
    searchBox:SetScript("OnTextChanged", function(self)
        if SearchBoxTemplate_OnTextChanged then SearchBoxTemplate_OnTextChanged(self) end
        local text = strlower(strtrim(self:GetText() or ""))
        if text ~= searchFilter then
            searchFilter = text
            BuildDisplayList()
            RefreshRows()
        end
    end)

    -- ---- quick filter bar: source kinds, faction, known -------------
    -- Buttons size themselves to their (localized) label and flow-wrap,
    -- so the bar fits the default 384px window and spreads out on wide
    -- ones without a second layout.
    filterBar = CreateFrame("Frame", nil, overlay)
    filterBar:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -2)
    filterBar:SetPoint("TOPRIGHT", header, "BOTTOMRIGHT", 0, -2)
    filterBar:SetHeight(FILTER_ROW_HEIGHT)

    local function StyleToggle(btn, active)
        if active then
            btn:LockHighlight()
            btn:GetFontString():SetTextColor(1, 1, 1)
        else
            btn:UnlockHighlight()
            btn:GetFontString():SetTextColor(0.5, 0.5, 0.5)
        end
    end

    local function NewFilterButton(label, tooltip, onClick)
        local btn = CreateFrame("Button", nil, filterBar, "UIPanelButtonTemplate")
        btn:SetHeight(19)
        btn:SetText(label)
        btn:SetNormalFontObject(GameFontNormalSmall)
        btn:SetHighlightFontObject(GameFontHighlightSmall)
        btn:SetWidth(math.max(34, btn:GetFontString():GetStringWidth() + 14))
        btn:SetScript("OnClick", function(self)
            onClick(self)
            -- full refresh: re-runs LayoutFilterBar, which re-Syncs every
            -- button's highlight and the faction button's label/width.
            -- (bugfix 2026-08-06: the styling only updated on reopen)
            RefreshBrowserList()
        end)
        btn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:AddLine(tooltip, 1, 1, 1, true)
            GameTooltip:Show()
        end)
        btn:SetScript("OnLeave", function() GameTooltip:Hide() end)
        filterButtons[#filterButtons + 1] = btn
        return btn
    end

    -- one toggle per source kind, colored like the row tags
    for _, kind in ipairs(FILTER_KINDS) do
        local btn = NewFilterButton(SourceWord(kind),
            (L["Show recipes from this source (%s)"]):format(SourceWord(kind)),
            function()
                local f = ns.db.browserFilters
                f[kind] = not f[kind]
            end)
        btn.kind = kind
        btn.Sync = function(self)
            StyleToggle(self, ns.db.browserFilters[self.kind])
        end
    end

    -- faction: dropdown with one checkbox per faction (recipes both
    -- factions can get are always listed)
    do
        -- menu API: the modern MenuUtil on Forever (the legacy dropdown is
        -- deprecated on the Retail engine), the classic UIDropDownMenu
        -- elsewhere, a plain cycle when neither exists
        local useMenuUtil = MenuUtil and MenuUtil.CreateContextMenu
            and (ns.isForever or not UIDropDownMenu_Initialize)
        local dropdown
        if not useMenuUtil and UIDropDownMenu_Initialize then
            local ok, frame = pcall(CreateFrame, "Frame", "ProfessionTipsBrowserFactionMenu",
                filterBar, "UIDropDownMenuTemplate")
            if ok then
                dropdown = frame
                dropdown:Hide()
            end
        end
        local btn
        local function InitMenu(_, level)
            if not UIDropDownMenu_CreateInfo then return end
            for _, faction in ipairs({ "Alliance", "Horde" }) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = (FACTION_ICON[faction] or "") .. " " .. FactionName(faction)
                info.isNotRadio = true
                info.keepShownOnClick = true
                info.checked = ns.BrowserFactionShown(faction)
                info.func = function()
                    ns.BrowserToggleFaction(faction)
                    RefreshBrowserList()
                end
                UIDropDownMenu_AddButton(info, level)
            end
        end
        if dropdown then
            UIDropDownMenu_Initialize(dropdown, InitMenu, "MENU")
        end

        btn = NewFilterButton(L["Faction"],
            L["Which faction-exclusive recipes to list. Recipes both factions can obtain are always shown."],
            function(self)
                if useMenuUtil then
                    MenuUtil.CreateContextMenu(self, function(_, root)
                        for _, faction in ipairs({ "Alliance", "Horde" }) do
                            root:CreateCheckbox((FACTION_ICON[faction] or "") .. " " .. FactionName(faction),
                                function() return ns.BrowserFactionShown(faction) end,
                                function()
                                    ns.BrowserToggleFaction(faction)
                                    RefreshBrowserList()
                                end)
                        end
                    end)
                elseif dropdown and ToggleDropDownMenu then
                    ToggleDropDownMenu(1, nil, dropdown, self, 0, 0)
                else -- no dropdown API: cycle mine -> both -> none
                    local a, h = ns.BrowserFactionShown("Alliance"), ns.BrowserFactionShown("Horde")
                    if a and h then
                        ns.db.browserFactions = { Alliance = false, Horde = false }
                    elseif not a and not h then
                        ns.db.browserFactions = nil
                    else
                        ns.db.browserFactions = { Alliance = true, Horde = true }
                    end
                end
            end)
        btn.Sync = function(self)
            local marks = ""
            for _, faction in ipairs({ "Alliance", "Horde" }) do
                if ns.BrowserFactionShown(faction) then
                    marks = marks .. (FACTION_ICON[faction] or "")
                end
            end
            if marks == "" then marks = "|cff909090" .. L["none"] .. "|r" end
            self:SetText(L["Faction"] .. ": " .. marks)
            self:SetWidth(math.max(34, self:GetFontString():GetStringWidth() + 16))
            -- highlighted while anything but the plain "my faction" set
            local mine = ns.db.browserFactions ~= nil
            StyleToggle(self, mine)
        end
    end

    -- known recipes (moved out of the header, user request 2026-08-06)
    do
        local btn = NewFilterButton(L["Known"], L["Also list recipes you already know."],
            function() ns.db.browserShowKnown = not ns.db.browserShowKnown end)
        btn.Sync = function(self) StyleToggle(self, ns.db.browserShowKnown) end
    end

    -- list block: scroll frame with the row pool
    listFrame = CreateFrame("Frame", nil, overlay)

    scrollFrame = CreateFrame("ScrollFrame", "ProfessionTipsBrowserScroll", listFrame,
        "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 4, -2)
    scrollFrame:SetPoint("BOTTOMRIGHT", -26, 4)
    scrollContent = CreateFrame("Frame", nil, scrollFrame)
    scrollContent:SetSize(1, 1)
    scrollFrame:SetScrollChild(scrollContent)
    scrollFrame:SetScript("OnSizeChanged", function(self, width)
        scrollContent:SetWidth(width)
    end)

    -- async data arriving while the browser is open: reagent names
    -- (GET_ITEM_INFO_RECEIVED) and spell icons requested by RecipeIcon
    -- (SPELL_DATA_LOAD_RESULT, fires once per spell - debounced into one
    -- coalesced refresh instead of hundreds of row rebuilds)
    local refreshPending = false
    overlay:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    overlay:RegisterEvent("SPELL_DATA_LOAD_RESULT")
    overlay:RegisterEvent("MODIFIER_STATE_CHANGED")
    -- quest titles of quest sources (Forever data names quests by id);
    -- guarded: RegisterEvent throws on events a client does not know
    pcall(overlay.RegisterEvent, overlay, "QUEST_DATA_LOAD_RESULT")
    overlay:SetScript("OnEvent", function(_, event)
        -- pressing/releasing Shift while hovering a row swaps between
        -- the recipe info and the crafted item's tooltip live
        if event == "MODIFIER_STATE_CHANGED" then
            if hoveredRow and hoveredRow.entry and hoveredRow:IsMouseOver() then
                UpdateRowTooltip(hoveredRow)
            end
            return
        end
        if refreshPending or not overlay:IsShown() then return end
        refreshPending = true
        C_Timer.After(0.25, function()
            refreshPending = false
            if overlay:IsShown() then
                RefreshRows()
                if detailFrame and detailFrame:IsShown() then RefreshDetail() end
                -- re-render an open row tooltip too - reagent names may
                -- have just resolved (live finding 2026-08-06)
                if hoveredRow and hoveredRow.entry and hoveredRow:IsMouseOver()
                    and GameTooltip:IsShown() then
                    UpdateRowTooltip(hoveredRow)
                end
            end
        end)
    end)
end

local function AttachOverlay(host)
    EnsureOverlay()
    activeHost = host
    hosts[host].attach(overlay, host)
end

-- The whole show/refresh path runs inside button/event handlers where the
-- game swallows errors silently (scriptErrors off by default) - report
-- them to chat instead so a broken browser is diagnosable in the field.
local function Guarded(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        print("|cff33ff99ProfessionTips|r browser error: " .. tostring(err))
    end
end

local function RefreshBrowser()
    if not overlay or not overlay:IsShown() or not activeProf then return end
    overlay.skillText:SetText(("%s |cffffffff%d/%d|r"):format(
        RecipeName(activeProf.skillSpell), activeSkill or 0, activeMax or 0))
    ApplyLayout() -- sizes first: rows anchor to the scroll child's edges
    BuildDisplayList()
    RefreshRows()
    if detailFrame and detailFrame:IsShown() then RefreshDetail() end
end

-- assigns the forward-declared local: rebuild the list and redraw (used
-- by the dismiss/collapse handlers, which change list CONTENT)
function RefreshBrowserList()
    if not overlay or not overlay:IsShown() then return end
    ApplyLayout()
    BuildDisplayList()
    RefreshRows()
    if detailFrame and detailFrame:IsShown() then RefreshDetail() end
end

local function SetOpen(info, open)
    info.open = open
    info.tab:SetChecked(open)
end

local function ShowBrowser(host)
    AttachOverlay(host)
    selectedSpell = nil
    overlay:Show()
    SetOpen(hosts[host], true)
    if hosts[host].onShow then hosts[host].onShow() end
    RefreshBrowser()
end

local function HideBrowser()
    if overlay then overlay:Hide() end
    local info = activeHost and hosts[activeHost]
    if info and info.tab then SetOpen(info, false) end
end

-- ---------------------------------------------------------------- hosts
--
-- A host is a Blizzard profession window the browser docks into:
--   tab            our side tab on that window
--   resolve()      -> prof (PROFESSIONS entry), rank, maxRank of the
--                  profession the window shows, or nil
--   available()    extra visibility rule for the tab (optional)
--   attach(o, h)   parent / anchor / paint the overlay over the window
--   layout(o,h,w)  re-anchor on resize (optional), isWide(h), fallbackWidth(h)
-- We only ever ANCHOR to Blizzard's frames, hook their scripts and read
-- their state - never call into or write onto them (taint: the profession
-- windows run protected craft actions).

local function UpdateHost(host)
    local info = hosts[host]
    if not info then return end
    local prof, rank, maxRank = info.resolve()
    if prof and ns.db.recipeBrowser and (not info.available or info.available()) then
        activeProf, activeSkill, activeMax = prof, rank or 0, maxRank or 0
        if info.position then info.position() end
        info.tab:Show()
        if info.open then
            if not overlay or not overlay:IsShown() or activeHost ~= host then
                Guarded(ShowBrowser, host)
            else
                Guarded(RefreshBrowser)
            end
        end
    else
        info.tab:Hide()
        if activeHost == host and overlay and overlay:IsShown() then
            HideBrowser()
        end
        if not prof and activeHost == host then activeProf = nil end
    end
end

local function ToggleHost(host)
    local info = hosts[host]
    if info.open then
        HideBrowser()
    else
        SetOpen(info, true)
        Guarded(UpdateHost, host)
    end
end

-- ---- classic: TradeSkillFrame / CraftFrame (Era, TBC)

local function PaintMarble(o)
    -- fully OPAQUE, dark-textured background (the WhatsTraining/PetTips
    -- look; user request 2026-08-05): black underlay for guaranteed
    -- opacity + tiled dark marble on top. The tooltip background texture
    -- tried first has translucency baked in - do not go back to it.
    o.bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble", "REPEAT", "REPEAT")
    o.bg:SetHorizTile(true)
    o.bg:SetVertTile(true)
    o.bg:SetVertexColor(0.5, 0.5, 0.5, 1) -- darken toward the WhatsTraining tone
end

local function ClassicResolver(getLine)
    return function()
        local name, rank, maxRank = getLine()
        return MatchProfession(name), rank, maxRank
    end
end

local function CreateClassicTab(host, getLine)
    if hosts[host] then return end
    local tab = CreateFrame("CheckButton", nil, host, "SpellBookSkillLineTabTemplate")
    -- right edge of the window; the relative anchor follows wide skins
    -- (Leatrix resizes the frame, the tab keeps hugging the edge)
    tab:SetPoint("TOPLEFT", host, "TOPRIGHT", -33, -46)
    tab:SetNormalTexture("Interface\\Icons\\INV_Misc_Book_09")
    tab.tooltip = L["Available & upcoming recipes"]
    tab:Hide()
    tab:SetScript("OnClick", function(self)
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        -- the CheckButton flipped itself already; ToggleHost decides
        self:SetChecked(hosts[host].open)
        ToggleHost(host)
    end)
    hosts[host] = {
        tab = tab,
        resolve = ClassicResolver(getLine),
        isWide = function(h) return h:GetWidth() >= WIDE_THRESHOLD end,
        fallbackWidth = function(h) return (h:GetWidth() or 384) - 60 end,
        attach = function(o, h)
            PaintMarble(o)
            o:SetParent(h)
            o:SetFrameStrata("HIGH")
            o:ClearAllPoints()
            -- covers the frame's content area in both the default skin and
            -- wide skins: below the title/rank area, above the bottom
            -- button row, inside the side borders
            o:SetPoint("TOPLEFT", h, "TOPLEFT", 22, -70)
            o:SetPoint("BOTTOMRIGHT", h, "BOTTOMRIGHT", -38, 80)
            o:SetFrameLevel(h:GetFrameLevel() + 20)
        end,
        layout = function(o, h, wide)
            -- the default frame's content area ends above the bottom button
            -- row (+80 verified in game); widened frames (Leatrix) grow the
            -- list well below that line, so cover everything down to the
            -- border - the craft buttons are useless while browsing anyway
            -- (live finding 2026-08-05: a strip of the real list stayed
            -- visible)
            o:SetPoint("BOTTOMRIGHT", h, "BOTTOMRIGHT", -38, wide and 48 or 80)
        end,
    }
    host:HookScript("OnHide", function() HideBrowser() end)
    host:HookScript("OnSizeChanged", function()
        if overlay and overlay:IsShown() and activeHost == host then
            ApplyLayout()
        end
    end)
end

local function TryHookTrade()
    if TradeSkillFrame and not hosts[TradeSkillFrame] then
        CreateClassicTab(TradeSkillFrame, TradeLine)
    end
end

local function TryHookCraft()
    if CraftFrame and not hosts[CraftFrame] then
        CreateClassicTab(CraftFrame, CraftLine)
    end
end

local function InitClassic()
    local watcher = CreateFrame("Frame")
    watcher:RegisterEvent("ADDON_LOADED")
    watcher:RegisterEvent("TRADE_SKILL_SHOW")
    watcher:RegisterEvent("TRADE_SKILL_UPDATE")
    watcher:RegisterEvent("TRADE_SKILL_CLOSE")
    watcher:RegisterEvent("CRAFT_SHOW")
    watcher:RegisterEvent("CRAFT_UPDATE")
    watcher:RegisterEvent("CRAFT_CLOSE")
    watcher:SetScript("OnEvent", function(_, event, arg1)
        if event == "ADDON_LOADED" then
            if arg1 == "Blizzard_TradeSkillUI" then TryHookTrade()
            elseif arg1 == "Blizzard_CraftUI" then TryHookCraft() end
            return
        end
        if event == "TRADE_SKILL_SHOW" or event == "TRADE_SKILL_UPDATE" then
            TryHookTrade()
            if TradeSkillFrame then UpdateHost(TradeSkillFrame) end
        elseif event == "CRAFT_SHOW" or event == "CRAFT_UPDATE" then
            TryHookCraft()
            if CraftFrame then UpdateHost(CraftFrame) end
        elseif event == "TRADE_SKILL_CLOSE" or event == "CRAFT_CLOSE" then
            -- OnHide of the host frame already hides the overlay; this
            -- catches the case where the frame stays shown but empties
            if overlay and overlay:IsShown() then HideBrowser() end
        end
    end)
    -- a /reload with the profession window open: the Blizzard UIs load
    -- before us, so the ADDON_LOADED above never fires for them
    TryHookTrade()
    TryHookCraft()
end

-- ---- WoW Forever: ProfessionsFrame (Blizzard_Professions)
--
-- Forever replaced the trade skill window with Retail's profession
-- window: one frame for every profession, a column of profession tabs on
-- its right edge (overview + one per profession), the crafting page
-- (recipe list left, schematic right) below a header strip with the
-- skill bar. Our tab joins the bottom of that column; our page covers
-- the crafting page BELOW the header strip, so the profession's name and
-- skill bar stay visible - the list belongs to the profession on screen.
-- Clicking any native profession tab returns to Blizzard's view.

-- Retail-style child skill lines (expansion tiers) -> classic parent line
local FOREVER_PARENT_LINE = {
    [2937] = 171, [2938] = 164, [2939] = 185, [2940] = 333, [2941] = 202,
    [2942] = 129, [2945] = 165, [2946] = 186, [2948] = 197,
}

local function ProfessionBySkillLine(line)
    line = FOREVER_PARENT_LINE[line] or line
    for _, prof in ipairs(Professions()) do
        if prof.skillLine == line and ns[prof.recipes] then return prof end
    end
end
ns.BrowserProfessionBySkillLine = ProfessionBySkillLine -- exposed for tests

local function SafeCall(fn, ...)
    if not fn then return nil end
    local ok, a = pcall(fn, ...)
    if ok then return a end
end

local function ForeverResolve()
    local tsui = C_TradeSkillUI
    if not tsui then return nil end
    -- someone else's linked / guild profession, NPC crafting: not ours
    if SafeCall(tsui.IsTradeSkillLinked) or SafeCall(tsui.IsTradeSkillGuild)
        or SafeCall(tsui.IsNPCCrafting) then
        return nil
    end
    local base = SafeCall(tsui.GetBaseProfessionInfo)
    -- _G: RecipeBrowser's own local Professions() shadows Blizzard's table
    local blizz = _G.Professions
    local line = blizz and SafeCall(blizz.GetEffectiveSkillLineID)
    if not line or line == 0 then line = base and base.professionID end
    local prof = line and ProfessionBySkillLine(line)
    if not prof then return nil end
    local rank, maxRank
    local info = C_SkillInfo and SafeCall(C_SkillInfo.GetSkillLineInfoByID, prof.skillLine)
    if info and (info.maxRank or 0) > 0 then
        rank, maxRank = info.rank, info.maxRank
    elseif base then
        rank, maxRank = base.skillLevel, base.maxSkillLevel
    end
    return prof, rank, maxRank
end
ns.BrowserForeverResolve = ForeverResolve -- exposed for tests

local function PaintProfession(o)
    -- the profession window's own background, darkened for legible rows;
    -- marble if the atlas ever goes away
    if o.bg.SetAtlas and o.bg:SetAtlas("Profession-Background-Overview") then
        o.bg:SetHorizTile(false)
        o.bg:SetVertTile(false)
        o.bg:SetVertexColor(0.55, 0.55, 0.55, 1)
    else
        PaintMarble(o)
    end
end

-- What's Training (by Sveng) docks its own all-professions page into the
-- same window. Two pages over one window would stack, so each closes the
-- other: we watch its page, and close it through its own return tab.
local function CloseWhatsTraining()
    local page, back = _G.WhatsTrainingCraftingPage, _G.WhatsTrainingCraftingReturnTab
    if page and page:IsShown() and back and back.customMouseUpHandler then
        pcall(back.customMouseUpHandler, back, "LeftButton", true)
    end
end

local function HookForever()
    local book = ProfessionsFrame
    if not book or hosts[book] or not book.CraftingPage then return end
    local page = book.CraftingPage

    local tab = CreateFrame("Frame", "ProfessionTipsProfessionsTab", book, "LargeSideTabButtonTemplate")
    tab:Hide()
    tab:EnableMouse(true)
    tab.Icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    tab:SetFillToInterior(true)
    tab:SetChecked(false)
    tab.tooltipText = L["Available & upcoming recipes"]
    tab:SetCustomOnMouseUpHandler(function(_, button, upInside)
        if button == "LeftButton" and upInside then ToggleHost(book) end
    end)

    hosts[book] = {
        tab = tab,
        resolve = ForeverResolve,
        available = function()
            -- the crafting page of a profession, not the overview book,
            -- and not the minimized (recipe-only) layout
            return book:IsShown() and page:IsShown()
                and not (book.BookPage and book.BookPage:IsShown())
                and not (ProfessionsUtil and SafeCall(ProfessionsUtil.IsCraftingMinimized))
        end,
        position = function()
            -- below the last profession tab shown in the right-edge column
            local last = book.ProfessionsOverviewTab
            for _, t in ipairs(book.rightProfessionTabs or {}) do
                if t:IsShown() then last = t end
            end
            tab:ClearAllPoints()
            if last then
                tab:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, -14)
            else
                tab:SetPoint("TOPLEFT", book, "TOPRIGHT", 0, -60)
            end
        end,
        isWide = function() return true end,
        fallbackWidth = function(h) return (h:GetWidth() or 750) - 12 end,
        attach = function(o, h)
            PaintProfession(o)
            o:SetParent(h)
            o:SetFrameStrata(h:GetFrameStrata())
            o:ClearAllPoints()
            -- below the header strip (skill bar, tool slots), the area of
            -- the recipe list + schematic (RecipeList sits at 5,-72)
            o:SetPoint("TOPLEFT", page, "TOPLEFT", 4, -70)
            o:SetPoint("BOTTOMRIGHT", page, "BOTTOMRIGHT", -4, 4)
            o:SetFrameLevel(math.min(page:GetFrameLevel() + 400, 9000))
        end,
        onShow = CloseWhatsTraining,
    }

    -- What's Training's page opening closes ours (looked up lazily: it
    -- may build its page after us)
    local wtHooked = false
    local function refresh()
        local wtPage = _G.WhatsTrainingCraftingPage
        if not wtHooked and wtPage then
            wtHooked = true
            wtPage:HookScript("OnShow", function()
                if hosts[book].open then HideBrowser() end
            end)
        end
        Guarded(UpdateHost, book)
    end
    -- deferred one frame: Blizzard switches pages / tabs in the same
    -- handlers that fire these callbacks
    local queued = false
    local function request()
        if queued then return end
        queued = true
        C_Timer.After(0, function()
            queued = false
            refresh()
        end)
    end
    local function closeAndRefresh()
        if hosts[book].open then HideBrowser() end
        request()
    end

    if EventRegistry and EventRegistry.RegisterCallback then
        EventRegistry:RegisterCallback("ProfessionsFrame.Show", request, tab)
        EventRegistry:RegisterCallback("ProfessionsFrame.Hide", function() HideBrowser() end, tab)
        EventRegistry:RegisterCallback("Professions.ProfessionSelected", request, tab)
    end
    book:HookScript("OnHide", function() HideBrowser() end)
    page:HookScript("OnShow", request)
    page:HookScript("OnHide", request)
    if book.BookPage then book.BookPage:HookScript("OnShow", closeAndRefresh) end
    -- any native profession tab = back to Blizzard's own view
    local native = { book.ProfessionsOverviewTab }
    for _, t in ipairs(book.rightProfessionTabs or {}) do native[#native + 1] = t end
    for _, t in ipairs(native) do
        t:HookScript("OnMouseUp", function(_, button)
            if button == "LeftButton" and hosts[book].open then HideBrowser() end
        end)
    end

    local events = CreateFrame("Frame")
    for _, event in ipairs({ "SKILL_LINES_CHANGED", "NEW_RECIPE_LEARNED",
        "TRADE_SKILL_LIST_UPDATE", "SPELLS_CHANGED" }) do
        pcall(events.RegisterEvent, events, event)
    end
    events:SetScript("OnEvent", function()
        if book:IsShown() then request() end
    end)
    request()
end

local function InitForever()
    if ProfessionsFrame then
        HookForever()
        return
    end
    local watcher = CreateFrame("Frame")
    watcher:RegisterEvent("ADDON_LOADED")
    watcher:SetScript("OnEvent", function(self, _, name)
        if name == "Blizzard_Professions" then
            self:UnregisterEvent("ADDON_LOADED")
            -- What's Training hooks the same addon load; let it finish so
            -- its page exists when we look for it
            C_Timer.After(0, HookForever)
        end
    end)
end

-- ---------------------------------------------------------------- init

ns.OnInit(function()
    -- one-time migration of the old mine/all/neutral cycle setting to
    -- the per-faction checkboxes (2026-08-06)
    local old = ns.db.browserFaction
    if old ~= nil then
        if old == "all" then
            ns.db.browserFactions = { Alliance = true, Horde = true }
        elseif old == "neutral" then
            ns.db.browserFactions = { Alliance = false, Horde = false }
        end -- "mine" is the nil default
        ns.db.browserFaction = nil
    end

    if ns.isForever then
        -- no TradeSkillFrame / CraftFrame there (and CRAFT_* registration
        -- throws): the browser docks into the Retail profession window
        InitForever()
    else
        InitClassic()
    end
end)

-- options callback: hide the tabs (and the open browser) when disabled
function ns.UpdateRecipeBrowser()
    for host in pairs(hosts) do
        UpdateHost(host)
    end
end
