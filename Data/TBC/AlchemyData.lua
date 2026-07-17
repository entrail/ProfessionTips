local ADDON_NAME, ns = ...

-- Alchemy recipes for TBC Classic (complete catalogue: old world with TBC
-- breakpoints + TBC additions). Same shape as Data/Vanilla; loaded only by
-- ProfessionTips_TBC.toc. Data from the 2.5.x client DB (wago.tools),
-- cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("ALCHEMY", {
    [3371]  = true, -- Empty Vial
    [3372]  = true, -- Leaded Vial
    [8925]  = true, -- Crystal Vial
    [18256] = true, -- Imbued Vial
})

-- DATA_START (generated; do not hand-edit between markers)
-- DATA_END
