local ADDON_NAME, ns = ...

-- Smelting recipes (Mining skill line) for TBC Classic: ore -> bar smelts
-- incl. Fel Iron through Khorium/Felsteel. Same shape as Data/Vanilla;
-- loaded only by ProfessionTips_TBC.toc. Data from the 2.5.x client DB
-- (wago.tools), cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("SMELTING")

-- DATA_START (generated; do not hand-edit between markers)
add(2657, 1, 25, 47, 70, { [2770] = 1 }) -- Smelt Copper
add(3304, 65, 65, 70, 75, { [2771] = 1 }) -- Smelt Tin
add(2659, 65, 65, 90, 115, { [2840] = 1, [3576] = 1 }) -- Smelt Bronze
add(2658, 75, 115, 122, 130, { [2775] = 1 }) -- Smelt Silver
add(3307, 125, 130, 145, 160, { [2772] = 1 }) -- Smelt Iron
add(3308, 155, 170, 177, 185, { [2776] = 1 }) -- Smelt Gold
add(3569, 165, 165, 165, 165, { [3575] = 1, [3857] = 1 }) -- Smelt Steel
add(10097, 175, 175, 202, 230, { [3858] = 1 }) -- Smelt Mithril
add(10098, 230, 235, 242, 250, { [7911] = 1 }) -- Smelt Truesilver
add(14891, 230, 300, 305, 310, { [11370] = 8 }) -- Smelt Dark Iron
add(16153, 250, 250, 270, 290, { [10620] = 1 }) -- Smelt Thorium
add(29356, 300, 300, 307, 315, { [23424] = 2 }) -- Smelt Fel Iron
add(22967, 300, 350, 362, 375, { [18562] = 1, [12360] = 10, [17010] = 1, [18567] = 3 }) -- Smelt Elementium
add(29358, 325, 325, 332, 340, { [23425] = 2 }) -- Smelt Adamantite
add(29359, 350, 350, 357, 365, { [23427] = 2 }) -- Smelt Eternium
add(29360, 350, 355, 367, 380, { [23445] = 3, [23447] = 2 }) -- Smelt Felsteel
add(29361, 375, 375, 375, 375, { [23426] = 2 }) -- Smelt Khorium
add(29686, 375, 375, 375, 375, { [23446] = 10 }) -- Smelt Hardened Adamantite
add(46353, 375, 375, 375, 375, { [23449] = 3, [23573] = 1 }) -- Smelt Hardened Khorium
-- DATA_END
