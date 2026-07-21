-- End-to-end tooltip behavior, driven through the real hook pipeline
-- (M.HoverItem = cleared-hooks + OnTooltipSetItem, like the game).
-- Anchors (real Vanilla data, names render as "Spell<id>"/"Item<id>"):
--   First Aid 3273: 3275 Linen Bandage (1/30/45/60, Linen Cloth 2589),
--                   3276 Heavy Linen Bandage (40/50/75/100, 2589)
--   Tailoring 3908: Linen Cloth 2589 -> Bolt of Linen 2996 (conversion)
--   Cooking 2550:   2542 Goretusk Liver Pie (Goretusk Liver 723),
--                   Alliance-only per FactionData
local T = _G.PT_TEST
local test, assertEqual, assertTrue, assertFalse =
    T.test, T.assertEqual, T.assertTrue, T.assertFalse

local function firstAidChar(rank)
    return T.boot("Vanilla", function(m)
        m.state.skillLines = { { name = "Spell3273", rank = rank } }
    end)
end

test("tooltip: silent without the profession, sections with showMissing", function()
    local B = T.boot("Vanilla")
    local lines = B.m.HoverItem(2589)
    assertEqual(#lines, 0, "no profession, showMissing off -> silent")

    B.ns.db.showMissing = true
    B.m.HoverItem(2589)
    local text = B.m.TooltipText()
    assertTrue(text:find("Spell3273") ~= nil, "First Aid section: " .. text)
    assertTrue(text:find("Spell3273 %(") == nil, "no skill number without the profession")
end)

test("tooltip: recipes with difficulty colors, scale and not-learned marker", function()
    local B = firstAidChar(35)
    B.m.HoverItem(2589)
    local text = B.m.TooltipText()
    assertTrue(text:find("Spell3273 %(35%)") ~= nil, "header with skill: " .. text)
    assertTrue(text:find("|cffffff00Spell3275|r") ~= nil, "Linen Bandage yellow at 35: " .. text)
    assertTrue(text:find("|cffff8040Spell3276|r") ~= nil, "Heavy Linen orange at 35: " .. text)
    assertTrue(text:find("not learned") ~= nil, "unlearned marker")

    B.m.state.knownSpells[3275] = true
    B.m.state.knownSpells[3276] = true
    B.m.HoverItem(2589)
    assertTrue(B.m.TooltipText():find("not learned") == nil, "marker gone once learned")
end)

test("tooltip: all recipes gray collapses to one 'no skillups' line", function()
    local B = firstAidChar(300)
    local lines = B.m.HoverItem(2589)
    assertEqual(#lines, 1)
    assertTrue(lines[1].left:find("Spell3273") ~= nil, "gray profession name")
    assertTrue(lines[1].right:find("no skillups") ~= nil, "no skillups tag")
end)

test("tooltip: conversion chain adds 'via' lines, toggleable", function()
    local B = T.boot("Vanilla", function(m)
        m.state.skillLines = { { name = "Spell3908", rank = 1 } } -- Tailoring
    end)
    B.ns.db.maxLines = 35
    B.m.HoverItem(2589) -- Linen Cloth -> Bolt of Linen recipes count too
    local text = B.m.TooltipText()
    assertTrue(text:find("via Item2996") ~= nil, "via-bolt line: " .. text)

    B.ns.db.includeProcessed = false
    B.m.HoverItem(2589)
    assertTrue(B.m.TooltipText():find("via Item2996") == nil, "conversions disabled")
end)

test("tooltip: maxLines truncates and counts the hidden recipes", function()
    local B = T.boot("Vanilla", function(m)
        m.state.skillLines = { { name = "Spell3908", rank = 1 } }
    end)
    B.ns.db.maxLines = 2
    local pool = #B.ns.TAILORING_BY_REAGENT[2996]
    assertTrue(pool > 2, "anchor item needs >2 recipes")
    local lines = B.m.HoverItem(2996) -- Bolt of Linen: many direct recipes
    -- header + 2 recipe rows + the "+N more" line
    assertEqual(#lines, 4, "header + 2 rows + more-line")
    assertTrue(lines[4].left:find("%+" .. (pool - 2)) ~= nil,
        "hidden count: " .. lines[4].left)
end)

test("tooltip: 'only learned' trims rows but keeps the hidden count", function()
    local B = firstAidChar(35)
    B.ns.db.firstAidOnlyLearned = true
    B.m.state.knownSpells[3275] = true
    local lines = B.m.HoverItem(2589)
    -- header + the learned recipe + "+1 more" (the unlearned 3276)
    assertEqual(#lines, 3, "header + 1 row + more-line")
    assertTrue(lines[2].left:find("Spell3275") ~= nil)
    assertTrue(lines[3].left:find("%+1") ~= nil, "unlearned recipe still counted")
end)

test("tooltip: faction-locked recipes tag instead of lines for the other side", function()
    local B = T.boot("Vanilla", function(m)
        m.state.skillLines = { { name = "Spell2550", rank = 60 } } -- Cooking
        m.state.faction = "Horde"
    end)
    local lines = B.m.HoverItem(723) -- Goretusk Liver: recipe is Alliance-only
    assertEqual(#lines, 1)
    assertTrue(lines[1].right:find("Alliance only") ~= nil, lines[1].right)

    local A = T.boot("Vanilla", function(m)
        m.state.skillLines = { { name = "Spell2550", rank = 60 } }
        m.state.faction = "Alliance"
    end)
    A.m.HoverItem(723)
    local text = A.m.TooltipText()
    assertTrue(text:find("Spell2542") ~= nil, "recipe shown for the right faction: " .. text)
end)

test("tooltip: modifier gate blocks until the key is held", function()
    local B = firstAidChar(35)
    B.ns.db.modifier = "SHIFT"
    assertEqual(#B.m.HoverItem(2589), 0, "shift not held")
    B.m.state.shift = true
    assertTrue(#B.m.HoverItem(2589) > 0, "shift held")
end)

test("tooltip: once-per-tooltip guard prevents duplicate sections", function()
    local B = firstAidChar(35)
    local lines = B.m.HoverItem(2589)
    local count = #lines
    assertTrue(count > 0)
    -- second fire without OnTooltipCleared (the guard's job)
    B.m.FireHooks(B.m.GameTooltip, "OnTooltipSetItem", B.m.GameTooltip)
    assertEqual(#B.m.GameTooltip.__lines, count, "duplicated section")
end)

test("tooltip: vendor reagent shows nothing (kept out of the index)", function()
    local B = T.boot("Vanilla", function(m)
        m.state.skillLines = { { name = "Spell2550", rank = 60 } }
    end)
    assertEqual(#B.m.HoverItem(2678), 0, "Mild Spices must stay clean")
end)
