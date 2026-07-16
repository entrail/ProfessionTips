local ADDON_NAME, ns = ...

-- Enchanting recipes for Classic Era: crafting spell ID -> difficulty
-- breakpoints + consumed reagents. Used by ProfessionTips.lua to annotate
-- reagent tooltips (dusts, essences, shards, ...) with the skill range that
-- still gives points.
--
-- Breakpoints: orange = required skill; yellow/green/gray = the skill at
-- which the recipe turns that color (gray = no more skillups). Data from
-- the 1.15 client DB (wago.tools), cross-checked against Wowhead Classic.
-- Recipe names are comments only - display names come from
-- GetSpellInfo(spellId) at runtime, so they are always localized.

-- Second argument: reagents regularly sold by vendors in UNLIMITED quantity
-- (rods, vials). There is never a keep-or-toss decision for these, so the
-- tooltip skips them.
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
add(7421, 1, 5, 7, 10, { [6217] = 1, [10940] = 1, [10938] = 1 }) -- Runed Copper Rod
add(7418, 1, 70, 90, 110, { [10940] = 1 }) -- Enchant Bracer - Minor Health
add(7428, 1, 80, 100, 120, { [10938] = 1, [10940] = 1 }) -- Enchant Bracer - Minor Deflect
add(14293, 10, 75, 95, 115, { [4470] = 1, [10938] = 1 }) -- Lesser Magic Wand
add(7420, 15, 70, 90, 110, { [10940] = 1 }) -- Enchant Chest - Minor Health
add(7443, 20, 80, 100, 120, { [10938] = 1 }) -- Enchant Chest - Minor Mana
add(7426, 40, 90, 110, 130, { [10940] = 2, [10938] = 1 }) -- Enchant Chest - Minor Absorption
add(25124, 45, 55, 65, 75, { [10940] = 2, [17034] = 1, [3371] = 1 }) -- Minor Wizard Oil
add(7454, 45, 95, 115, 135, { [10940] = 1, [10938] = 2 }) -- Enchant Cloak - Minor Resistance
add(7457, 50, 100, 120, 140, { [10940] = 3 }) -- Enchant Bracer - Minor Stamina
add(7748, 60, 105, 125, 145, { [10940] = 2, [10938] = 2 }) -- Enchant Chest - Lesser Health
add(7766, 60, 105, 125, 145, { [10938] = 2 }) -- Enchant Bracer - Minor Spirit
add(7771, 70, 110, 130, 150, { [10940] = 3, [10939] = 1 }) -- Enchant Cloak - Minor Protection
add(14807, 70, 110, 130, 150, { [4470] = 1, [10939] = 1 }) -- Greater Magic Wand
add(7776, 80, 115, 135, 155, { [10939] = 1, [10938] = 1 }) -- Enchant Chest - Lesser Mana
add(7779, 80, 115, 135, 155, { [10940] = 2, [10939] = 1 }) -- Enchant Bracer - Minor Agility
add(7782, 80, 115, 135, 155, { [10940] = 5 }) -- Enchant Bracer - Minor Strength
add(7786, 90, 120, 140, 160, { [10940] = 4, [10939] = 2 }) -- Enchant Weapon - Minor Beastslayer
add(7788, 90, 120, 140, 160, { [10940] = 2, [10939] = 1, [10978] = 1 }) -- Enchant Weapon - Minor Striking
add(7745, 100, 130, 150, 170, { [10940] = 4, [10978] = 1 }) -- Enchant 2H Weapon - Minor Impact
add(7793, 100, 130, 150, 170, { [10939] = 3 }) -- Enchant 2H Weapon - Lesser Intellect
add(7795, 100, 130, 150, 170, { [6338] = 1, [10940] = 6, [10939] = 3, [1210] = 1 }) -- Runed Silver Rod
add(13378, 105, 130, 150, 170, { [10998] = 1, [10940] = 2 }) -- Enchant Shield - Minor Stamina
add(13380, 110, 135, 155, 175, { [10998] = 1, [10940] = 6 }) -- Enchant 2H Weapon - Lesser Spirit
add(13419, 110, 135, 155, 175, { [10998] = 1 }) -- Enchant Cloak - Minor Agility
add(13421, 115, 140, 160, 180, { [10940] = 6, [10978] = 1 }) -- Enchant Cloak - Lesser Protection
add(13464, 115, 140, 160, 180, { [10998] = 1, [10940] = 1, [10978] = 1 }) -- Enchant Shield - Lesser Protection
add(7857, 120, 145, 165, 185, { [10940] = 4, [10998] = 1 }) -- Enchant Chest - Health
add(7859, 120, 145, 165, 185, { [10998] = 2 }) -- Enchant Bracer - Lesser Spirit
add(7861, 125, 150, 170, 190, { [6371] = 1, [10998] = 1 }) -- Enchant Cloak - Lesser Fire Resistance
add(7863, 125, 150, 170, 190, { [10940] = 8 }) -- Enchant Boots - Minor Stamina
add(7867, 125, 150, 170, 190, { [10940] = 6, [10998] = 2 }) -- Enchant Boots - Minor Agility
add(13485, 130, 155, 175, 195, { [10998] = 2, [10940] = 4 }) -- Enchant Shield - Lesser Spirit
add(13501, 130, 155, 175, 195, { [11083] = 2 }) -- Enchant Bracer - Lesser Stamina
add(13522, 135, 160, 180, 200, { [11082] = 1, [6048] = 1 }) -- Enchant Cloak - Lesser Shadow Resistance
add(13503, 140, 165, 185, 205, { [11083] = 2, [11084] = 1 }) -- Enchant Weapon - Lesser Striking
add(13536, 140, 165, 185, 205, { [11083] = 2 }) -- Enchant Bracer - Lesser Strength
add(13538, 140, 165, 185, 205, { [10940] = 2, [11082] = 1, [11084] = 1 }) -- Enchant Chest - Lesser Absorption
add(13529, 145, 170, 190, 210, { [11083] = 3, [11084] = 1 }) -- Enchant 2H Weapon - Lesser Impact
add(13607, 145, 170, 190, 210, { [11082] = 1, [10998] = 2 }) -- Enchant Chest - Mana
add(13612, 145, 170, 190, 210, { [11083] = 1, [2772] = 3 }) -- Enchant Gloves - Mining
add(13617, 145, 170, 190, 210, { [11083] = 1, [3356] = 3 }) -- Enchant Gloves - Herbalism
add(13620, 145, 170, 190, 210, { [11083] = 1, [6370] = 3 }) -- Enchant Gloves - Fishing
add(25125, 150, 160, 170, 180, { [11083] = 3, [17034] = 2, [3372] = 1 }) -- Minor Mana Oil
add(13622, 150, 175, 195, 215, { [11082] = 2 }) -- Enchant Bracer - Lesser Intellect
add(13626, 150, 175, 195, 215, { [11082] = 1, [11083] = 1, [11084] = 1 }) -- Enchant Chest - Minor Stats
add(13628, 150, 175, 195, 215, { [11128] = 1, [5500] = 1, [11082] = 2, [11083] = 2 }) -- Runed Golden Rod
add(13631, 155, 175, 195, 215, { [11134] = 1, [11083] = 1 }) -- Enchant Shield - Lesser Stamina
add(13635, 155, 175, 195, 215, { [11138] = 1, [11083] = 3 }) -- Enchant Cloak - Defense
add(14809, 155, 175, 195, 215, { [11291] = 1, [11134] = 1, [11083] = 1 }) -- Lesser Mystic Wand
add(13637, 160, 180, 200, 220, { [11083] = 1, [11134] = 1 }) -- Enchant Boots - Lesser Agility
add(13640, 160, 180, 200, 220, { [11083] = 3 }) -- Enchant Chest - Greater Health
add(13642, 165, 185, 205, 225, { [11134] = 1 }) -- Enchant Bracer - Spirit
add(13644, 170, 190, 210, 230, { [11083] = 4 }) -- Enchant Boots - Lesser Stamina
add(13646, 170, 190, 210, 230, { [11134] = 1, [11083] = 2 }) -- Enchant Bracer - Lesser Deflection
add(13648, 170, 190, 210, 230, { [11083] = 6 }) -- Enchant Bracer - Stamina
add(13653, 175, 195, 215, 235, { [11134] = 1, [5637] = 2, [11138] = 1 }) -- Enchant Weapon - Lesser Beastslayer
add(13655, 175, 195, 215, 235, { [11134] = 1, [7067] = 1, [11138] = 1 }) -- Enchant Weapon - Lesser Elemental Slayer
add(13657, 175, 195, 215, 235, { [11134] = 1, [7068] = 1 }) -- Enchant Cloak - Fire Resistance
add(14810, 175, 195, 215, 235, { [11291] = 1, [11135] = 1, [11137] = 1 }) -- Greater Mystic Wand
add(13659, 180, 200, 220, 240, { [11135] = 1, [11137] = 1 }) -- Enchant Shield - Spirit
add(13661, 180, 200, 220, 240, { [11137] = 1 }) -- Enchant Bracer - Strength
add(13663, 185, 205, 225, 245, { [11135] = 1 }) -- Enchant Chest - Greater Mana
add(13687, 190, 210, 230, 250, { [11135] = 1, [11134] = 2 }) -- Enchant Boots - Lesser Spirit
add(21931, 190, 210, 230, 250, { [11135] = 3, [11137] = 3, [11139] = 1, [3819] = 2 }) -- Enchant Weapon - Winter's Might
add(13689, 195, 215, 235, 255, { [11135] = 2, [11137] = 2, [11139] = 1 }) -- Enchant Shield - Lesser Block
add(13693, 195, 215, 235, 255, { [11135] = 2, [11139] = 1 }) -- Enchant Weapon - Striking
add(25126, 200, 210, 220, 230, { [11137] = 3, [17035] = 2, [3372] = 1 }) -- Lesser Wizard Oil
add(13695, 200, 220, 240, 260, { [11137] = 4, [11139] = 1 }) -- Enchant 2H Weapon - Impact
add(13698, 200, 220, 240, 260, { [11137] = 1, [7392] = 3 }) -- Enchant Gloves - Skinning
add(13700, 200, 220, 240, 260, { [11135] = 2, [11137] = 2, [11139] = 1 }) -- Enchant Chest - Lesser Stats
add(13702, 200, 220, 240, 260, { [11144] = 1, [7971] = 1, [11135] = 2, [11137] = 2 }) -- Runed Truesilver Rod
add(13746, 205, 225, 245, 265, { [11137] = 3 }) -- Enchant Cloak - Greater Defense
add(13794, 205, 225, 245, 265, { [11174] = 1 }) -- Enchant Cloak - Resistance
add(13815, 210, 230, 250, 270, { [11174] = 1, [11137] = 1 }) -- Enchant Gloves - Agility
add(13817, 210, 230, 250, 270, { [11137] = 5 }) -- Enchant Shield - Stamina
add(13822, 210, 230, 250, 270, { [11174] = 2 }) -- Enchant Bracer - Intellect
add(13836, 215, 235, 255, 275, { [11137] = 5 }) -- Enchant Boots - Stamina
add(13841, 215, 235, 255, 275, { [11137] = 3, [6037] = 3 }) -- Enchant Gloves - Advanced Mining
add(13846, 220, 240, 260, 280, { [11174] = 3, [11137] = 1 }) -- Enchant Bracer - Greater Spirit
add(13858, 220, 240, 260, 280, { [11137] = 6 }) -- Enchant Chest - Superior Health
add(13868, 225, 245, 265, 285, { [11137] = 3, [8838] = 3 }) -- Enchant Gloves - Advanced Herbalism
add(13882, 225, 245, 265, 285, { [11174] = 2 }) -- Enchant Cloak - Lesser Agility
add(13887, 225, 245, 265, 285, { [11174] = 2, [11137] = 3 }) -- Enchant Gloves - Strength
add(13890, 225, 245, 265, 285, { [11177] = 1, [7909] = 1, [11174] = 1 }) -- Enchant Boots - Minor Speed
add(13905, 230, 250, 270, 290, { [11175] = 1, [11176] = 2 }) -- Enchant Shield - Greater Spirit
add(13915, 230, 250, 270, 290, { [11177] = 1, [11176] = 2, [9224] = 1 }) -- Enchant Weapon - Demonslaying
add(13917, 230, 250, 270, 290, { [11175] = 1, [11174] = 2 }) -- Enchant Chest - Superior Mana
add(13931, 235, 255, 275, 295, { [11175] = 1, [11176] = 2 }) -- Enchant Bracer - Deflection
add(13933, 235, 255, 275, 295, { [11178] = 1, [3829] = 1 }) -- Enchant Shield - Frost Resistance
add(13935, 235, 255, 275, 295, { [11175] = 2 }) -- Enchant Boots - Agility
add(13937, 240, 260, 280, 300, { [11178] = 2, [11176] = 2 }) -- Enchant 2H Weapon - Greater Impact
add(13939, 240, 260, 280, 300, { [11176] = 2, [11175] = 1 }) -- Enchant Bracer - Greater Strength
add(13941, 245, 265, 285, 305, { [11178] = 1, [11176] = 3, [11175] = 2 }) -- Enchant Chest - Stats
add(13943, 245, 265, 285, 305, { [11178] = 2, [11175] = 2 }) -- Enchant Weapon - Greater Striking
add(13945, 245, 265, 285, 305, { [11176] = 5 }) -- Enchant Bracer - Greater Stamina
add(17180, 250, 250, 255, 260, { [12359] = 1, [11176] = 3 }) -- Enchanted Thorium
add(17181, 250, 250, 255, 260, { [8170] = 1, [16202] = 1 }) -- Enchanted Leather
add(25127, 250, 260, 270, 280, { [11176] = 3, [8831] = 2, [8925] = 1 }) -- Lesser Mana Oil
add(13947, 250, 270, 290, 310, { [11178] = 2, [11176] = 3 }) -- Enchant Gloves - Riding Skill
add(13948, 250, 270, 290, 310, { [11178] = 2, [8153] = 2 }) -- Enchant Gloves - Minor Haste
add(20008, 255, 275, 295, 315, { [16202] = 3 }) -- Enchant Bracer - Greater Intellect
add(20020, 260, 280, 300, 320, { [11176] = 10 }) -- Enchant Boots - Greater Stamina
add(13898, 265, 285, 305, 325, { [11177] = 4, [7078] = 1 }) -- Enchant Weapon - Fiery Weapon
add(15596, 265, 285, 305, 325, { [11382] = 1, [7078] = 1, [14343] = 3 }) -- Smoking Heart of the Mountain
add(20014, 265, 285, 305, 325, { [16202] = 2, [7077] = 1, [7075] = 1, [7079] = 1, [7081] = 1, [7972] = 1 }) -- Enchant Cloak - Greater Resistance
add(20017, 265, 285, 305, 325, { [11176] = 10 }) -- Enchant Shield - Greater Stamina
add(20009, 270, 290, 310, 330, { [16202] = 3, [11176] = 10 }) -- Enchant Bracer - Superior Spirit
add(20012, 270, 290, 310, 330, { [16202] = 3, [16204] = 3 }) -- Enchant Gloves - Greater Agility
add(25128, 275, 285, 295, 305, { [16204] = 3, [4625] = 2, [8925] = 1 }) -- Wizard Oil
add(20024, 275, 295, 315, 335, { [16203] = 2, [16202] = 1 }) -- Enchant Boots - Spirit
add(20026, 275, 295, 315, 335, { [16204] = 6, [14343] = 1 }) -- Enchant Chest - Major Health
add(20016, 280, 300, 320, 340, { [16203] = 2, [16204] = 4 }) -- Enchant Shield - Superior Spirit
add(20015, 285, 305, 325, 345, { [16204] = 8 }) -- Enchant Cloak - Superior Defense
add(20029, 285, 305, 325, 345, { [14343] = 4, [7080] = 1, [7082] = 1, [13467] = 1 }) -- Enchant Weapon - Icy Chill
add(20028, 290, 310, 330, 350, { [16203] = 3, [14343] = 1 }) -- Enchant Chest - Major Mana
add(20051, 290, 310, 330, 350, { [16206] = 1, [13926] = 1, [16204] = 10, [16203] = 4, [14343] = 4, [14344] = 2 }) -- Runed Arcanite Rod
add(23799, 290, 310, 330, 350, { [14344] = 6, [16203] = 6, [16204] = 4, [7076] = 2 }) -- Enchant Weapon - Strength
add(23800, 290, 310, 330, 350, { [14344] = 6, [16203] = 6, [16204] = 4, [7082] = 2 }) -- Enchant Weapon - Agility
add(23801, 290, 310, 330, 350, { [16204] = 16, [16203] = 4, [7080] = 2 }) -- Enchant Bracer - Mana Regeneration
add(27837, 290, 310, 330, 350, { [14344] = 10, [16203] = 6, [16204] = 14, [7082] = 4 }) -- Enchant 2H Weapon - Agility
add(20010, 295, 315, 335, 355, { [16204] = 6, [16203] = 6 }) -- Enchant Bracer - Superior Strength
add(20013, 295, 315, 335, 355, { [16203] = 4, [16204] = 4 }) -- Enchant Gloves - Greater Strength
add(20023, 295, 315, 335, 355, { [16203] = 8 }) -- Enchant Boots - Greater Agility
add(20030, 295, 315, 335, 355, { [14344] = 4, [16204] = 10 }) -- Enchant 2H Weapon - Superior Impact
add(20033, 295, 315, 335, 355, { [14344] = 4, [12808] = 4 }) -- Enchant Weapon - Unholy Weapon
add(25129, 300, 310, 320, 330, { [14344] = 2, [4625] = 3, [18256] = 1 }) -- Brilliant Wizard Oil
add(25130, 300, 310, 320, 330, { [14344] = 2, [8831] = 3, [18256] = 1 }) -- Brilliant Mana Oil
add(20011, 300, 320, 340, 360, { [16204] = 15 }) -- Enchant Bracer - Superior Stamina
add(20025, 300, 320, 340, 360, { [14344] = 4, [16204] = 15, [16203] = 10 }) -- Enchant Chest - Greater Stats
add(20031, 300, 320, 340, 360, { [14344] = 2, [16203] = 10 }) -- Enchant Weapon - Superior Striking
add(20032, 300, 320, 340, 360, { [14344] = 6, [12808] = 6, [12803] = 6 }) -- Enchant Weapon - Lifestealing
add(20034, 300, 320, 340, 360, { [14344] = 4, [12811] = 2 }) -- Enchant Weapon - Crusader
add(20035, 300, 320, 340, 360, { [16203] = 12, [14344] = 2 }) -- Enchant 2H Weapon - Major Spirit
add(20036, 300, 320, 340, 360, { [16203] = 12, [14344] = 2 }) -- Enchant 2H Weapon - Major Intellect
add(22749, 300, 320, 340, 360, { [14344] = 4, [16203] = 12, [7078] = 4, [7080] = 4, [7082] = 4, [13926] = 2 }) -- Enchant Weapon - Spell Power
add(22750, 300, 320, 340, 360, { [14344] = 4, [16203] = 8, [12803] = 6, [7080] = 6, [12811] = 1 }) -- Enchant Weapon - Healing Power
add(23802, 300, 320, 340, 360, { [14344] = 2, [16204] = 20, [16203] = 4, [12803] = 6 }) -- Enchant Bracer - Healing Power
add(23803, 300, 320, 340, 360, { [14344] = 10, [16203] = 8, [16204] = 15 }) -- Enchant Weapon - Mighty Spirit
add(23804, 300, 320, 340, 360, { [14344] = 15, [16203] = 12, [16204] = 20 }) -- Enchant Weapon - Mighty Intellect
add(25072, 300, 320, 340, 360, { [20725] = 4, [14344] = 6, [18512] = 8 }) -- Enchant Gloves - Threat
add(25073, 300, 320, 340, 360, { [20725] = 3, [14344] = 10, [12808] = 6 }) -- Enchant Gloves - Shadow Power
add(25074, 300, 320, 340, 360, { [20725] = 3, [14344] = 10, [7080] = 4 }) -- Enchant Gloves - Frost Power
add(25078, 300, 320, 340, 360, { [20725] = 2, [14344] = 10, [7078] = 4 }) -- Enchant Gloves - Fire Power
add(25079, 300, 320, 340, 360, { [20725] = 3, [14344] = 8, [12811] = 1 }) -- Enchant Gloves - Healing Power
add(25080, 300, 320, 340, 360, { [20725] = 3, [14344] = 8, [7082] = 4 }) -- Enchant Gloves - Superior Agility
add(25081, 300, 320, 340, 360, { [20725] = 3, [14344] = 8, [7078] = 4 }) -- Enchant Cloak - Greater Fire Resistance
add(25082, 300, 320, 340, 360, { [20725] = 2, [14344] = 8, [12803] = 4 }) -- Enchant Cloak - Greater Nature Resistance
add(25083, 300, 320, 340, 360, { [20725] = 3, [14344] = 8, [13468] = 2 }) -- Enchant Cloak - Stealth
add(25084, 300, 320, 340, 360, { [20725] = 4, [14344] = 6, [11754] = 2 }) -- Enchant Cloak - Subtlety
add(25086, 300, 320, 340, 360, { [20725] = 3, [14344] = 8, [12809] = 8 }) -- Enchant Cloak - Dodge
-- DATA_END
