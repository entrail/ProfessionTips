local ADDON_NAME, ns = ...

-- Leatherworking recipes for TBC Classic (complete catalogue incl. all
-- specializations and drums). Same shape as Data/Vanilla; loaded only by
-- ProfessionTips_TBC.toc. Data from the 2.5.x client DB (wago.tools),
-- cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("LEATHERWORKING", {
    [2320]  = true, -- Coarse Thread
    [2321]  = true, -- Fine Thread
    [4291]  = true, -- Silken Thread
    [8343]  = true, -- Heavy Silken Thread
    [14341] = true, -- Rune Thread
    [4289]  = true, -- Salt
    [2324]  = true, -- Bleach
    [2604]  = true, -- Red Dye
    [2605]  = true, -- Green Dye
    [4340]  = true, -- Gray Dye
    [4341]  = true, -- Yellow Dye
    [4342]  = true, -- Purple Dye
    [6260]  = true, -- Blue Dye
    [10290] = true, -- Pink Dye
})

-- DATA_START (generated; do not hand-edit between markers)
-- DATA_END
