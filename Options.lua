local ADDON_NAME, ns = ...
local L = ns.L

-- Settings under Settings -> Options -> AddOns using the modern Settings
-- API, grouped into sections: Professions (one checkbox per profession
-- with data on this game flavor, each with an indented "only learned"
-- child row), Display (shared behavior options), About. All settings apply
-- immediately (tooltips read them live), so no refresh callbacks needed.

ns.OnInit(function()
    local category, layout = Settings.RegisterVerticalLayoutCategory(ADDON_NAME)
    -- Forever (Retail engine) guards category.ID behind a secure delegate:
    -- writing it there errors; :GetID() works on every client
    if not ns.isForever then category.ID = ADDON_NAME end
    ns.settingsCategory = category

    local function AddHeader(text)
        layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(text))
    end

    -- ----------------------------------------------------------------
    -- Professions
    -- ----------------------------------------------------------------
    AddHeader(L["Professions"])

    -- Per-profession sub-options with an "all professions" master switch
    -- on top. While a master is on, every profession's row reads checked
    -- and is greyed out (the profession's own stored value stays untouched
    -- and comes back when the master is turned off). The rows are proxy
    -- settings: displayed value = master OR own value.
    local SUB_OPTIONS = {
        {
            suffix = "OnlyLearned",
            label = L["Only learned recipes"],
            tooltip = L["List only recipes this character has already learned. Unlearned recipes still count for the header's accumulated skill range and the '+N more' summary."],
            allLabel = L["Only learned recipes (all professions)"],
        },
        {
            suffix = "ShowGray",
            label = L["Show gray recipes"],
            tooltip = L["Also list recipes that no longer give skill points (gray), in the lines left free after the ones that still do - raise 'Recipes listed per profession' to see more of them. When every recipe is gray, they are listed instead of the single 'no skillups' line."],
            allLabel = L["Show gray recipes (all professions)"],
        },
    }
    local subVariables = {} -- suffix -> list of per-profession variables
    for _, sub in ipairs(SUB_OPTIONS) do
        sub.allKey = "all" .. sub.suffix
        subVariables[sub.suffix] = {}
        local setting = Settings.RegisterAddOnSetting(
            category,
            "ProfessionTips_" .. sub.allKey,
            sub.allKey,
            ns.db,
            Settings.VarType.Boolean,
            sub.allLabel,
            false
        )
        Settings.CreateCheckbox(category, setting,
            sub.tooltip .. "\n\n" .. L["Applies to every profession; the per-profession checkboxes are locked while this is on."])
        -- the profession rows show master OR own value: re-read them
        Settings.SetOnValueChangedCallback("ProfessionTips_" .. sub.allKey, function()
            for _, variable in ipairs(subVariables[sub.suffix]) do
                if Settings.NotifyUpdate then pcall(Settings.NotifyUpdate, variable) end
            end
        end)
    end

    for _, prof in ipairs(ns.ProfessionTips.PROFESSIONS) do
        if ns[prof.recipes] then -- only professions with data on this flavor
            local profName = ns.api.GetSpellName(prof.skillSpell) or prof.dbKey
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

            -- Child rows: indented under the profession and greyed out while
            -- the profession is disabled (native dependent-option look) or
            -- while the "all professions" master of that option is on.
            for _, sub in ipairs(SUB_OPTIONS) do
                local key = prof.dbKey .. sub.suffix
                local variable = "ProfessionTips_" .. key
                local subSetting = Settings.RegisterProxySetting(
                    category,
                    variable,
                    Settings.VarType.Boolean,
                    sub.label,
                    false,
                    function() return ns.db[sub.allKey] or ns.db[key] or false end,
                    function(value) ns.db[key] = value end
                )
                local tooltip = function()
                    if ns.db[sub.allKey] then
                        return sub.tooltip .. "\n\n|cffffd100"
                            .. format(L["Turned on for all professions by '%s'."], sub.allLabel) .. "|r"
                    end
                    return sub.tooltip
                end
                local subInitializer = Settings.CreateCheckbox(category, subSetting, tooltip)
                subInitializer:SetParentInitializer(profInitializer, function()
                    return ns.db[prof.dbKey]
                end)
                subInitializer:AddModifyPredicate(function()
                    return not ns.db[sub.allKey]
                end)
                -- re-evaluate the enabled state when the master toggles
                -- (despite the name this listens to any setting variable)
                subInitializer:AddEvaluateStateCVar("ProfessionTips_" .. sub.allKey)
                tinsert(subVariables[sub.suffix], variable)
            end
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
        -- max = the most recipes one item reaches in one profession in the
        -- loaded catalogue (Era 79, TBC 106, Forever 144)
        local maxValue = math.max(35, ns.ProfessionTips.MaxRecipesPerItem())
        local options = Settings.CreateSliderOptions(0, maxValue, 1)
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
            "ProfessionTips_GrayScale",
            "grayScale",
            ns.db,
            Settings.VarType.Boolean,
            L["Skill range on gray recipes"],
            false
        )
        Settings.CreateCheckbox(category, setting,
            L["Gray recipe lines (see 'Show gray recipes') also show their skill range. Off keeps them short - the range only matters when you collect materials for a lower-skilled character."])
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

    -- the browser docks into the classic trade skill / craft windows, and on
    -- Forever into the Retail profession window
    do
        local setting = Settings.RegisterAddOnSetting(
            category,
            "ProfessionTips_RecipeBrowser",
            "recipeBrowser",
            ns.db,
            Settings.VarType.Boolean,
            L["Recipe browser tab"],
            true
        )
        Settings.CreateCheckbox(category, setting,
            L["Adds a side tab to the profession windows that lists every recipe of the profession - available now and coming up, with where to get each one (trainer, vendor, drop, quest) and what it costs."])
        if Settings.SetOnValueChangedCallback then
            Settings.SetOnValueChangedCallback("ProfessionTips_RecipeBrowser", function()
                if ns.UpdateRecipeBrowser then ns.UpdateRecipeBrowser() end
            end)
        end
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

