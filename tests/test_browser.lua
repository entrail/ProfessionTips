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

local function findEntry(model, spellId)
    for _, section in ipairs({ "available", "upcoming", "known" }) do
        for _, entry in ipairs(model[section]) do
            if entry.spell == spellId then return entry end
        end
    end
end

local function listHas(list, spellId)
    for _, item in ipairs(list) do
        if item.entry and item.entry.spell == spellId then return true end
    end
    return false
end

test("model flags faction locks; the default filter hides other-faction recipes", function()
    -- 2542 Goretusk Liver Pie is Alliance-only cooking (FactionData)
    local horde = T.boot("Vanilla", function(m) m.state.faction = "Horde" end)
    local prof = profByPrefix(horde.ns, "COOKING")
    local entry = findEntry(horde.ns.BuildBrowserModel(prof, 300), 2542)
    assertTrue(entry ~= nil, "model must still contain the recipe (flagged)")
    assertEqual(entry.faction, "Alliance", "faction lock not detected")

    -- default filter "mine": hidden for Horde, listed for Alliance
    assertFalse(listHas(horde.ns.BrowserBuildList(prof, 300), 2542),
        "Alliance-only recipe listed for Horde under the default filter")

    local alli = T.boot("Vanilla", function(m) m.state.faction = "Alliance" end)
    assertTrue(listHas(alli.ns.BrowserBuildList(profByPrefix(alli.ns, "COOKING"), 300), 2542),
        "Alliance misses its own recipe")
end)

test("faction filter modes: mine / all / neutral", function()
    local ctx = T.boot("Vanilla", function(m) m.state.faction = "Horde" end)
    local ns, prof = ctx.ns, nil
    prof = profByPrefix(ctx.ns, "COOKING")

    ns.db.browserFaction = "all"
    assertTrue(listHas(ns.BrowserBuildList(prof, 300), 2542),
        "'all' must list other-faction recipes")

    ns.db.browserFaction = "neutral"
    local neutral = ns.BrowserBuildList(prof, 300)
    assertFalse(listHas(neutral, 2542), "'neutral' must drop faction-locked recipes")
    for _, item in ipairs(neutral) do
        if item.entry then
            assertTrue(item.entry.faction == nil,
                "'neutral' listed a faction-locked recipe: " .. item.entry.spell)
        end
    end
    ns.db.browserFaction = "mine"
end)

test("faction mark: colored initial only for locked recipes", function()
    local ctx = T.boot("Vanilla")
    local ns = ctx.ns
    assertEqual(ns.BrowserFactionMark({ faction = nil }), "",
        "unlocked recipes must carry no marker")
    -- the crest texture (base-UI PvP icon) marks locked recipes
    local mark = ns.BrowserFactionMark({ faction = "Alliance" })
    assertTrue(mark:find("UI-PVP-Alliance", 1, true) ~= nil, "no crest: " .. mark)
    assertTrue(ns.BrowserFactionMark({ faction = "Horde" }):find("UI-PVP-Horde", 1, true) ~= nil,
        "no horde crest")
    -- text label: crest + colored localized faction name
    local label = ns.BrowserFactionLabel("Alliance")
    assertTrue(label:find("UI-PVP-Alliance", 1, true) ~= nil, "label without crest: " .. label)
    assertTrue(label:find("4a7fda", 1, true) ~= nil, "label without color: " .. label)
end)

test("source filters hide non-matching recipes", function()
    local ctx = T.boot("Vanilla")
    local ns = ctx.ns
    local prof = profByPrefix(ns, "FIRSTAID")
    -- BrowserBuildList returns the module's reused table, so snapshot the
    -- size before rebuilding with the filter applied
    local allCount = #ns.BrowserBuildList(prof, 300)
    ns.db.browserFilters = { t = true, v = false, d = false, w = false, q = false }
    local trainerOnly = ns.BrowserBuildList(prof, 300)
    assertTrue(#trainerOnly > 0, "trainer filter emptied the list")
    assertTrue(#trainerOnly < allCount, "filter changed nothing")
    for _, item in ipairs(trainerOnly) do
        if item.entry then
            local hasTrainer = false
            for _, src in ipairs(item.entry.sources or {}) do
                if src.k == "t" then hasTrainer = true end
            end
            assertTrue(hasTrainer, "non-trainer recipe survived the filter")
        end
    end
    ns.db.browserFilters = { t = true, v = true, d = true, w = true, q = true }
end)

test("dismissing moves a recipe into the collapsible dismissed section", function()
    local ctx = T.boot("Vanilla")
    local ns = ctx.ns
    local prof = profByPrefix(ns, "FIRSTAID")
    local list = ns.BrowserBuildList(prof, 300)
    local victim
    for _, item in ipairs(list) do
        if item.entry then victim = item.entry.spell break end
    end
    assertTrue(victim ~= nil, "no recipe to dismiss")

    ns.BrowserToggleDismiss(victim)
    ns.db.browserDismissedCollapsed = true
    local collapsed = ns.BrowserBuildList(prof, 300)
    assertFalse(listHas(collapsed, victim), "dismissed recipe still in a normal section")
    local header
    for _, item in ipairs(collapsed) do
        if item.header and item.section == "dismissed" then header = item end
    end
    assertTrue(header ~= nil, "no dismissed section header")
    assertEqual(header.count, 1, "dismissed count wrong")

    ns.db.browserDismissedCollapsed = false
    assertTrue(listHas(ns.BrowserBuildList(prof, 300), victim),
        "expanded dismissed section must list the recipe")

    ns.BrowserToggleDismiss(victim) -- restore
    assertTrue(listHas(ns.BrowserBuildList(prof, 300), victim),
        "restored recipe missing from the normal sections")
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

test("scale notation: first segment is always a from-to range", function()
    local ctx = T.boot("Vanilla")
    local FormatScale = ctx.ns.ProfessionTips.FormatScale
    -- normal recipe (Smelt Copper): orange range, then upper bounds
    local copper = FormatScale(1, 25, 47, 70)
    assertTrue(copper:find("1-24", 1, true) ~= nil, "orange range missing: " .. copper)
    assertTrue(copper:find("46", 1, true) ~= nil, "yellow bound missing: " .. copper)
    assertTrue(copper:find("69", 1, true) ~= nil, "green bound missing: " .. copper)
    -- never-orange recipe (Smelt Bronze): yellow span becomes the range
    local bronze = FormatScale(65, 65, 90, 115)
    assertTrue(bronze:find("65-89", 1, true) ~= nil, "yellow range missing: " .. bronze)
    assertTrue(bronze:find("114", 1, true) ~= nil, "green bound missing: " .. bronze)
    -- green-from-the-start recipe (Smelt Tin)
    local tin = FormatScale(65, 65, 65, 75)
    assertTrue(tin:find("65-74", 1, true) ~= nil, "green range missing: " .. tin)
    assertTrue(tin:find("40c040", 1, true) ~= nil, "green color missing: " .. tin)
    -- never-trivial recipe (Smelt Steel): sentinel renders as "165+"
    local steel = FormatScale(165, 165, 1000, 1000)
    assertTrue(steel:find("165+", 1, true) ~= nil, "forever marker missing: " .. steel)
    assertTrue(steel:find("164", 1, true) == nil
        and steel:find("999", 1, true) == nil, "sentinel leaked: " .. steel)
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
