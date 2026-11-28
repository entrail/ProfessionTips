-- Minimal-but-live WoW API mock set for headless ProfessionTips tests
-- (same architecture as ../PetTips/tests/wow_mock.lua: frames KEEP their
-- events/scripts/hooks so tests drive the addon through the same paths
-- the game uses). Returns a builder; every boot is isolated.
--
--   M.HoverItem(itemId)  -- full hover cycle on GameTooltip: cleared-hooks
--                        -- (guard/font reset), fresh lines, then the
--                        -- OnTooltipSetItem hooks; returns the line list
-- Game state the addon reads lives in M.state: skillLines (profession
-- skill ranks), faction, known recipe spells, modifier keys.

local function newFontString()
    local fs = { __text = "" }
    return setmetatable(fs, { __index = function(_, k)
        if k == "SetText" then return function(self, t) self.__text = t or "" end end
        if k == "GetText" then return function(self) return self.__text end end
        if k == "GetStringWidth" then return function(self) return #self.__text * 6 end end
        if type(k) == "string" and k:match("^%u") then return function() end end
        return nil
    end })
end

local M

local frameMethods = {}
function frameMethods.RegisterEvent(self, e)
    -- the Forever client has no craft window and rejects its events
    if M.state.forever and e:match("^CRAFT_") then
        error("Attempt to register unknown event \"" .. e .. "\"", 2)
    end
    self.__events[e] = true
end
function frameMethods.RegisterUnitEvent(self, e) self.__events[e] = true end
function frameMethods.UnregisterEvent(self, e) self.__events[e] = nil end
function frameMethods.UnregisterAllEvents(self) self.__events = {} end
function frameMethods.SetScript(self, k, fn) self.__scripts[k] = fn end
function frameMethods.GetScript(self, k) return self.__scripts[k] end
function frameMethods.HookScript(self, k, fn)
    self.__hooks[k] = self.__hooks[k] or {}
    table.insert(self.__hooks[k], fn)
end
function frameMethods.Show(self)
    if not self.__shown then
        self.__shown = true
        if self.__scripts.OnShow then self.__scripts.OnShow(self) end
    end
end
function frameMethods.Hide(self)
    if self.__shown then
        self.__shown = false
        if self.__scripts.OnHide then self.__scripts.OnHide(self) end
    end
end
function frameMethods.SetShown(self, v) if v then self:Show() else self:Hide() end end
function frameMethods.IsShown(self) return self.__shown end
function frameMethods.SetSize(self, w, h) self.__w, self.__h = w, h end
function frameMethods.GetWidth(self) return self.__w or 0 end
function frameMethods.GetHeight(self) return self.__h or 0 end
function frameMethods.SetText(self, t) self.__text = t or "" end
function frameMethods.GetFontString(self)
    self.__fs = self.__fs or newFontString()
    return self.__fs
end
function frameMethods.SetFrameLevel(self, l) self.__level = l end
function frameMethods.GetFrameLevel(self) return self.__level or 1 end
function frameMethods.SetChecked(self, v) self.__checked = v and true or false end
function frameMethods.GetChecked(self) return self.__checked or false end
-- SidePanelTabButtonMixin (LargeSideTabButtonTemplate) keeps the handler
function frameMethods.SetCustomOnMouseUpHandler(self, fn) self.customMouseUpHandler = fn end
function frameMethods.GetText(self) return self.__text end
function frameMethods.CreateFontString(self) return newFontString() end
function frameMethods.CreateTexture(self) return newFontString() end
function frameMethods.GetName(self) return self.__name end
function frameMethods.GetParent(self) return self.__parent end
function frameMethods.SetParent(self, p) self.__parent = p end
function frameMethods.GetOwner(self) return self.__owner end

local function newFrame(name, parent)
    local f = {
        __name = name, __parent = parent, __shown = true,
        __events = {}, __scripts = {}, __hooks = {},
    }
    setmetatable(f, { __index = function(_, k)
        local m = frameMethods[k]
        if m then return m end
        if type(k) == "string" and k:match("^%u") then return function() end end
        return nil
    end })
    table.insert(M.__frames, f)
    return f
end

