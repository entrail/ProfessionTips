local ADDON_NAME, ns = ...

-- Smelting recipes (Mining skill line) for Classic Era (same shape as
-- CookingData.lua): ore -> bar smelts. Lets ore tooltips answer whether
-- smelting it still levels Mining. Data from the 1.15 client DB
-- (wago.tools), cross-checked against Wowhead Classic.

local add = ns.NewRecipeDB("SMELTING")

-- Hand-corrected 2026-08-06 (verified against the Wowhead listview
-- colors): the special smelts (Steel, Mithril, Truesilver, Dark Iron,
-- Thorium) have ALL-EQUAL breakpoints in the source DB, meaning they
-- NEVER turn trivial - encoded as green/gray = 1000 (the never-trivial
-- sentinel FormatScale renders as "165+"). Smelt Tin is green from the
-- start ([0,0,65,75]); its previous row was garbled.

-- DATA_START (generated; do not hand-edit between markers)
add(2657, 1, 25, 47, 70, { [2770] = 1 }) -- Smelt Copper
add(3304, 65, 65, 65, 75, { [2771] = 1 }) -- Smelt Tin
add(2659, 65, 65, 90, 115, { [2840] = 1, [3576] = 1 }) -- Smelt Bronze
add(2658, 75, 100, 112, 125, { [2775] = 1 }) -- Smelt Silver
add(3307, 125, 130, 135, 140, { [2772] = 1 }) -- Smelt Iron
add(3308, 155, 170, 177, 185, { [2776] = 1 }) -- Smelt Gold
add(3569, 165, 165, 1000, 1000, { [3575] = 1, [3857] = 1 }) -- Smelt Steel
add(10097, 175, 175, 1000, 1000, { [3858] = 1 }) -- Smelt Mithril
add(10098, 230, 230, 1000, 1000, { [7911] = 1 }) -- Smelt Truesilver
add(14891, 230, 230, 1000, 1000, { [11370] = 8 }) -- Smelt Dark Iron
add(16153, 250, 250, 1000, 1000, { [10620] = 1 }) -- Smelt Thorium
add(22967, 300, 310, 315, 320, { [18562] = 1, [12360] = 10, [17010] = 1, [18567] = 3 }) -- Smelt Elementium
-- DATA_END
