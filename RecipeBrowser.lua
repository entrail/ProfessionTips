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
-- Locale safety: recipes are spell IDs, names resolved at runtime
-- (GetSpellInfo); vendor/mob names localized via ns.GetNpcName (server
-- query, English data fallback); zone names are shipped English (display
-- only). The open profession is identified by localized-vs-localized
-- name match (profession spell name == GetTradeSkillLine/CraftDisplay
-- name), the same pattern ProfessionTips.lua uses.

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
            learned = IsPlayerSpell(spellId),
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

-- One rendered line per source entry (full text - tooltip + detail pane).
-- Money is colored by affordability, npc names localized on demand.
local function SourceLine(src)
    local kind = SOURCE_ORDER[src.k] and src.k or "u"
    local head = "|c" .. SOURCE_COLOR[kind] .. SourceWord(kind) .. "|r"
    local bits = {}
    -- "t" normally has no npc, but special NPC-teachers (e.g. the BWL
    -- Elementium smelt) ship one - show them like a vendor/dropper
    if src.name and (kind == "t" or kind == "v" or kind == "d") then
        local name = ns.GetNpcName(src.npc, src.name)
        bits[#bits + 1] = name .. (src.zone and (" (" .. src.zone .. ")") or "")
    elseif src.name and kind == "q" then
        bits[#bits + 1] = src.name .. (src.zone and (" (" .. src.zone .. ")") or "")
    elseif src.zone then
        bits[#bits + 1] = src.zone
    end
    if src.cost then
        local money = GetCoinTextureString(src.cost)
        if GetMoney and GetMoney() < src.cost then
            money = "|cffff2020" .. money .. "|r"
        end
        bits[#bits + 1] = money
    end
    if src.limited then bits[#bits + 1] = L["limited stock"] end
    if src.faction then
        bits[#bits + 1] = src.faction == "Alliance" and FACTION_ALLIANCE or FACTION_HORDE
    end
    if #bits == 0 then return head end
    return head .. ": " .. table.concat(bits, " - ")
end
ns.BrowserSourceLine = SourceLine -- exposed for tests

-- Faction colors + the localized faction name (FACTION_ALLIANCE /
-- FACTION_HORDE are localized by the client).
local FACTION_COLOR = { Alliance = "ff4a7fda", Horde = "ffe03030" }

local playerFaction
local function PlayerFaction()
    playerFaction = playerFaction or UnitFactionGroup("player")
    return playerFaction
end

local function FactionName(faction)
    if faction == "Alliance" then return FACTION_ALLIANCE or "Alliance" end
    return FACTION_HORDE or "Horde"
end

-- Compact row badge for faction-locked recipes: the first letter of the
-- localized faction name in faction colors ("A" / "H" - "Allianz",
-- "Alianza", "Horda" all work). Nothing for recipes both factions can
-- obtain. (user request 2026-08-06)
local function FactionMark(entry)
    if not entry.faction then return "" end
    return ("|c%s[%s]|r "):format(FACTION_COLOR[entry.faction] or "ffffffff",
        string.sub(FactionName(entry.faction), 1, 1))
end
ns.BrowserFactionMark = FactionMark -- exposed for tests

-- ---------------------------------------------------------------- state

local module = {}
ns.RecipeBrowser = module

local hosts = {} -- host frame -> { tab, getLine } (TradeSkillFrame / CraftFrame)
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
        if ns[prof.recipes] and GetSpellInfo(prof.skillSpell) == name then
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
    return GetSpellInfo(spellId) or ("spell " .. spellId)
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
        local icon = GetItemIcon and GetItemIcon(product)
        if not icon and GetItemInfoInstant then
            icon = select(5, GetItemInfoInstant(product))
        end
        if icon then return icon end
    end
    local tex = GetSpellTexture(spellId)
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
        GetItemInfo(itemId) -- the query itself triggers the server request
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
        local color = FACTION_COLOR[entry.faction] or "ffffffff"
        local line = ("|c%s%s|r"):format(color,
            (L["%s only"]):format(FactionName(entry.faction)))
        if entry.faction ~= PlayerFaction() then
            line = line .. " - " .. (entry.crossAH
                and L["your faction can only get it traded via the neutral auction house"]
                or L["your faction cannot obtain this recipe"])
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
        local name = GetItemInfo(r.id)
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
    if IsModifiedClick and IsModifiedClick("CHATLINK") and GetSpellLink then
        local link = GetSpellLink(entry.spell)
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
    local mode = ns.db.browserFaction or "mine"
    if mode == "neutral" then
        if entry.faction then return false end
    elseif mode ~= "all" then -- "mine"
        if entry.faction and entry.faction ~= PlayerFaction() then return false end
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
            local link = select(2, GetItemInfo(self.product))
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
    if not overlay or not activeHost then return end
    local wide = activeHost:GetWidth() >= WIDE_THRESHOLD
    -- the default frame's content area ends above the bottom button row
    -- (+80 verified in game); widened frames (Leatrix) grow the list well
    -- below that line, so cover everything down to the border - the
    -- craft buttons are useless while browsing anyway (live finding
    -- 2026-08-05: a strip of the real list stayed visible)
    overlay:SetPoint("BOTTOMRIGHT", activeHost, "BOTTOMRIGHT", -38, wide and 48 or 80)
    local overlayWidth = overlay:GetWidth() or 0
    if overlayWidth == 0 then -- rect not resolved yet this frame
        overlayWidth = (activeHost:GetWidth() or 384) - 60
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
    overlay:SetFrameStrata("HIGH")
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
    local bg = overlay:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble", "REPEAT", "REPEAT")
    bg:SetHorizTile(true)
    bg:SetVertTile(true)
    bg:SetVertexColor(0.5, 0.5, 0.5, 1) -- darken toward the WhatsTraining tone

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
        SearchBoxTemplate_OnTextChanged(self)
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
            BuildDisplayList()
            RefreshRows()
            if detailFrame and detailFrame:IsShown() then RefreshDetail() end
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

    -- faction cycle: mine -> all -> neutral
    do
        local btn = NewFilterButton(L["Faction"], L["Which recipes to list: only what your faction can obtain, all (other-faction ones marked), or only recipes both factions can get."],
            function()
                local order = { mine = "all", all = "neutral", neutral = "mine" }
                ns.db.browserFaction = order[ns.db.browserFaction or "mine"] or "mine"
            end)
        btn.Sync = function(self)
            local mode = ns.db.browserFaction or "mine"
            local text = (mode == "all" and L["Faction: all"])
                or (mode == "neutral" and L["Faction: neutral"])
                or L["Faction: mine"]
            self:SetText(text)
            self:SetWidth(math.max(34, self:GetFontString():GetStringWidth() + 14))
            StyleToggle(self, mode ~= "mine")
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
    overlay:SetParent(host)
    overlay:ClearAllPoints()
    -- covers the frame's content area in both the default skin and wide
    -- skins: below the title/rank area, above the bottom button row,
    -- inside the side borders
    overlay:SetPoint("TOPLEFT", host, "TOPLEFT", 22, -70)
    overlay:SetPoint("BOTTOMRIGHT", host, "BOTTOMRIGHT", -38, 80)
    overlay:SetFrameLevel(host:GetFrameLevel() + 20)
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

local function ShowBrowser(host)
    AttachOverlay(host)
    selectedSpell = nil
    overlay:Show()
    RefreshBrowser()
end

local function HideBrowser()
    if overlay then overlay:Hide() end
    local info = activeHost and hosts[activeHost]
    if info and info.tab then info.tab:SetChecked(false) end
end

-- ---------------------------------------------------------------- tabs

local function UpdateHost(host)
    local info = hosts[host]
    if not info then return end
    local name, rank, maxRank = info.getLine()
    local prof = MatchProfession(name)
    if prof and ns.db.recipeBrowser then
        activeProf, activeSkill, activeMax = prof, rank or 0, maxRank or 0
        info.tab:Show()
        if info.tab:GetChecked() then
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

local function CreateTab(host, getLine)
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
        if self:GetChecked() then
            Guarded(ShowBrowser, host)
        else
            HideBrowser()
        end
    end)
    hosts[host] = { tab = tab, getLine = getLine }
    host:HookScript("OnHide", function() HideBrowser() end)
    host:HookScript("OnSizeChanged", function()
        if overlay and overlay:IsShown() and activeHost == host then
            ApplyLayout()
        end
    end)
end

-- ---------------------------------------------------------------- events

local function TryHookTrade()
    if TradeSkillFrame and not hosts[TradeSkillFrame] then
        CreateTab(TradeSkillFrame, TradeLine)
    end
end

local function TryHookCraft()
    if CraftFrame and not hosts[CraftFrame] then
        CreateTab(CraftFrame, CraftLine)
    end
end

ns.OnInit(function()
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
end)

-- options callback: hide the tabs (and the open browser) when disabled
function ns.UpdateRecipeBrowser()
    for host in pairs(hosts) do
        UpdateHost(host)
    end
end
