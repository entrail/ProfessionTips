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

-- Builds the section model for one profession at a given skill rank:
--   { available = {entry...}, upcoming = {...}, known = {...} }
-- entry = { spell, req, recipe, sources, learned }; sections sorted by
-- required skill (then spell ID for a stable order). Faction-locked
-- recipes are skipped entirely (same rule as the tooltips).
function ns.BuildBrowserModel(prof, skill)
    local recipes = ns[prof.recipes]
    local sources = ns[prof.prefix .. "_SOURCES"]
    if not recipes then return nil end
    local faction = UnitFactionGroup("player")
    local model = { available = {}, upcoming = {}, known = {} }
    for spellId, recipe in pairs(recipes) do
        local locked = ns.RECIPE_FACTION and ns.RECIPE_FACTION[spellId]
        if not (locked and faction and locked ~= faction) then
            local entry = {
                spell = spellId,
                req = recipe.orange,
                recipe = recipe,
                sources = sources and sources[spellId],
                learned = IsPlayerSpell(spellId),
            }
            if entry.learned then
                model.known[#model.known + 1] = entry
            elseif entry.req <= skill then
                model.available[#model.available + 1] = entry
            else
                model.upcoming[#model.upcoming + 1] = entry
            end
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

-- ---------------------------------------------------------------- state

local module = {}
ns.RecipeBrowser = module

local hosts = {} -- host frame -> { tab, getLine } (TradeSkillFrame / CraftFrame)
local overlay, listFrame, scrollFrame, scrollContent, detailFrame
local searchBox, showKnownCheck
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
        -- nil until the item cache answers; GET_ITEM_INFO_RECEIVED refreshes
        local name = GetItemInfo(r.id)
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
    GameTooltip:Show()
end

local RefreshDetail -- forward declaration

local function OnRowClick(self)
    local entry = self.entry
    if not entry then return end
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
            ShowRecipeTooltip(self.entry, self)
        end
    end)
    row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    row:SetScript("OnClick", OnRowClick)
    rows[i] = row
    return row
end

-- ---------------------------------------------------------------- list

local function MatchesSearch(entry)
    if searchFilter == "" then return true end
    return strfind(strlower(RecipeName(entry.spell)), searchFilter, 1, true) ~= nil
end

local function BuildDisplayList()
    wipe(displayList)
    if not activeProf then return end
    local model = ns.BuildBrowserModel(activeProf, activeSkill or 0)
    if not model then return end

    local function AddSection(headerText, list, color)
        local headerItem -- keep the header handle; #displayList moves on
        for _, entry in ipairs(list) do
            if MatchesSearch(entry) then
                if not headerItem then
                    headerItem = { header = headerText, count = 0 }
                    displayList[#displayList + 1] = headerItem
                end
                headerItem.count = headerItem.count + 1
                displayList[#displayList + 1] = { entry = entry, color = color }
            end
        end
    end

    AddSection(L["Available now"], model.available, "available")
    AddSection(L["Coming up"], model.upcoming, "upcoming")
    if ns.db.browserShowKnown then
        AddSection(L["Already known"], model.known, "known")
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
            row.selected:Hide()
            row.icon:SetTexture(nil)
            row.text:SetPoint("LEFT", row.icon, "RIGHT", -14, 0) -- headers start at the row edge
            row.text:SetText(("%s (%d)"):format(item.header, item.count))
            row.text:SetTextColor(0.95, 0.85, 0.4)
            row.right:SetText("")
        else
            local entry = item.entry
            row.entry = entry
            row.selected:SetShown(detailFrame and detailFrame:IsShown()
                and entry.spell == selectedSpell)
            row.icon:SetTexture(RecipeIcon(entry.spell))
            row.text:SetPoint("LEFT", row.icon, "RIGHT", 4, 0)
            row.text:SetTextColor(1, 1, 1)
            if item.color == "upcoming" then
                row.text:SetText(RecipeName(entry.spell))
            else
                -- available AND known: the difficulty color at the
                -- current skill, matching the detail pane's recipe name
                -- (user request 2026-08-06 - known rows were flat grey)
                local diff = mod.DifficultyAt(activeSkill or 0, entry.recipe)
                row.text:SetText(("|c%s%s|r"):format(
                    mod.DIFFICULTY_COLOR[diff], RecipeName(entry.spell)))
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
    listFrame:ClearAllPoints()
    listFrame:SetPoint("TOPLEFT", overlay, "TOPLEFT", 0, -38) -- below the header row
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

    showKnownCheck = CreateFrame("CheckButton", "ProfessionTipsBrowserShowKnown",
        header, "UICheckButtonTemplate")
    showKnownCheck:SetSize(24, 24)
    showKnownCheck:SetPoint("RIGHT", header, "RIGHT", -70, 0)

    -- stretches between the skill text and the Known toggle, so it
    -- shrinks instead of colliding on the default 384px frame
    searchBox = CreateFrame("EditBox", "ProfessionTipsBrowserSearch", header, "SearchBoxTemplate")
    searchBox:SetHeight(22)
    searchBox:SetPoint("LEFT", overlay.skillText, "RIGHT", 18, 0)
    searchBox:SetPoint("RIGHT", showKnownCheck, "LEFT", -12, 0)
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
    local label = _G[showKnownCheck:GetName() .. "Text"]
    if label then
        label:SetText(L["Known"])
        label:SetFontObject(GameFontNormalSmall)
    end
    showKnownCheck:SetChecked(ns.db.browserShowKnown)
    showKnownCheck:SetScript("OnClick", function(self)
        ns.db.browserShowKnown = self:GetChecked() and true or false
        BuildDisplayList()
        RefreshRows()
    end)

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
    overlay:SetScript("OnEvent", function()
        if refreshPending or not overlay:IsShown() then return end
        refreshPending = true
        C_Timer.After(0.25, function()
            refreshPending = false
            if overlay:IsShown() then
                RefreshRows()
                if detailFrame and detailFrame:IsShown() then RefreshDetail() end
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
