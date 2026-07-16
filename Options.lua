local ADDON_NAME, ns = ...
local L = ns.L

-- Settings under Settings -> Options -> AddOns using the modern Settings
-- API, grouped into sections: Professions (one checkbox per profession
-- with data on this game flavor, each with an indented "only learned"
-- child row), Display (shared behavior options), About. All settings apply
-- immediately (tooltips read them live), so no refresh callbacks needed.

ns.OnInit(function()
    local category, layout = Settings.RegisterVerticalLayoutCategory(ADDON_NAME)
    category.ID = ADDON_NAME
    ns.settingsCategory = category

    local function AddHeader(text)
        layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(text))
    end

    -- ----------------------------------------------------------------
    -- Professions
    -- ----------------------------------------------------------------
    AddHeader(L["Professions"])

    for _, prof in ipairs(ns.ProfessionTips.PROFESSIONS) do
        if ns[prof.recipes] then -- only professions with data on this flavor
            local profName = GetSpellInfo(prof.skillSpell) or prof.dbKey
            local setting = Settings.RegisterAddOnSetting(
                category,
                "ProfessionTips_" .. prof.dbKey,
                prof.dbKey,
                ns.db,
                Settings.VarType.Boolean,
                profName,
                true
            )
            local profInitializer = Settings.CreateCheckbox(category, setting,
                L["Adds this profession's recipes an item is used in to its tooltip, with the skill range that still gives points and whether you know the recipe."])

            -- Child row: indented under the profession and greyed out while
            -- the profession is disabled (native dependent-option look).
            local learnedKey = prof.dbKey .. "OnlyLearned"
            local learnedSetting = Settings.RegisterAddOnSetting(
                category,
                "ProfessionTips_" .. learnedKey,
                learnedKey,
                ns.db,
                Settings.VarType.Boolean,
                L["Only learned recipes"],
                false
            )
            local learnedInitializer = Settings.CreateCheckbox(category, learnedSetting,
                L["List only recipes this character has already learned. Unlearned recipes still count for the header's accumulated skill range and the '+N more' summary."])
            learnedInitializer:SetParentInitializer(profInitializer, function()
                return ns.db[prof.dbKey]
            end)
        end
    end

    -- ----------------------------------------------------------------
    -- Display
    -- ----------------------------------------------------------------
    AddHeader(L["Display"])

    do
        local setting = Settings.RegisterAddOnSetting(
            category,
            "ProfessionTips_MaxLines",
            "maxLines",
            ns.db,
            Settings.VarType.Number,
            L["Recipes listed per profession"],
            6
        )
        local options = Settings.CreateSliderOptions(0, 35, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
            if value == 0 then return L["0 (professions only)"] end
            if value == 1 then return "2" end -- 1 acts as 2 (lowest+highest pair)
            return tostring(value)
        end)
        Settings.CreateSlider(category, setting, options,
            L["Recipe lines per profession section. 0 shows only the profession headers with their accumulated skill range; otherwise at least 2 (the lowest- and highest-requirement recipes always appear together). More recipes are summarized as '+N more'."])
    end

    do
        local setting = Settings.RegisterAddOnSetting(
            category,
            "ProfessionTips_Modifier",
            "modifier",
            ns.db,
            Settings.VarType.String,
            L["Show only while holding"],
            "NONE"
        )
        local function GetOptions()
            local options = Settings.CreateControlTextContainer()
            options:Add("NONE", L["Always show"])
            options:Add("SHIFT", SHIFT_KEY_TEXT or "Shift")
            options:Add("CTRL", CTRL_KEY_TEXT or "Ctrl")
            options:Add("ALT", ALT_KEY_TEXT or "Alt")
            return options:GetData()
        end
        Settings.CreateDropdown(category, setting, GetOptions,
            L["Only add the tooltip information while this modifier key is held down."])
    end

    do
        local setting = Settings.RegisterAddOnSetting(
            category,
            "ProfessionTips_IncludeProcessed",
            "includeProcessed",
            ns.db,
            Settings.VarType.Boolean,
            L["Include processed materials"],
            true
        )
        Settings.CreateCheckbox(category, setting,
            L["Raw materials also show the recipes of what they are processed into (cloth into bolts, ore into bars, hides into cured hides, ...), marked with 'via'."])
    end

    do
        local setting = Settings.RegisterAddOnSetting(
            category,
            "ProfessionTips_ShowMissing",
            "showMissing",
            ns.db,
            Settings.VarType.Boolean,
            L["Show for missing professions"],
            false
        )
        Settings.CreateCheckbox(category, setting,
            L["Also annotates reagents of professions this character does not have (as if at skill 0) - useful to decide what to keep or send to alts."])
    end

    -- ----------------------------------------------------------------
    -- About
    -- ----------------------------------------------------------------
    AddHeader(L["About"])
    local function AddAboutLine(text)
        layout:AddInitializer(Settings.CreateElementInitializer(
            "ProfessionTipsSettingsTextTemplate", { name = text }))
    end
    AddAboutLine(format(L["Author: %s"], "Entrail09"))
    AddAboutLine(format(L["Version: %s"], ns.version or "?"))

    Settings.RegisterAddOnCategory(category)
end)

SLASH_PROFESSIONTIPS1 = "/professiontips"
SLASH_PROFESSIONTIPS2 = "/proftips"
SlashCmdList.PROFESSIONTIPS = function()
    if ns.settingsCategory then
        Settings.OpenToCategory(ns.settingsCategory:GetID())
    end
end
