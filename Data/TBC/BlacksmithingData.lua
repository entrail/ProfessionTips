local ADDON_NAME, ns = ...

-- Blacksmithing recipes for TBC Classic (complete catalogue incl. all
-- specializations). Same shape as Data/Vanilla; loaded only by
-- ProfessionTips_TBC.toc. Data from the 2.5.x client DB (wago.tools),
-- cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("BLACKSMITHING", {
    [2880] = true, -- Weak Flux
    [3466] = true, -- Strong Flux
    [3857] = true, -- Coal
})

-- DATA_START (generated; do not hand-edit between markers)
-- DATA_END
