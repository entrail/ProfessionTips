-- Data integrity for both flavors' generated catalogues. The per-
-- profession counts are pinned to the reconciled Wowhead totals the data
-- pipeline produced - a regeneration that changes them must be deliberate.
local T = _G.PT_TEST
local test, assertEqual, assertTrue = T.test, T.assertEqual, T.assertTrue

local V = T.boot("Vanilla")
local B = T.boot("TBC")

local COUNTS = {
    Vanilla = {
        ALCHEMY = 112, BLACKSMITHING = 240, COOKING = 80, ENCHANTING = 151,
        ENGINEERING = 163, FIRSTAID = 13, LEATHERWORKING = 233,
        SMELTING = 12, TAILORING = 226, -- total 1230
    },
    TBC = {
        ALCHEMY = 182, BLACKSMITHING = 375, COOKING = 116, ENCHANTING = 222,
        ENGINEERING = 240, FIRSTAID = 15, JEWELCRAFTING = 259,
        LEATHERWORKING = 377, SMELTING = 19, TAILORING = 314, -- total 2119
    },
}

local function checkFlavor(flavorName, booted, expectJC)
    local ns = booted.ns
    local total = 0
    for prefix, want in pairs(COUNTS[flavorName]) do
        local recipes = ns[prefix .. "_RECIPES"]
        local byReagent = ns[prefix .. "_BY_REAGENT"]
        assertTrue(recipes and byReagent, flavorName .. " " .. prefix .. " tables missing")
        local count = 0
        for spellId, r in pairs(recipes) do
            count = count + 1
            assertTrue(type(spellId) == "number" and spellId > 0, prefix .. " spell id")
            assertTrue(r.orange >= 1, prefix .. " " .. spellId .. " orange >= 1")
            -- orange may EXCEED yellow (recipes learnable past their yellow
            -- start, e.g. Goblin Jumper Cables 165/160, Smelt Tin 65/50) -
            -- FormatScale's never-orange branch handles exactly that. The
            -- renderer only relies on yellow <= green <= gray and a sane
            -- orange below the gray cutoff. One known degenerate row:
            -- The Mortar: Reloaded (13240, TBC) ships 205/1/1/1 - gray 1 is
            -- an "all gray, never gives points" sentinel the code treats
            -- safely (never a candidate, cannot distort ranges).
            if r.gray > 1 then
                assertTrue(r.orange <= r.gray, prefix .. " " .. spellId .. " orange <= gray")
            end
            assertTrue(r.yellow <= r.green, prefix .. " " .. spellId .. " yellow <= green")
            assertTrue(r.green <= r.gray, prefix .. " " .. spellId .. " green <= gray")
            local reagentCount = 0
            for itemId, n in pairs(r.reagents) do
                reagentCount = reagentCount + 1
                assertTrue(type(itemId) == "number" and itemId > 0, prefix .. " " .. spellId .. " reagent id")
                assertTrue(type(n) == "number" and n > 0, prefix .. " " .. spellId .. " reagent count")
            end
            assertTrue(reagentCount > 0, prefix .. " " .. spellId .. " has no reagents")
        end
        assertEqual(count, want, flavorName .. " " .. prefix .. " recipe count")
        total = total + count
        -- reagent index back-links: every indexed spell exists and really
        -- uses that reagent (vendor reagents are excluded by the factory,
        -- so the index is a subset of the recipes' reagent sets)
        for itemId, spells in pairs(byReagent) do
            for _, spellId in ipairs(spells) do
                local r = recipes[spellId]
                assertTrue(r, prefix .. " index spell " .. spellId .. " unknown")
                assertTrue(r.reagents[itemId], prefix .. " index " .. itemId .. " not a reagent of " .. spellId)
            end
        end
    end
    assertEqual(total, flavorName == "Vanilla" and 1230 or 2119, flavorName .. " total recipes")
    if expectJC == false then
        assertEqual(ns.JEWELCRAFTING_RECIPES, nil, "Jewelcrafting data on Vanilla")
    end
end

test("vanilla data: 9 professions, 1230 recipes, valid breakpoints + index", function()
    checkFlavor("Vanilla", V, false)
end)

test("TBC data: 10 professions, 2119 recipes, valid breakpoints + index", function()
    checkFlavor("TBC", B, true)
end)

test("vendor reagents stay out of the reagent index (e.g. Mild Spices)", function()
    -- 2678 Mild Spices is in cooking recipes' reagent lists but must not
    -- get tooltip lines: the factory keeps it out of COOKING_BY_REAGENT.
    local ns = V.ns
    local usedSomewhere = false
    for _, r in pairs(ns.COOKING_RECIPES) do
        if r.reagents[2678] then usedSomewhere = true end
    end
    assertTrue(usedSomewhere, "Mild Spices not used by any cooking recipe?")
    assertEqual(ns.COOKING_BY_REAGENT[2678], nil, "vendor reagent leaked into the index")
end)
