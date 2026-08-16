-- Locale files: they must only load on their own locale, and every
-- translation must keep the same format directives (%s/%d, in order) as
-- its English key - a mismatched %d crashes string.format at runtime.
-- esMX shares the esES file, so it is covered here too.
local T = _G.PT_TEST
local test, assertEqual, assertTrue = T.test, T.assertEqual, T.assertTrue

local LOCALES = { "deDE", "frFR", "esES", "esMX", "ptBR", "ruRU" }

-- A handful of entries are genuinely spelled the same in the target
-- language. They are listed explicitly so the "still English" check stays
-- strict for every other key.
local SAME_AS_ENGLISH = {
    deDE = { ["Version: %s"] = true, ["via %s"] = true, ["Quest"] = true },
    frFR = { ["Faction"] = true, ["Source"] = true, ["via %s"] = true },
    ptBR = { ["via %s"] = true },
}

local function bootLocale(locale)
    return T.boot("Vanilla", function(m)
        m.GetLocale = function() return locale end
    end)
end

local function directives(s)
    local list = {}
    for d in tostring(s):gmatch("%%[sd]") do list[#list + 1] = d end
    return table.concat(list, " ")
end

for _, locale in ipairs(LOCALES) do
    test("locales: " .. locale .. " translations load and format-match", function()
        local B = bootLocale(locale)
        local same = SAME_AS_ENGLISH[locale] or {}
        local entries = 0
        for key, value in pairs(B.ns.L) do
            entries = entries + 1
            assertTrue(value ~= key or same[key],
                locale .. " untranslated entry: " .. key)
            assertEqual(directives(value), directives(key),
                locale .. " format mismatch in: " .. key)
        end
        assertTrue(entries >= 54, locale .. " translation count (" .. entries .. ")")
        -- the metatable fallback still serves unknown keys as English
        assertEqual(B.ns.L["Untranslated probe"], "Untranslated probe", "fallback")
    end)
end

test("locales: enUS loads no overrides, English keys pass through", function()
    local B = bootLocale("enUS")
    local entries = 0
    for _ in pairs(B.ns.L) do entries = entries + 1 end
    assertEqual(entries, 0, "no stored entries on enUS")
    assertEqual(B.ns.L["Requires %d"], "Requires %d", "key is fallback")
end)
