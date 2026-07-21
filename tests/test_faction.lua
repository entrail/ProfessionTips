-- FactionData: shared by both flavors, keyed by crafting spell id. Every
-- entry must point at a real recipe in at least one flavor's catalogue
-- (a dangling id would silently do nothing).
local T = _G.PT_TEST
local test, assertEqual, assertTrue = T.test, T.assertEqual, T.assertTrue

local V = T.boot("Vanilla")
local B = T.boot("TBC")

local PREFIXES = {
    "ALCHEMY", "BLACKSMITHING", "COOKING", "ENCHANTING", "ENGINEERING",
    "FIRSTAID", "JEWELCRAFTING", "LEATHERWORKING", "SMELTING", "TAILORING",
}

local function knownAnywhere(spellId)
    for _, prefix in ipairs(PREFIXES) do
        local v = V.ns[prefix .. "_RECIPES"]
        if v and v[spellId] then return true end
        local b = B.ns[prefix .. "_RECIPES"]
        if b and b[spellId] then return true end
    end
    return false
end

test("faction data: 24 entries, valid factions, no dangling spell ids", function()
    local count = 0
    for spellId, faction in pairs(V.ns.RECIPE_FACTION) do
        count = count + 1
        assertTrue(faction == "Alliance" or faction == "Horde",
            "faction value for " .. spellId .. ": " .. tostring(faction))
        assertTrue(knownAnywhere(spellId), "faction entry " .. spellId .. " not in any catalogue")
    end
    assertEqual(count, 24, "faction entry count")
end)
