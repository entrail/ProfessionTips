local ADDON_NAME, ns = ...

-- First Aid recipes for TBC Classic (complete catalogue incl. Netherweave
-- bandages). Same shape as Data/Vanilla; loaded only by
-- ProfessionTips_TBC.toc. Data from the 2.5.x client DB (wago.tools),
-- cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("FIRSTAID")

-- DATA_START (generated; do not hand-edit between markers)
add(3275, 1, 30, 45, 60, { [2589] = 1 }) -- Linen Bandage
add(3276, 40, 50, 75, 100, { [2589] = 2 }) -- Heavy Linen Bandage
add(3277, 80, 80, 115, 150, { [2592] = 1 }) -- Wool Bandage
add(7934, 80, 80, 115, 150, { [1475] = 1 }) -- Anti-Venom
add(3278, 115, 115, 150, 185, { [2592] = 2 }) -- Heavy Wool Bandage
add(7935, 130, 130, 165, 200, { [1288] = 1 }) -- Strong Anti-Venom
add(7928, 150, 150, 180, 210, { [4306] = 1 }) -- Silk Bandage
add(7929, 180, 180, 210, 240, { [4306] = 2 }) -- Heavy Silk Bandage
add(10840, 210, 210, 240, 270, { [4338] = 1 }) -- Mageweave Bandage
add(10841, 240, 240, 270, 300, { [4338] = 2 }) -- Heavy Mageweave Bandage
add(18629, 260, 260, 290, 320, { [14047] = 1 }) -- Runecloth Bandage
add(18630, 290, 290, 320, 350, { [14047] = 2 }) -- Heavy Runecloth Bandage
add(23787, 300, 300, 330, 360, { [19441] = 1 }) -- Powerful Anti-Venom
add(27032, 330, 330, 360, 390, { [21877] = 1 }) -- Netherweave Bandage
add(27033, 360, 360, 385, 410, { [21877] = 2 }) -- Heavy Netherweave Bandage
-- DATA_END
