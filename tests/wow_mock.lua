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
        if type(k) == "string" and k:match("^%u") then return function() end end
        return nil
    end })
end

local M

local frameMethods = {}
function frameMethods.RegisterEvent(self, e) self.__events[e] = true end
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
function frameMethods.GetText(self) return self.__text end
function frameMethods.CreateFontString(self) return newFontString() end
function frameMethods.CreateTexture(self) return newFontString() end
function frameMethods.GetName(self) return self.__name end
function frameMethods.GetParent(self) return self.__parent end
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
    M.CreateFrame = function(_, name, parent)
        local f = newFrame(name, parent)
        if name then M.__env[name] = f end
        return f
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
    M.FACTION_ALLIANCE = "Alliance"
    M.FACTION_HORDE = "Horde"

    -- ------------------------------------------------------ misc API
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

    -- ------------------------------------------------------ Settings API
    -- initializers answer any PascalCase method call with a no-op
    local function stubInitializer()
        return setmetatable({}, { __index = function(_, k)
            if type(k) == "string" and k:match("^%u") then return function() end end
            return nil
        end })
    end
    M.Settings = {
        RegisterVerticalLayoutCategory = function()
            return {}, { AddInitializer = function() end }
        end,
        RegisterAddOnSetting = function() return {} end,
        SetOnValueChangedCallback = function() end,
        CreateCheckbox = function() return stubInitializer() end,
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

    return M
end
