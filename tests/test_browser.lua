-- Recipe browser model + rendering helpers (RecipeBrowser.lua), driven
-- headlessly: section split (available / upcoming / known), skill-based
-- sorting, faction filtering, source tags and source lines.

local T = PT_TEST
local test, assertTrue, assertEqual, assertFalse =
    T.test, T.assertTrue, T.assertEqual, T.assertFalse

local function profByPrefix(ns, prefix)
    for _, prof in ipairs(ns.ProfessionTips.PROFESSIONS) do
        if prof.prefix == prefix then return prof end
    end
end

test("model splits into available/upcoming/known and sorts by skill", function()
    local ctx = T.boot("Vanilla", function(m)
        m.state.knownSpells = { [2963] = true } -- Bolt of Linen Cloth
        m.state.faction = "Alliance"
    end)
    local ns = ctx.ns
    local prof = profByPrefix(ns, "TAILORING")
    assertTrue(prof ~= nil, "no TAILORING profession entry")

    local model = ns.BuildBrowserModel(prof, 50)
    assertTrue(model ~= nil, "no model")
    assertTrue(#model.available > 0, "no available recipes at skill 50")
    assertTrue(#model.upcoming > 0, "no upcoming recipes at skill 50")

    local knownFound = false
    for _, entry in ipairs(model.known) do
        if entry.spell == 2963 then knownFound = true end
        assertTrue(entry.learned, "known section carries unlearned recipe")
    end
    assertTrue(knownFound, "learned recipe 2963 not in known section")

    local last = -1
    for _, entry in ipairs(model.available) do
        assertFalse(entry.learned, "learned recipe in available section")
        assertTrue(entry.req <= 50, "available recipe above current skill")
        assertTrue(entry.req >= last, "available section not sorted by req skill")
        last = entry.req
    end
    last = -1
    for _, entry in ipairs(model.upcoming) do
        assertTrue(entry.req > 50, "upcoming recipe already reachable")
        assertTrue(entry.req >= last, "upcoming section not sorted by req skill")
        last = entry.req
    end
end)

test("model drops recipes locked to the other faction", function()
    -- 2542 Goretusk Liver Pie is Alliance-only cooking (FactionData)
    local function hasRecipe(model, spellId)
        for _, section in ipairs({ "available", "upcoming", "known" }) do
            for _, entry in ipairs(model[section]) do
                if entry.spell == spellId then return true end
            end
        end
        return false
    end

    local horde = T.boot("Vanilla", function(m) m.state.faction = "Horde" end)
    local hordeModel = horde.ns.BuildBrowserModel(
        profByPrefix(horde.ns, "COOKING"), 300)
    assertFalse(hasRecipe(hordeModel, 2542), "Horde model contains Alliance-only recipe")

    local alli = T.boot("Vanilla", function(m) m.state.faction = "Alliance" end)
    local alliModel = alli.ns.BuildBrowserModel(
        profByPrefix(alli.ns, "COOKING"), 300)
    assertTrue(hasRecipe(alliModel, 2542), "Alliance model misses its own recipe")
end)

test("display list: section headers carry counts, rows follow their header", function()
    local ctx = T.boot("Vanilla", function(m)
        m.state.knownSpells = { [2963] = true }
    end)
    local ns = ctx.ns
    local list = ns.BrowserBuildList(profByPrefix(ns, "ENGINEERING"), 113)
    assertTrue(#list > 0, "display list empty")
    assertTrue(list[1].header ~= nil, "list must start with a section header")

    local headerCount, rowsSinceHeader, lastHeader = 0, 0, nil
    local function closeSection()
        if lastHeader then
            T.assertEqual(rowsSinceHeader, lastHeader.count,
                "header count mismatch for " .. tostring(lastHeader.header))
        end
    end
    for _, item in ipairs(list) do
        if item.header then
            closeSection()
            headerCount = headerCount + 1
            lastHeader = item
            rowsSinceHeader = 0
            assertTrue(item.count > 0, "empty section rendered: " .. tostring(item.header))
        else
            rowsSinceHeader = rowsSinceHeader + 1
            assertTrue(item.entry ~= nil, "row without entry")
        end
    end
    closeSection()
    assertTrue(headerCount >= 2, "expected Available now + Coming up headers")
end)

test("product mapping: crafted items known for item-producing recipes", function()
    local ctx = T.boot("Vanilla")
    local ns = ctx.ns
    assertTrue(ns.CRAFT_PRODUCT ~= nil, "ProductData not loaded")
    assertEqual(ns.CRAFT_PRODUCT[2963], 2996, "Bolt of Linen Cloth product wrong")
    assertEqual(ns.CRAFT_PRODUCT[3275], 1251, "Linen Bandage product wrong")
    -- every First Aid recipe creates an item - full coverage expected
    -- (their spell icons all share one generic texture, so the product
    -- icon is the only correct display)
    for spellId in pairs(ns.FIRSTAID_RECIPES) do
        assertTrue(ns.CRAFT_PRODUCT[spellId] ~= nil,
            "First Aid recipe without product: " .. spellId)
    end
    for spellId, itemId in pairs(ns.CRAFT_PRODUCT) do
        assertTrue(type(spellId) == "number" and type(itemId) == "number",
            "non-numeric product entry")
    end
end)

test("source tag: primary kind as colored word plus +N for the rest", function()
    local ctx = T.boot("Vanilla")
    local ns = ctx.ns
    -- trainer outranks vendor; duplicate vendor collapses into one kind
    local tag = ns.BrowserSourceTag({ { k = "v" }, { k = "t" }, { k = "v" } })
    assertTrue(tag:find("Trainer", 1, true) ~= nil, "primary word missing: " .. tag)
    assertTrue(tag:find("+1", 1, true) ~= nil, "+N suffix missing: " .. tag)
    assertTrue(tag:find("Vendor", 1, true) == nil, "secondary kind spelled out: " .. tag)

    local single = ns.BrowserSourceTag({ { k = "d" } })
    assertTrue(single:find("Drop", 1, true) ~= nil, "single kind word missing: " .. single)
    assertTrue(single:find("+", 1, true) == nil, "+N on single kind: " .. single)

    assertTrue(ns.BrowserSourceTag(nil):find("?", 1, true) ~= nil,
        "missing sources must render the unknown tag")
    assertTrue(ns.BrowserSourceTag({ { k = "x" } }):find("?", 1, true) ~= nil,
        "invalid kind must render the unknown tag")
end)

test("info lines: requirement, sources, reagents in one block", function()
    local ctx = T.boot("Vanilla")
    local ns = ctx.ns
    local list = ns.BrowserBuildList(profByPrefix(ns, "TAILORING"), 50)
    local entry
    for _, item in ipairs(list) do
        if item.entry then entry = item.entry break end
    end
    assertTrue(entry ~= nil, "no entry in display list")
    local lines = table.concat(ns.BrowserInfoLines(entry), "\n")
    assertTrue(lines:find("Requires " .. entry.req, 1, true) ~= nil,
        "requirement line missing")
    assertTrue(lines:find("Source", 1, true) ~= nil, "source block missing")
    assertTrue(lines:find("Item", 1, true) ~= nil, "reagent lines missing")
    assertTrue(lines:find(" x%d") ~= nil, "reagent counts missing")
end)

test("source lines: trainer cost, vendor details, quest zone", function()
    local ctx = T.boot("Vanilla", function(m) m.state.money = 500 end)
    local ns = ctx.ns

    local trainer = ns.BrowserSourceLine({ k = "t", cost = 100 })
    assertTrue(trainer:find("Trainer", 1, true) ~= nil, "no trainer word: " .. trainer)
    assertTrue(trainer:find("100c", 1, true) ~= nil, "no cost: " .. trainer)
    assertTrue(trainer:find("ff2020", 1, true) == nil, "affordable cost rendered red")

    local expensive = ns.BrowserSourceLine({ k = "t", cost = 9999 })
    assertTrue(expensive:find("ff2020", 1, true) ~= nil, "unaffordable cost not red")

    local vendor = ns.BrowserSourceLine({ k = "v", item = 5771, cost = 100,
        npc = 340, name = "Kendor Kabonka", zone = "Stormwind City", limited = true })
    assertTrue(vendor:find("Kendor Kabonka", 1, true) ~= nil, "no vendor name: " .. vendor)
    assertTrue(vendor:find("Stormwind City", 1, true) ~= nil, "no zone: " .. vendor)
    assertTrue(vendor:find("limited stock", 1, true) ~= nil, "no limited note: " .. vendor)

    local quest = ns.BrowserSourceLine({ k = "q", quest = 64,
        name = "Goretusk Liver Pie", zone = "Westfall" })
    assertTrue(quest:find("Goretusk Liver Pie", 1, true) ~= nil, "no quest name: " .. quest)
    assertTrue(quest:find("Westfall", 1, true) ~= nil, "no quest zone: " .. quest)

    local world = ns.BrowserSourceLine({ k = "w", item = 4345 })
    assertTrue(world:find("World drop", 1, true) ~= nil, "no world drop word: " .. world)
end)