return function()
    M = { __frames = {}, __timers = {}, __prints = {} }

    -- ------------------------------------------------------ game state
    M.state = {
        skillLines = {},     -- { {name=..., rank=...}, ... } (no headers)
        faction = "Alliance",
        knownSpells = {},    -- spellId -> true: IsPlayerSpell
        shift = false, ctrl = false, alt = false,
    }

    -- ------------------------------------------------------ dispatch
    function M.Fire(event, ...)
        local snapshot = {}
        for i, f in ipairs(M.__frames) do snapshot[i] = f end
        for _, f in ipairs(snapshot) do
            if f.__events[event] and f.__scripts.OnEvent then
                f.__scripts.OnEvent(f, event, ...)
            end
        end
    end
    function M.FireHooks(frame, script, ...)
        for _, fn in ipairs(frame.__hooks[script] or {}) do fn(...) end
    end

    -- ------------------------------------------------------ frames / UI
    M.CreateFrame = function(_, name, parent, template)
        local f = newFrame(name, parent)
        if template == "LargeSideTabButtonTemplate" then f.Icon = newFontString() end
        if name then M.__env[name] = f end
        return f
    end
    -- C_Timer.After queues; M.RunTimers() runs everything queued so far
    M.C_Timer = { After = function(_, fn) table.insert(M.__timers, fn) end }
    function M.RunTimers()
        while #M.__timers > 0 do
            local fn = table.remove(M.__timers, 1)
            fn()
        end
    end
    -- EventRegistry callbacks; M.TriggerCallback(event, ...) fires them
    M.__callbacks = {}
    M.EventRegistry = {
        RegisterCallback = function(_, event, fn)
            M.__callbacks[event] = M.__callbacks[event] or {}
            table.insert(M.__callbacks[event], fn)
        end,
    }
    function M.TriggerCallback(event, ...)
        for _, fn in ipairs(M.__callbacks[event] or {}) do fn(...) end
    end
    M.UIParent = newFrame("UIParent")

    -- tooltip: records AddLine/AddDoubleLine as {left=, right=}
    local function newTooltip(name)
        local tip = newFrame(name)
        tip.__lines = {}
        tip.__item = nil
        tip.AddLine = function(self, text)
            table.insert(self.__lines, { left = tostring(text) })
        end
        tip.AddDoubleLine = function(self, left, right)
            table.insert(self.__lines, { left = tostring(left), right = tostring(right) })
        end
        tip.NumLines = function(self) return #self.__lines end
        tip.GetItem = function(self)
            if self.__item then return self.__item[1], self.__item[2] end
        end
        return tip
    end
    M.GameTooltip = newTooltip("GameTooltip")
    M.ItemRefTooltip = newTooltip("ItemRefTooltip")

    -- full hover cycle like the game: clear (guard/font reset), then set
    function M.HoverItem(itemId, tip)
        tip = tip or M.GameTooltip
        M.FireHooks(tip, "OnTooltipCleared", tip)
        tip.__lines = {}
        tip.__item = { "Item" .. itemId, "item:" .. itemId }
        M.FireHooks(tip, "OnTooltipSetItem", tip)
        return tip.__lines
    end

    -- all rendered text of the last hover in one string, for find() asserts
    function M.TooltipText(tip)
        tip = tip or M.GameTooltip
        local parts = {}
        for _, l in ipairs(tip.__lines) do
            parts[#parts + 1] = l.left .. (l.right and (" || " .. l.right) or "")
        end
        return table.concat(parts, "\n")
    end

    -- ------------------------------------------------------ player state
    M.UnitFactionGroup = function() return M.state.faction end
    M.IsPlayerSpell = function(spell) return M.state.knownSpells[spell] or false end
    M.GetNumSkillLines = function() return #M.state.skillLines end
    M.GetSkillLineInfo = function(i)
        local s = M.state.skillLines[i]
        if not s then return nil end
        return s.name, false, 0, s.rank
    end
    M.IsShiftKeyDown = function() return M.state.shift end
    M.IsControlKeyDown = function() return M.state.ctrl end
    M.IsAltKeyDown = function() return M.state.alt end

    -- ------------------------------------------------------ names
    -- deterministic fake names: "Spell<id>" / "Item<id>"
    M.GetSpellInfo = function(id) return "Spell" .. id, nil, "icon" .. id end
    M.GetItemInfo = function(id) return "Item" .. id end
    M.GetCoinTextureString = function(copper) return tostring(copper) .. "c" end
    M.GetMoney = function() return M.state.money or 0 end
    M.FACTION_ALLIANCE = "Alliance"
    M.FACTION_HORDE = "Horde"

    -- ------------------------------------------------------ misc API
    -- six returns like the real client (version, build, date, toc, ...)
    M.GetBuildInfo = function()
        local toc = M.state.toc or 11509
        return "1.15.9", "70576", "Nov 18 2026", toc, "", toc
    end
    M.C_AddOns = { GetAddOnMetadata = function() return "test" end }
    M.GetLocale = function() return "enUS" end
    M.format = string.format
    M.tinsert = table.insert
    M.strtrim = function(s) return (tostring(s):gsub("^%s*(.-)%s*$", "%1")) end
    M.strlower = string.lower
    M.wipe = function(t) for k in pairs(t) do t[k] = nil end return t end
    M.print = function(...)
        local parts = {}
        for i = 1, select("#", ...) do parts[#parts + 1] = tostring(select(i, ...)) end
        table.insert(M.__prints, table.concat(parts, " "))
    end
    M.SlashCmdList = {}
    M.SOUNDKIT = { IG_ABILITY_PAGE_TURN = 1, IG_CHARACTER_INFO_TAB = 2 }
    M.PlaySound = function() end

    -- ------------------------------------------------------ Settings API
    -- initializers answer any PascalCase method call with a no-op
    local function stubInitializer()
        return setmetatable({}, { __index = function(_, k)
            if type(k) == "string" and k:match("^%u") then return function() end end
            return nil
        end })
    end
    -- Settings and checkboxes are recorded so tests can drive the panel:
    -- M.settings[variable] = setting (GetValue/SetValue fire the value-
    -- changed callbacks like SettingsCallbackRegistry), M.checkboxes
    -- [variable] = initializer (tooltip, parent + modify predicates,
    -- evaluate-state variables); M.CheckboxEnabled(variable) evaluates
    -- the predicates like SettingsControlMixin:IsEnabled.
    M.settings, M.checkboxes, M.settingCallbacks = {}, {}, {}
    local function fireSetting(variable, setting, value)
        for _, cb in ipairs(M.settingCallbacks[variable] or {}) do cb(nil, setting, value) end
    end
    local function newSetting(variable, getValue, setValue)
        local s = { variable = variable }
        function s:GetVariable() return variable end
        function s:GetValue() return getValue() end
        function s:SetValue(v) setValue(v); fireSetting(variable, s, getValue()) end
        function s:NotifyUpdate() fireSetting(variable, s, getValue()) end
        M.settings[variable] = s
        return s
    end
    function M.CheckboxEnabled(variable)
        for _, pred in ipairs(M.checkboxes[variable].predicates) do
            if not pred() then return false end
        end
        return true
    end
    M.Settings = {
        RegisterVerticalLayoutCategory = function()
            return {}, { AddInitializer = function() end }
        end,
        RegisterAddOnSetting = function(_, variable, key, tbl, _, _, default)
            if tbl[key] == nil then tbl[key] = default end
            return newSetting(variable, function() return tbl[key] end,
                function(v) tbl[key] = v end)
        end,
        RegisterProxySetting = function(_, variable, _, _, _, getValue, setValue)
            return newSetting(variable, getValue, setValue)
        end,
        GetSetting = function(variable) return M.settings[variable] end,
        NotifyUpdate = function(variable)
            local s = M.settings[variable]
            if s then s:NotifyUpdate() end
        end,
        SetOnValueChangedCallback = function(variable, cb)
            M.settingCallbacks[variable] = M.settingCallbacks[variable] or {}
            table.insert(M.settingCallbacks[variable], cb)
        end,
        CreateCheckbox = function(_, setting, tooltip)
            local init = setmetatable(
                { setting = setting, tooltip = tooltip, predicates = {}, evalVars = {} },
                getmetatable(stubInitializer()))
            function init:SetParentInitializer(parent, pred)
                self.parent = parent
                if pred then table.insert(self.predicates, pred) end
            end
            function init:AddModifyPredicate(pred) table.insert(self.predicates, pred) end
            function init:AddEvaluateStateCVar(v) table.insert(self.evalVars, v) end
            if setting and setting.variable then M.checkboxes[setting.variable] = init end
            return init
        end,
        CreateControlTextContainer = function()
            return { Add = function() end, GetData = function() return {} end }
        end,
        CreateDropdown = function() return stubInitializer() end,
        CreateElementInitializer = function() return stubInitializer() end,
        CreateSliderOptions = function() return { SetLabelFormatter = function() end } end,
        CreateSlider = function() return stubInitializer() end,
        RegisterAddOnCategory = function() end,
        OpenToCategory = function() end,
        VarType = { Boolean = "boolean", Number = "number", String = "string" },
    }
    M.CreateSettingsListSectionHeaderInitializer = function() return {} end
    M.MinimalSliderWithSteppersMixin = { Label = { Right = 1 } }

    -- ------------------------------------------------------ WoW Forever
    -- Reshapes the mock into the Forever client (Retail engine, Interface
    -- 16001, WOW_PROJECT_ID = WOW_PROJECT_CAMELOT = 18): the classic name /
    -- known-spell / skill window globals are GONE, C_* replace them,
    -- CRAFT_* registration throws and writing category.ID errors (secure
    -- delegate). Skills: M.state.skillById[skillLine] = rank.
    function M.ApplyForever()
        M.state.forever = true
        M.state.toc = 16001
        M.state.skillById = {}
        M.WOW_PROJECT_ID, M.WOW_PROJECT_CAMELOT, M.WOW_PROJECT_MAINLINE = 18, 18, 1
        M.GetSpellInfo, M.GetItemInfo, M.IsPlayerSpell = nil, nil, nil
        M.GetNumSkillLines, M.GetSkillLineInfo = nil, nil
        M.Enum = { SpellBookSpellBank = { Player = 0, Pet = 1 } }
        M.GetCoinTextureString = nil
        M.C_Spell = {
            GetSpellName = function(id) return "Spell" .. id end,
            GetSpellTexture = function(id) return "icon" .. id end,
        }
        M.C_Item = {
            GetItemInfo = function(id) return "Item" .. id end,
            GetItemIconByID = function(id) return "itemicon" .. id end,
        }
        M.C_CurrencyInfo = {
            GetCoinTextureString = function(copper) return tostring(copper) .. "c" end,
            GetCurrencyInfo = function(id)
                if id == 3402 then
                    return { name = "Merchant's Favor", iconFileID = 1, quantity = M.state.favor or 0 }
                end
            end,
        }
        M.C_Map = { GetAreaInfo = function(id) return "Area" .. id end }
        M.C_QuestLog = { GetTitleForQuestID = function(id) return M.state.questTitles[id] end }
        M.C_Reputation = { GetFactionDataByID = function(id) return { name = "Faction" .. id } end }
        M.FACTION_STANDING_LABEL5 = "Friendly"
        M.ITEM_REQ_REPUTATION = "Requires %s - %s"
        M.state.questTitles = {}
        -- the open profession window (tests set M.state.tradeSkillLine)
        M.C_TradeSkillUI = {
            GetBaseProfessionInfo = function()
                return { professionID = M.state.tradeSkillLine or 0, skillLevel = 0, maxSkillLevel = 0 }
            end,
            IsTradeSkillLinked = function() return false end,
            IsTradeSkillGuild = function() return false end,
            IsNPCCrafting = function() return false end,
        }
        M.C_SpellBook = {
            IsSpellKnown = function(id, bank)
                return bank == 0 and M.state.knownSpells[id] or false
            end,
        }
        M.C_SkillInfo = {
            -- unlearned lines still answer, with empty static data
            GetSkillLineInfoByID = function(id)
                local rank = M.state.skillById[id]
                if rank then return { name = "Line" .. id, rank = rank, maxRank = 300 } end
                return { name = "Line" .. id, rank = 0, maxRank = 0 }
            end,
        }
        local newCategory = M.Settings.RegisterVerticalLayoutCategory
        M.Settings.RegisterVerticalLayoutCategory = function(...)
            local category, layout = newCategory(...)
            setmetatable(category, { __newindex = function(t, k, v)
                if k == "ID" then error("category.ID is guarded by a secure delegate", 2) end
                rawset(t, k, v)
            end })
            return category, layout
        end
    end

    return M
end
