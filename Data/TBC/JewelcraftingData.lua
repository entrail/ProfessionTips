local ADDON_NAME, ns = ...

-- Jewelcrafting recipes for TBC Classic (new profession in TBC, 1-375:
-- gem cuts, jewelry, statues, meta gems). Same shape as Data/Vanilla;
-- loaded only by ProfessionTips_TBC.toc. Data from the 2.5.x client DB
-- (wago.tools), cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("JEWELCRAFTING")

-- DATA_START (generated; do not hand-edit between markers)
add(25255, 1, 20, 35, 50, { [2840] = 2 }) -- Delicate Copper Wire
add(25493, 1, 30, 45, 60, { [20816] = 2 }) -- Braided Copper Ring
add(26925, 1, 30, 45, 60, { [20816] = 2, [2840] = 1 }) -- Woven Copper Ring
add(32259, 1, 30, 40, 50, { [2835] = 8 }) -- Rough Stone Statue
add(26926, 5, 35, 50, 65, { [2840] = 4, [20816] = 2 }) -- Heavy Copper Ring
add(32178, 20, 50, 65, 80, { [774] = 1, [20816] = 1 }) -- Malachite Pendant
add(32179, 20, 50, 65, 80, { [818] = 1, [20816] = 1 }) -- Tigerseye Band
add(25283, 30, 60, 75, 90, { [774] = 2, [2840] = 2 }) -- Inlaid Malachite Ring
add(26928, 30, 60, 75, 90, { [818] = 2, [2840] = 2, [20816] = 1 }) -- Ornate Tigerseye Necklace
add(25278, 50, 70, 80, 90, { [2841] = 2 }) -- Bronze Setting
add(25280, 50, 80, 95, 110, { [2842] = 1 }) -- Elegant Silver Ring
add(25490, 50, 80, 95, 110, { [2841] = 4 }) -- Solid Bronze Ring
add(26927, 50, 80, 95, 110, { [2841] = 2, [1210] = 1, [20816] = 1 }) -- Thick Bronze Necklace
add(32801, 50, 70, 80, 90, { [2836] = 8 }) -- Coarse Stone Statue
add(25284, 60, 90, 105, 120, { [5498] = 1, [20817] = 1, [2840] = 2 }) -- Simple Pearl Ring
add(37818, 65, 95, 110, 125, { [2841] = 2, [20817] = 1, [774] = 3, [818] = 3, [1210] = 2 }) -- Bronze Band of Force
add(25287, 70, 100, 115, 130, { [1210] = 2, [20817] = 1, [20816] = 2 }) -- Gloom Band
add(36523, 75, 105, 120, 135, { [2841] = 4, [20817] = 1, [1206] = 1 }) -- Brilliant Necklace
add(25317, 80, 110, 125, 140, { [2842] = 2 }) -- Ring of Silver Might
add(38175, 80, 110, 125, 140, { [2841] = 6, [20817] = 1, [1705] = 1 }) -- Bronze Torc
add(25305, 90, 120, 135, 150, { [2842] = 2, [20817] = 1, [1206] = 1, [1705] = 1 }) -- Heavy Silver Ring
add(25318, 100, 130, 145, 160, { [1210] = 2, [2841] = 2 }) -- Ring of Twilight Shadows
add(36524, 105, 135, 150, 165, { [1529] = 1, [20817] = 1, [3575] = 2 }) -- Heavy Jade Ring
add(25339, 110, 140, 155, 170, { [1705] = 2, [20817] = 1 }) -- Amulet of the Moon
add(25498, 110, 140, 155, 170, { [3575] = 8, [5637] = 2, [20817] = 2 }) -- Barbaric Iron Collar
add(32807, 110, 120, 130, 140, { [2838] = 8 }) -- Heavy Stone Statue
add(25321, 120, 150, 165, 180, { [1705] = 3, [5498] = 3, [11083] = 4, [2842] = 4, [3827] = 2 }) -- Moonsoul Crown
add(25610, 120, 150, 165, 180, { [1206] = 1, [20817] = 1 }) -- Pendant of the Agate Shield
add(25323, 125, 155, 170, 185, { [1705] = 1, [3824] = 1, [3575] = 4 }) -- Wicked Moonstone Ring
add(25612, 125, 155, 170, 185, { [3575] = 8, [3391] = 2 }) -- Heavy Iron Knuckles
add(25613, 135, 165, 180, 195, { [1529] = 1, [3577] = 2, [20816] = 2 }) -- Golden Dragon Ring
add(25320, 150, 180, 195, 210, { [3577] = 1, [1206] = 2, [3391] = 1 }) -- Heavy Golden Necklace of Battle
add(25615, 150, 170, 180, 190, { [3860] = 2 }) -- Mithril Filigree
add(25617, 150, 180, 195, 210, { [3864] = 1, [20963] = 1 }) -- Blazing Citrine Ring
add(25618, 160, 190, 205, 220, { [1529] = 1, [20963] = 2 }) -- Jade Pendant of Blasting
add(25619, 170, 200, 215, 230, { [1529] = 1, [7067] = 2 }) -- The Jade Eye
add(25620, 170, 200, 215, 230, { [6037] = 1, [20963] = 2 }) -- Engraved Truesilver Ring
add(32808, 175, 175, 185, 195, { [7912] = 10 }) -- Solid Stone Statue
add(25621, 180, 210, 225, 240, { [3864] = 1, [7070] = 2, [3860] = 2 }) -- Citrine Ring of Rapid Healing
add(34955, 180, 190, 200, 210, { [3577] = 4, [1705] = 1, [1529] = 1, [3864] = 1 }) -- Golden Ring of Power
add(25622, 190, 220, 235, 250, { [3864] = 1, [7070] = 2, [3577] = 2, [20817] = 1 }) -- Citrine Pendant of Golden Healing
add(26872, 200, 225, 240, 255, { [1529] = 4, [6037] = 2, [11137] = 4, [20963] = 4 }) -- Figurine - Jade Owl
add(26873, 200, 225, 240, 255, { [3577] = 6, [3864] = 2 }) -- Figurine - Golden Hare
add(34959, 200, 210, 220, 230, { [6037] = 3, [7910] = 2, [3864] = 2 }) -- Truesilver Commander's Ring
add(26874, 210, 235, 250, 265, { [7909] = 3, [8151] = 4 }) -- Aquamarine Signet
add(26875, 215, 240, 255, 270, { [7971] = 4, [8151] = 4 }) -- Figurine - Black Pearl Panther
add(26876, 220, 245, 260, 275, { [7909] = 1, [20963] = 3 }) -- Aquamarine Pendant of the Warrior
add(26878, 225, 250, 265, 280, { [7910] = 2, [7971] = 2, [6037] = 4, [21752] = 4, [6149] = 4 }) -- Ruby Crown of Restoration
add(26880, 225, 235, 245, 255, { [12359] = 1 }) -- Thorium Setting
add(26881, 225, 250, 265, 280, { [7909] = 2, [6037] = 4, [7075] = 2, [7079] = 2, [8151] = 4 }) -- Figurine - Truesilver Crab
add(32809, 225, 225, 235, 245, { [12365] = 10 }) -- Dense Stone Statue
add(36525, 230, 255, 270, 285, { [7910] = 1, [21752] = 1 }) -- Red Ring of Destruction
add(26882, 235, 260, 275, 290, { [7910] = 2, [6037] = 4, [7077] = 2, [7081] = 2, [8151] = 4 }) -- Figurine - Truesilver Boar
add(26883, 235, 260, 275, 290, { [7910] = 1, [21752] = 1 }) -- Ruby Pendant of Fire
add(26885, 240, 265, 280, 295, { [6037] = 2, [10286] = 2 }) -- Truesilver Healing Ring
add(26887, 245, 270, 285, 300, { [7909] = 1, [21752] = 1 }) -- The Aquamarine Ward
add(26896, 250, 275, 290, 305, { [7909] = 2, [3864] = 2, [21752] = 4, [6037] = 2 }) -- Gem Studded Band
add(26897, 250, 275, 290, 305, { [12799] = 2, [21752] = 2, [6037] = 4, [11178] = 2, [20963] = 2 }) -- Opal Necklace of Impact
add(26900, 260, 280, 290, 300, { [7910] = 2, [7078] = 2, [8152] = 4, [6037] = 2 }) -- Figurine - Ruby Serpent
add(26902, 260, 280, 290, 300, { [12799] = 1, [21752] = 1 }) -- Simple Opal Ring
add(36526, 265, 285, 295, 305, { [12800] = 1, [21752] = 1 }) -- Diamond Focus Ring
add(26903, 275, 285, 295, 305, { [12361] = 4, [6037] = 2, [21752] = 1 }) -- Sapphire Signet
add(26906, 275, 285, 295, 305, { [12364] = 2, [12799] = 2, [12361] = 2, [12360] = 2, [12359] = 2 }) -- Emerald Crown of Destruction
add(26907, 280, 290, 300, 310, { [21752] = 1, [12804] = 1, [7076] = 1 }) -- Onslaught Ring
add(26908, 280, 290, 300, 310, { [12361] = 1, [12808] = 1, [21752] = 1 }) -- Sapphire Pendant of Winter Night
add(34960, 280, 290, 300, 310, { [12800] = 2, [21752] = 1 }) -- Glowing Thorium Band
add(26909, 285, 295, 305, 315, { [12364] = 2, [12360] = 2, [12359] = 2, [12804] = 4 }) -- Figurine - Emerald Owl
add(26910, 285, 295, 305, 315, { [12363] = 1, [12808] = 2, [12662] = 1 }) -- Ring of Bitter Shadows
add(26911, 290, 300, 310, 320, { [12364] = 2, [12803] = 4, [12804] = 4 }) -- Living Emerald Pendant
add(34961, 290, 300, 310, 320, { [12364] = 2, [21752] = 1 }) -- Emerald Lion Ring
add(26912, 300, 310, 320, 330, { [18335] = 4, [11754] = 4, [12800] = 2, [12360] = 2, [12359] = 4 }) -- Figurine - Black Diamond Crab
add(26914, 300, 310, 320, 330, { [11371] = 4, [12360] = 2, [7910] = 2 }) -- Figurine - Dark Iron Scorpid
add(28903, 300, 300, 320, 340, { [23077] = 1 }) -- Teardrop Blood Garnet
add(28910, 300, 300, 320, 340, { [21929] = 1 }) -- Inscribed Flame Spessarite
add(28916, 300, 300, 320, 340, { [23079] = 1 }) -- Radiant Deep Peridot
add(28925, 300, 300, 320, 340, { [23107] = 1 }) -- Glowing Shadow Draenite
add(28938, 300, 300, 320, 340, { [23112] = 1 }) -- Brilliant Golden Draenite
add(28950, 300, 300, 320, 340, { [23117] = 1 }) -- Solid Azure Moonstone
add(26915, 305, 315, 325, 335, { [12800] = 2, [21752] = 2, [12360] = 2 }) -- Necklace of the Diamond Tower
add(28905, 305, 305, 325, 345, { [23077] = 1 }) -- Bold Blood Garnet
add(28912, 305, 305, 325, 345, { [21929] = 1 }) -- Luminous Flame Spessarite
add(28917, 305, 305, 325, 345, { [23079] = 1 }) -- Jagged Deep Peridot
add(28927, 305, 305, 325, 345, { [23107] = 1 }) -- Royal Shadow Draenite
add(28944, 305, 305, 325, 345, { [23112] = 1 }) -- Gleaming Golden Draenite
add(28953, 305, 305, 325, 345, { [23117] = 1 }) -- Sparkling Azure Moonstone
add(34590, 305, 305, 325, 345, { [23077] = 1 }) -- Bright Blood Garnet
add(26916, 310, 320, 330, 340, { [21929] = 1, [7078] = 4, [12803] = 4 }) -- Band of Natural Fire
add(31048, 310, 320, 330, 340, { [23445] = 1, [23077] = 2 }) -- Fel Iron Blood Ring
add(31049, 310, 320, 335, 350, { [23445] = 1, [23112] = 2 }) -- Golden Draenite Ring
add(26918, 315, 325, 335, 345, { [12360] = 4, [7076] = 4, [7082] = 4 }) -- Arcanite Sword Pendant
add(28906, 315, 315, 335, 355, { [23077] = 1 }) -- Runed Blood Garnet
add(28914, 315, 315, 335, 355, { [21929] = 1 }) -- Glinting Flame Spessarite
add(28918, 315, 315, 335, 355, { [23079] = 1 }) -- Enduring Deep Peridot
add(28933, 315, 315, 335, 355, { [23107] = 1 }) -- Shifting Shadow Draenite
add(28947, 315, 315, 335, 355, { [23112] = 1 }) -- Thick Golden Draenite
add(28955, 315, 315, 335, 355, { [23117] = 1 }) -- Stormy Azure Moonstone
add(31050, 320, 330, 340, 350, { [23445] = 1, [23117] = 2, [23079] = 1 }) -- Azure Moonstone Ring
add(26920, 325, 335, 345, 355, { [12359] = 8, [11382] = 2, [7910] = 4, [12938] = 2 }) -- Blood Crown
add(28907, 325, 325, 340, 355, { [23077] = 1 }) -- Delicate Blood Garnet
add(28915, 325, 325, 340, 355, { [21929] = 1 }) -- Potent Flame Spessarite
add(28924, 325, 325, 340, 355, { [23079] = 1 }) -- Dazzling Deep Peridot
add(28936, 325, 325, 340, 355, { [23107] = 1 }) -- Sovereign Shadow Draenite
add(28948, 325, 325, 340, 355, { [23112] = 1 }) -- Rigid Golden Draenite
add(28957, 325, 325, 340, 355, { [23117] = 1 }) -- Lustrous Azure Moonstone
add(34069, 325, 325, 340, 355, { [23112] = 1 }) -- Smooth Golden Draenite
add(38068, 325, 325, 335, 345, { [24243] = 4, [22452] = 1 }) -- Mercurial Adamantite
add(39451, 325, 325, 340, 355, { [23112] = 1 }) -- Great Golden Draenite
add(39455, 325, 325, 340, 355, { [23107] = 1 }) -- Balanced Shadow Draenite
add(39458, 325, 325, 340, 355, { [23107] = 1 }) -- Infused Shadow Draenite
add(39466, 325, 325, 340, 355, { [21929] = 1 }) -- Veiled Flame Spessarite
add(39467, 325, 325, 340, 355, { [21929] = 1 }) -- Wicked Flame Spessarite
add(41414, 325, 335, 345, 355, { [24478] = 8, [23447] = 2 }) -- Brilliant Pearl Band
add(41420, 325, 325, 332, 340, { [24478] = 1, [27860] = 1 }) -- Purified Jaggal Pearl
add(41415, 330, 340, 350, 360, { [24479] = 1, [31079] = 4 }) -- The Black Pearl
add(31051, 335, 345, 355, 365, { [23446] = 2, [31079] = 1 }) -- Thick Adamantite Necklace
add(31052, 335, 345, 355, 365, { [23446] = 1, [31079] = 1 }) -- Heavy Adamantite Ring
add(40514, 340, 340, 355, 370, { [22578] = 3, [24478] = 10, [24479] = 1 }) -- Necklace of the Deep
add(31058, 345, 355, 365, 375, { [23448] = 2, [31079] = 4 }) -- Heavy Felsteel Ring
add(31053, 350, 360, 370, 380, { [23449] = 2, [31079] = 3, [22456] = 3 }) -- Khorium Band of Shadows
add(31084, 350, 350, 365, 380, { [23436] = 1 }) -- Bold Living Ruby
add(31085, 350, 350, 365, 380, { [23436] = 1 }) -- Delicate Living Ruby
add(31087, 350, 350, 365, 380, { [23436] = 1 }) -- Teardrop Living Ruby
add(31088, 350, 350, 365, 380, { [23436] = 1 }) -- Runed Living Ruby
add(31089, 350, 350, 365, 380, { [23436] = 1 }) -- Bright Living Ruby
add(31090, 350, 350, 365, 380, { [23436] = 1 }) -- Subtle Living Ruby
add(31091, 350, 350, 365, 380, { [23436] = 1 }) -- Flashing Living Ruby
add(31092, 350, 350, 365, 380, { [23438] = 1 }) -- Solid Star of Elune
add(31094, 350, 350, 365, 380, { [23438] = 1 }) -- Lustrous Star of Elune
add(31095, 350, 350, 365, 380, { [23438] = 1 }) -- Stormy Star of Elune
add(31096, 350, 350, 365, 380, { [23440] = 1 }) -- Brilliant Dawnstone
add(31097, 350, 350, 365, 380, { [23440] = 1 }) -- Smooth Dawnstone
add(31098, 350, 350, 365, 380, { [23440] = 1 }) -- Rigid Dawnstone
add(31099, 350, 350, 365, 380, { [23440] = 1 }) -- Gleaming Dawnstone
add(31100, 350, 350, 365, 380, { [23440] = 1 }) -- Thick Dawnstone
add(31101, 350, 350, 365, 380, { [23440] = 1 }) -- Mystic Dawnstone
add(31102, 350, 350, 365, 380, { [23441] = 1 }) -- Sovereign Nightseye
add(31103, 350, 350, 365, 380, { [23441] = 1 }) -- Shifting Nightseye
add(31104, 350, 350, 365, 380, { [23441] = 1 }) -- Glowing Nightseye
add(31105, 350, 350, 365, 380, { [23441] = 1 }) -- Royal Nightseye
add(31106, 350, 350, 365, 380, { [23439] = 1 }) -- Inscribed Noble Topaz
add(31107, 350, 350, 365, 380, { [23439] = 1 }) -- Potent Noble Topaz
add(31108, 350, 350, 365, 380, { [23439] = 1 }) -- Luminous Noble Topaz
add(31109, 350, 350, 365, 380, { [23439] = 1 }) -- Glinting Noble Topaz
add(31110, 350, 350, 365, 380, { [23437] = 1 }) -- Enduring Talasite
add(31111, 350, 350, 365, 380, { [23437] = 1 }) -- Radiant Talasite
add(31112, 350, 350, 365, 380, { [23437] = 1 }) -- Dazzling Talasite
add(31113, 350, 350, 365, 380, { [23437] = 1 }) -- Jagged Talasite
add(31149, 350, 350, 365, 380, { [23438] = 1 }) -- Sparkling Star of Elune
add(39452, 350, 350, 365, 380, { [23440] = 1 }) -- Great Dawnstone
add(39462, 350, 350, 365, 380, { [23441] = 1 }) -- Infused Nightseye
add(39463, 350, 350, 365, 380, { [23441] = 1 }) -- Balanced Nightseye
add(39470, 350, 350, 365, 380, { [23439] = 1 }) -- Veiled Noble Topaz
add(39471, 350, 350, 365, 380, { [23439] = 1 }) -- Wicked Noble Topaz
add(41429, 350, 350, 365, 380, { [24479] = 1, [27860] = 1 }) -- Purified Shadow Pearl
add(43493, 350, 350, 365, 380, { [23437] = 1 }) -- Steady Talasite
add(46403, 350, 350, 365, 380, { [23440] = 1 }) -- Quick Dawnstone
add(46404, 350, 350, 365, 380, { [23439] = 1 }) -- Reckless Noble Topaz
add(46405, 350, 350, 365, 380, { [23437] = 1 }) -- Forceful Talasite
add(46803, 350, 350, 365, 380, { [23441] = 1 }) -- Regal Nightseye
add(47280, 350, 350, 365, 380, { [23117] = 3, [23077] = 3, [23079] = 3, [21929] = 3, [23112] = 3, [23107] = 3 }) -- Brilliant Glass
add(31054, 355, 365, 375, 385, { [23449] = 2, [31079] = 4, [21885] = 3 }) -- Khorium Band of Frost
add(31055, 355, 365, 375, 385, { [23449] = 2, [31079] = 4, [21884] = 3 }) -- Khorium Inferno Band
add(31060, 355, 365, 375, 385, { [23447] = 1, [31079] = 5 }) -- Delicate Eternium Ring
add(31067, 355, 365, 375, 385, { [23448] = 2, [31079] = 3 }) -- Thick Felsteel Necklace
add(31068, 355, 365, 375, 385, { [23449] = 4, [31079] = 1, [23436] = 1 }) -- Living Ruby Pendant
add(31056, 360, 370, 380, 390, { [23449] = 2, [31079] = 4, [21886] = 3 }) -- Khorium Band of Leaves
add(31062, 360, 370, 380, 390, { [23448] = 2, [21885] = 6, [21884] = 4, [31079] = 1 }) -- Pendant of Frozen Flame
add(31063, 360, 370, 380, 390, { [23448] = 2, [21884] = 6, [21885] = 4, [31079] = 1 }) -- Pendant of Thawing
add(31064, 360, 370, 380, 390, { [23448] = 2, [22456] = 6, [21886] = 4, [31079] = 1 }) -- Pendant of Withering
add(31065, 360, 370, 380, 390, { [23448] = 2, [21886] = 6, [22456] = 4, [31079] = 1 }) -- Pendant of Shadow's End
add(31066, 360, 370, 380, 390, { [23448] = 2, [22457] = 8, [31079] = 1 }) -- Pendant of the Null Rune
add(31070, 360, 370, 380, 390, { [23447] = 2, [31079] = 3 }) -- Braided Eternium Chain
add(31071, 360, 370, 380, 390, { [23573] = 2, [31079] = 2, [23441] = 1 }) -- Eye of the Night
add(37855, 360, 370, 380, 390, { [23447] = 2, [22457] = 8 }) -- Ring of Arcane Shielding
add(42558, 360, 365, 370, 375, { [23436] = 1 }) -- Don Julio's Heart
add(42588, 360, 365, 370, 375, { [23436] = 1 }) -- Kailee's Rose
add(42589, 360, 365, 370, 375, { [23436] = 1 }) -- Crimson Sun
add(42590, 360, 365, 370, 375, { [23438] = 1 }) -- Falling Star
add(42591, 360, 365, 370, 375, { [23440] = 1 }) -- Stone of Blades
add(42592, 360, 365, 370, 375, { [23440] = 1 }) -- Blood of Amber
add(42593, 360, 365, 370, 375, { [23440] = 1 }) -- Facet of Eternity
add(31057, 365, 375, 385, 395, { [23449] = 2, [31079] = 4, [22457] = 3 }) -- Arcane Khorium Band
add(31061, 365, 375, 385, 395, { [23447] = 2, [31079] = 4, [21884] = 4 }) -- Blazing Eternium Band
add(31072, 365, 375, 385, 395, { [23447] = 2, [31079] = 4, [23112] = 2 }) -- Embrace of the Dawn
add(31076, 365, 375, 385, 395, { [23449] = 2, [31079] = 4, [23117] = 2 }) -- Chain of the Twilight Owl
add(32866, 365, 375, 385, 395, { [25867] = 1 }) -- Powerful Earthstorm Diamond
add(32867, 365, 375, 385, 395, { [25867] = 1 }) -- Bracing Earthstorm Diamond
add(32868, 365, 375, 385, 395, { [25867] = 1 }) -- Tenacious Earthstorm Diamond
add(32869, 365, 375, 385, 395, { [25867] = 1 }) -- Brutal Earthstorm Diamond
add(32870, 365, 375, 385, 395, { [25867] = 1 }) -- Insightful Earthstorm Diamond
add(32871, 365, 375, 385, 395, { [25868] = 1 }) -- Destructive Skyfire Diamond
add(32872, 365, 375, 385, 395, { [25868] = 1 }) -- Mystical Skyfire Diamond
add(32873, 365, 375, 385, 395, { [25868] = 1 }) -- Swift Skyfire Diamond
add(32874, 365, 375, 385, 395, { [25868] = 1 }) -- Enigmatic Skyfire Diamond
add(39961, 365, 375, 385, 395, { [25867] = 1 }) -- Relentless Earthstorm Diamond
add(39963, 365, 375, 385, 395, { [25868] = 1 }) -- Thundering Skyfire Diamond
add(41418, 365, 375, 385, 395, { [23449] = 12, [31079] = 4, [24478] = 20, [24479] = 3 }) -- Crown of the Sea Witch
add(44794, 365, 375, 385, 395, { [25868] = 1 }) -- Chaotic Skyfire Diamond
add(46122, 365, 375, 392, 410, { [35128] = 4, [23571] = 4, [31079] = 12, [34664] = 5 }) -- Loop of Forged Power
add(46123, 365, 375, 392, 410, { [35128] = 4, [21886] = 20, [31079] = 12, [34664] = 5 }) -- Ring of Flowing Life
add(46124, 365, 375, 392, 410, { [35128] = 4, [22451] = 20, [31079] = 12, [34664] = 5 }) -- Hard Khorium Band
add(46125, 365, 375, 392, 410, { [31079] = 12, [32227] = 3, [32228] = 3 }) -- Pendant of Sunfire
add(46126, 365, 375, 392, 410, { [31079] = 6, [32249] = 6 }) -- Amulet of Flowing Life
add(46127, 365, 375, 392, 410, { [35128] = 6, [23572] = 9 }) -- Hard Khorium Choker
add(31077, 370, 380, 390, 400, { [23449] = 20, [21886] = 20, [23437] = 2, [31079] = 5 }) -- Coronet of the Verdant Flame
add(31078, 370, 380, 390, 400, { [23448] = 20, [22457] = 20, [23438] = 2, [31079] = 5 }) -- Circlet of Arcane Might
add(31079, 370, 380, 390, 400, { [23448] = 8, [23077] = 2, [22452] = 4 }) -- Figurine - Felsteel Boar
add(31080, 370, 380, 390, 400, { [23449] = 4, [23440] = 2, [23112] = 4 }) -- Figurine - Dawnstone Crab
add(31081, 370, 380, 390, 400, { [23448] = 2, [23436] = 2, [21884] = 4 }) -- Figurine - Living Ruby Serpent
add(31082, 370, 380, 390, 400, { [23447] = 2, [23437] = 2, [22457] = 4 }) -- Figurine - Talasite Owl
add(31083, 370, 380, 390, 400, { [23573] = 6, [23441] = 2, [22456] = 2 }) -- Figurine - Nightseye Panther
add(46597, 370, 380, 390, 400, { [25867] = 1 }) -- Eternal Earthstorm Diamond
add(46601, 370, 380, 390, 400, { [25868] = 1 }) -- Ember Skyfire Diamond
add(38503, 375, 385, 395, 405, { [31079] = 4, [23449] = 2, [21885] = 6, [21884] = 6 }) -- The Frozen Eye
add(38504, 375, 385, 395, 405, { [31079] = 4, [23448] = 2, [21886] = 6, [22456] = 6 }) -- The Natural Ward
add(39705, 375, 375, 387, 400, { [32227] = 1 }) -- Bold Crimson Spinel
add(39706, 375, 375, 387, 400, { [32227] = 1 }) -- Delicate Crimson Spinel
add(39710, 375, 375, 387, 400, { [32227] = 1 }) -- Teardrop Crimson Spinel
add(39711, 375, 375, 387, 400, { [32227] = 1 }) -- Runed Crimson Spinel
add(39712, 375, 375, 387, 400, { [32227] = 1 }) -- Bright Crimson Spinel
add(39713, 375, 375, 387, 400, { [32227] = 1 }) -- Subtle Crimson Spinel
add(39714, 375, 375, 387, 400, { [32227] = 1 }) -- Flashing Crimson Spinel
add(39715, 375, 375, 387, 400, { [32228] = 1 }) -- Solid Empyrean Sapphire
add(39716, 375, 375, 387, 400, { [32228] = 1 }) -- Sparkling Empyrean Sapphire
add(39717, 375, 375, 387, 400, { [32228] = 1 }) -- Lustrous Empyrean Sapphire
add(39718, 375, 375, 387, 400, { [32228] = 1 }) -- Stormy Empyrean Sapphire
add(39719, 375, 375, 387, 400, { [32229] = 1 }) -- Brilliant Lionseye
add(39720, 375, 375, 387, 400, { [32229] = 1 }) -- Smooth Lionseye
add(39721, 375, 375, 387, 400, { [32229] = 1 }) -- Rigid Lionseye
add(39722, 375, 375, 387, 400, { [32229] = 1 }) -- Gleaming Lionseye
add(39723, 375, 375, 387, 400, { [32229] = 1 }) -- Thick Lionseye
add(39724, 375, 375, 387, 400, { [32229] = 1 }) -- Mystic Lionseye
add(39725, 375, 375, 387, 400, { [32229] = 1 }) -- Great Lionseye
add(39727, 375, 375, 387, 400, { [32230] = 1 }) -- Sovereign Shadowsong Amethyst
add(39728, 375, 375, 387, 400, { [32230] = 1 }) -- Shifting Shadowsong Amethyst
add(39729, 375, 375, 387, 400, { [32230] = 1 }) -- Balanced Shadowsong Amethyst
add(39730, 375, 375, 387, 400, { [32230] = 1 }) -- Infused Shadowsong Amethyst
add(39731, 375, 375, 387, 400, { [32230] = 1 }) -- Glowing Shadowsong Amethyst
add(39732, 375, 375, 387, 400, { [32230] = 1 }) -- Royal Shadowsong Amethyst
add(39733, 375, 375, 387, 400, { [32231] = 1 }) -- Inscribed Pyrestone
add(39734, 375, 375, 387, 400, { [32231] = 1 }) -- Potent Pyrestone
add(39735, 375, 375, 387, 400, { [32231] = 1 }) -- Luminous Pyrestone
add(39736, 375, 375, 387, 400, { [32231] = 1 }) -- Glinting Pyrestone
add(39737, 375, 375, 387, 400, { [32231] = 1 }) -- Veiled Pyrestone
add(39738, 375, 375, 387, 400, { [32231] = 1 }) -- Wicked Pyrestone
add(39739, 375, 375, 387, 400, { [32249] = 1 }) -- Enduring Seaspray Emerald
add(39740, 375, 375, 387, 400, { [32249] = 1 }) -- Radiant Seaspray Emerald
add(39741, 375, 375, 387, 400, { [32249] = 1 }) -- Dazzling Seaspray Emerald
add(39742, 375, 375, 387, 400, { [32249] = 1 }) -- Jagged Seaspray Emerald
add(46775, 375, 375, 387, 400, { [23449] = 8, [32228] = 2, [23440] = 6 }) -- Figurine - Empyrean Tortoise
add(46776, 375, 375, 387, 400, { [23449] = 8, [32231] = 2, [22452] = 8 }) -- Figurine - Khorium Boar
add(46777, 375, 375, 387, 400, { [23447] = 8, [32227] = 2, [21884] = 8 }) -- Figurine - Crimson Serpent
add(46778, 375, 375, 387, 400, { [23573] = 4, [32230] = 2, [22456] = 8 }) -- Figurine - Shadowsong Panther
add(46779, 375, 375, 387, 400, { [23447] = 8, [32249] = 2, [22457] = 8 }) -- Figurine - Seaspray Albatross
add(47053, 375, 375, 387, 400, { [32249] = 1 }) -- Forceful Seaspray Emerald
add(47054, 375, 375, 387, 400, { [32249] = 1 }) -- Steady Seaspray Emerald
add(47055, 375, 375, 387, 400, { [32231] = 1 }) -- Reckless Pyrestone
add(47056, 375, 375, 387, 400, { [32229] = 1 }) -- Quick Lionseye
add(48789, 375, 375, 387, 400, { [32230] = 1 }) -- Purified Shadowsong Amethyst
-- DATA_END
