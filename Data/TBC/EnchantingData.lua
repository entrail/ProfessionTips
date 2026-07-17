local ADDON_NAME, ns = ...

-- Enchanting recipes for TBC Classic (complete catalogue incl. runed rod
-- crafts and oils). Same shape as Data/Vanilla; loaded only by
-- ProfessionTips_TBC.toc. Data from the 2.5.x client DB (wago.tools),
-- cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("ENCHANTING", {
    [6217]  = true, -- Copper Rod
    [11128] = true, -- Silver Rod
    [11144] = true, -- Golden Rod
    [11145] = true, -- Truesilver Rod
    [3371]  = true, -- Empty Vial (oils)
    [3372]  = true, -- Leaded Vial (oils)
    [8925]  = true, -- Crystal Vial (oils)
    [18256] = true, -- Imbued Vial (oils)
})

-- DATA_START (generated; do not hand-edit between markers)
-- DATA_END
