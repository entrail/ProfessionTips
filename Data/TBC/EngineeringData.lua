local ADDON_NAME, ns = ...

-- Engineering recipes for TBC Classic (complete catalogue incl. Gnomish/
-- Goblin specializations). Same shape as Data/Vanilla; loaded only by
-- ProfessionTips_TBC.toc. Data from the 2.5.x client DB (wago.tools),
-- cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("ENGINEERING", {
    [2880] = true, -- Weak Flux
    [3857] = true, -- Coal
    [4399] = true, -- Wooden Stock
    [4400] = true, -- Heavy Stock
})

-- DATA_START (generated; do not hand-edit between markers)
-- DATA_END
