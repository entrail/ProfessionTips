local ADDON_NAME, ns = ...
local L = ns.L

-- Wrath's Interface Options panel. This deliberately lives apart from the
-- modern Settings implementation in Options.lua.
ns.OnInit(function()
    local panel = CreateFrame("Frame", "ProfessionTipsWrathOptions")
    panel.name = ADDON_NAME
    ns.settingsCategory = panel

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(ADDON_NAME)

    local scroll = CreateFrame("ScrollFrame", "ProfessionTipsWrathOptionsScroll", panel,
        "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 8, -44)
    scroll:SetPoint("BOTTOMRIGHT", -28, 10)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetWidth(560)
    content:SetHeight(940)
    scroll:SetScrollChild(content)

    local y = -4
    local controls = {}
    local checkCount = 0

    local function AddHeader(text)
        local label = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        label:SetPoint("TOPLEFT", 8, y)
        label:SetText(text)
        y = y - 26
    end

    local function AddCheck(key, text, tooltip, indent, enabledWhen)
        checkCount = checkCount + 1
        local name = "ProfessionTipsWrathCheck" .. checkCount
        local check = CreateFrame("CheckButton", name, content, "InterfaceOptionsCheckButtonTemplate")
        check:SetPoint("TOPLEFT", 8 + (indent or 0), y)
        _G[name .. "Text"]:SetText(text)
        check.tooltipText = tooltip
        check:SetScript("OnClick", function(self)
            ns.db[key] = self:GetChecked() and true or false
            if panel.refresh then panel.refresh() end
        end)
        controls[#controls + 1] = function()
            check:SetChecked(ns.db[key])
            local enabled = not enabledWhen or enabledWhen()
            if enabled then check:Enable() else check:Disable() end
        end
        y = y - 28
    end

    AddHeader(L["Professions"])
    for _, prof in ipairs(ns.ProfessionTips.PROFESSIONS) do
        if ns[prof.recipes] then
            local profName = GetSpellInfo(prof.skillSpell) or prof.dbKey
            AddCheck(prof.dbKey, profName,
                L["Adds this profession's recipes an item is used in to its tooltip, with the skill range that still gives points and whether you know the recipe."])
            AddCheck(prof.dbKey .. "OnlyLearned", L["Only learned recipes"],
                L["List only recipes this character has already learned. Unlearned recipes still count for the header's accumulated skill range and the '+N more' summary."],
                24, function() return ns.db[prof.dbKey] end)
        end
    end

    AddHeader(L["Display"])

    local slider = CreateFrame("Slider", "ProfessionTipsWrathMaxLines", content,
        "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", 16, y - 4)
    slider:SetMinMaxValues(0, 35)
    slider:SetValueStep(1)
    _G[slider:GetName() .. "Low"]:SetText("0")
    _G[slider:GetName() .. "High"]:SetText("35")
    slider.tooltipText = L["Recipe lines per profession section. 0 shows only the profession headers with their accumulated skill range; otherwise at least 2 (the lowest- and highest-requirement recipes always appear together). More recipes are summarized as '+N more'."]
    local sliderText = _G[slider:GetName() .. "Text"]
    slider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value + 0.5)
        ns.db.maxLines = value
        local shown = value == 1 and 2 or value
        sliderText:SetText(format(L["Recipes listed per profession: %s"], shown))
    end)
    controls[#controls + 1] = function() slider:SetValue(ns.db.maxLines or 6) end
    y = y - 62

    local modifierLabel = content:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    modifierLabel:SetPoint("TOPLEFT", 8, y)
    modifierLabel:SetText(L["Show only while holding"])
    local dropdown = CreateFrame("Frame", "ProfessionTipsWrathModifier", content,
        "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", 190, y + 8)
    UIDropDownMenu_SetWidth(dropdown, 120)
    local modifierNames = {
        NONE = L["Always show"], SHIFT = SHIFT_KEY_TEXT or "Shift",
        CTRL = CTRL_KEY_TEXT or "Ctrl", ALT = ALT_KEY_TEXT or "Alt",
    }
    UIDropDownMenu_Initialize(dropdown, function()
        for _, value in ipairs({ "NONE", "SHIFT", "CTRL", "ALT" }) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = modifierNames[value]
            info.value = value
            info.func = function()
                ns.db.modifier = value
                UIDropDownMenu_SetSelectedValue(dropdown, value)
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    controls[#controls + 1] = function()
        UIDropDownMenu_SetSelectedValue(dropdown, ns.db.modifier or "NONE")
        UIDropDownMenu_SetText(dropdown, modifierNames[ns.db.modifier or "NONE"])
    end
    y = y - 42

    AddCheck("includeProcessed", L["Include processed materials"],
        L["Raw materials also show the recipes of what they are processed into (cloth into bolts, ore into bars, hides into cured hides, ...), marked with 'via'."])
    AddCheck("showMissing", L["Show for missing professions"],
        L["Also annotates reagents of professions this character does not have (as if at skill 0) - useful to decide what to keep or send to alts."])

    AddHeader(L["About"])
    for _, text in ipairs({
        format(L["Author: %s"], "Entrail09"),
        format(L["Version: %s"], ns.version or "?"),
        L["Wrath client support currently uses profession data through skill 375 only."],
    }) do
        local line = content:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        line:SetPoint("TOPLEFT", 8, y)
        line:SetText(text)
        y = y - 20
    end

    function panel.refresh()
        for _, refresh in ipairs(controls) do refresh() end
    end
    panel:SetScript("OnShow", panel.refresh)
    InterfaceOptions_AddCategory(panel)
end)

local function OpenSettings()
    if not ns.settingsCategory then return end
    InterfaceOptionsFrame_OpenToCategory(ns.settingsCategory)
    -- Wrath sometimes needs a second call to select a newly registered panel.
    InterfaceOptionsFrame_OpenToCategory(ns.settingsCategory)
end

SLASH_PROFESSIONTIPS1 = "/professiontips"
SLASH_PROFESSIONTIPS2 = "/proftips"
SlashCmdList.PROFESSIONTIPS = OpenSettings
