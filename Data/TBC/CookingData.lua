local ADDON_NAME, ns = ...

-- Cooking recipes for TBC Classic (complete catalogue). Same shape as
-- Data/Vanilla; loaded only by ProfessionTips_TBC.toc. Data from the
-- 2.5.x client DB (wago.tools), cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("COOKING", {
    [159]   = true, -- Refreshing Spring Water
    [1179]  = true, -- Ice Cold Milk
    [2596]  = true, -- Skin of Dwarven Stout
    [2665]  = true, -- Stormwind Seasoning Herbs
    [2678]  = true, -- Mild Spices
    [2692]  = true, -- Hot Spices
    [2894]  = true, -- Rhapsody Malt
    [3713]  = true, -- Soothing Spices
    [4536]  = true, -- Shiny Red Apple
    [17194] = true, -- Holiday Spices (Winter Veil vendor)
    [17196] = true, -- Holiday Spirits (Winter Veil vendor)
    [27860] = true, -- Purified Draenic Water (vendor drink)
})

-- DATA_START (generated; do not hand-edit between markers)
-- DATA_END
