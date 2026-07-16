local ADDON_NAME, ns = ...
local L = ns.L

-- Settings under Settings -> Options -> AddOns using the modern Settings
-- API. One checkbox per profession that has recipe data on this game
-- flavor, plus the shared display options. All settings apply immediately
-- (tooltips read them live), so no refresh callbacks are needed.

ns.OnInit(function()
    local category, layout = Settings.RegisterVerticalLayoutCategory(ADDON_NAME)
    category.ID = ADDON_NAME
    ns.settingsCategory = category

    for _, prof in ipairs(ns.ProfessionTips.PROFESSIONS) do
        if ns[prof.recipes] then -- only professions with data on this flavor
            local profName = GetSpellInfo(prof.skillSpell) or prof.dbKey
            local setting = Settings.RegisterAddOnSetting(
                category,
                "ProfessionTips_" .. prof.dbKey,
                prof.dbKey,
                ns.db,
                Settings.VarType.Boolean,
                format(L["%s reagent tooltips"], profName),
                true
            )
            Settings.CreateCheckbox(category, setting,
                L["Adds this profession's recipes an item is used in to its tooltip, with the skill range that still gives points and whether you know the recipe."])
        end
    end

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
        local options = Settings.CreateSliderOptions(2, 8, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options,
            L["Maximum number of recipe lines per profession section. Recipes beyond the limit are summarized as '+N more recipes give points'."])
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

    -- About
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["About"]))
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