local function OpenSettings()
    if not ns.settingsCategory then return end
    -- On the 2.5.x anniversary client, opening the settings panel from
    -- addon code can be blocked (newest-codebase UI protection). An error
    -- here would also leave the typed slash command stuck in the chat
    -- edit box (the clear happens after the handler), so never let it
    -- escape; fall back to telling the player where the settings live.
    pcall(Settings.OpenToCategory, ns.settingsCategory:GetID())
    if SettingsPanel and not SettingsPanel:IsShown() then
        -- Second attempt: the panel frame's own methods (the C-side opener
        -- can be blocked while these still work).
        if SettingsPanel.Open then
            pcall(SettingsPanel.Open, SettingsPanel)
            pcall(SettingsPanel.SelectCategory, SettingsPanel, ns.settingsCategory)
        end
    end
    if SettingsPanel and not SettingsPanel:IsShown() then
        print("|cff33ff99ProfessionTips|r: "
            .. L["Could not open the settings window on this client. Find the options under Game Menu -> Options -> AddOns -> ProfessionTips."])
    end
end

-- The 2.5.x anniversary client reworked slash-command handling and does
-- not reliably pick up commands registered at addon load time the legacy
-- way (works fine on Era 1.15, which re-imports on every parse). Register
-- the legacy way at load AND re-register late (first PLAYER_ENTERING_
-- WORLD), additionally going through the new RegisterNewSlashCommand
-- registry when the client has it.
local function RegisterSlashes()
    SLASH_PROFESSIONTIPS1 = "/professiontips"
    SLASH_PROFESSIONTIPS2 = "/proftips"
    SlashCmdList.PROFESSIONTIPS = OpenSettings
    if type(RegisterNewSlashCommand) == "function" then
        pcall(RegisterNewSlashCommand, OpenSettings, "professiontips", "proftips")
    end
    if type(ChatFrame_ImportAllListsToHash) == "function" then
        pcall(ChatFrame_ImportAllListsToHash)
    elseif type(ChatFrameUtil) == "table"
        and type(ChatFrameUtil.ImportAllListsToHash) == "function" then
        pcall(ChatFrameUtil.ImportAllListsToHash)
    end
end

RegisterSlashes()

local slashEvents = CreateFrame("Frame")
slashEvents:RegisterEvent("PLAYER_ENTERING_WORLD")
slashEvents:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    RegisterSlashes()
end)
