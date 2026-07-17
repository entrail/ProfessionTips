local ADDON_NAME, ns = ...

-- Cooking recipes for TBC Classic (complete catalogue). Same shape as
-- Data/Vanilla; loaded only by ProfessionTips_TBC.toc. Data from the
-- 2.5.x client DB (wago.tools), cross-checked against Wowhead TBC.

local add = ns.NewRecipeDB("COOKING", {
    [159]   = true, -- Refreshing Spring Water
    [1179]  = true, -- Ice Cold Milk
    [2596]  = true, -- Skin of Dwarven Stout
    [2665]  = true, -- Stormwind Seasoning Herbs
    [2678]  = true, -- Mild Spices
    [2692]  = true, -- Hot Spices
    [2894]  = true, -- Rhapsody Malt
    [3713]  = true, -- Soothing Spices
    [4536]  = true, -- Shiny Red Apple
    [17194] = true, -- Holiday Spices (Winter Veil vendor)
    [17196] = true, -- Holiday Spirits (Winter Veil vendor)
    [27860] = true, -- Purified Draenic Water (vendor drink)
})

-- DATA_START (generated; do not hand-edit between markers)
add(37836, 1, 30, 35, 40, { [30817] = 1, [2678] = 1 }) -- Spice Bread
add(2538, 1, 45, 65, 85, { [2672] = 1 }) -- Charred Wolf Meat
add(2540, 1, 45, 65, 85, { [769] = 1 }) -- Roasted Boar Meat
add(7751, 1, 45, 65, 85, { [6291] = 1 }) -- Brilliant Smallfish
add(7752, 1, 45, 65, 85, { [6303] = 1 }) -- Slitherskin Mackerel
add(8604, 1, 45, 65, 85, { [6889] = 1, [2678] = 1 }) -- Herb Baked Egg
add(15935, 1, 45, 65, 85, { [12223] = 1, [2678] = 1 }) -- Crispy Bat Wing
add(21143, 1, 45, 65, 85, { [6889] = 1, [17194] = 1 }) -- Gingerbread Cookie
add(33276, 1, 45, 65, 85, { [27668] = 1 }) -- Lynx Steak
add(33277, 1, 45, 65, 85, { [23676] = 1 }) -- Roasted Moongraze Tenderloin
add(43779, 1, 50, 62, 75, { [30817] = 8, [1179] = 4, [2678] = 4, [6889] = 8, [2593] = 1, [785] = 3 }) -- Delicious Chocolate Cake
add(2539, 10, 50, 70, 90, { [2672] = 1, [2678] = 1 }) -- Spiced Wolf Meat
add(6412, 10, 50, 70, 90, { [5465] = 1 }) -- Kaldorei Spider Kabob
add(6413, 20, 60, 80, 100, { [5466] = 1 }) -- Scorpid Surprise
add(2795, 25, 60, 80, 100, { [2886] = 1, [2894] = 1 }) -- Beer Basted Boar Ribs
add(6414, 35, 75, 95, 115, { [5467] = 1, [2678] = 1 }) -- Roasted Kodo Meat
add(21144, 35, 75, 95, 115, { [6889] = 1, [1179] = 1, [17196] = 1, [17194] = 1 }) -- Egg Nog
add(8607, 40, 80, 100, 120, { [3173] = 1 }) -- Smoked Bear Meat
add(2541, 50, 90, 110, 130, { [2673] = 1 }) -- Coyote Steak
add(2542, 50, 90, 110, 130, { [723] = 1, [2678] = 1 }) -- Goretusk Liver Pie
add(6415, 50, 90, 110, 130, { [5468] = 1, [2678] = 1 }) -- Fillet of Frenzy
add(6416, 50, 90, 110, 130, { [5469] = 1, [4536] = 1 }) -- Strider Stew
add(6499, 50, 90, 110, 130, { [5503] = 1, [159] = 1 }) -- Boiled Clams
add(7753, 50, 90, 110, 130, { [6289] = 1 }) -- Longjaw Mud Snapper
add(7754, 50, 90, 110, 130, { [6317] = 1, [2678] = 1 }) -- Loch Frenzy Delight
add(7827, 50, 90, 110, 130, { [6361] = 1 }) -- Rainbow Fin Albacore
add(33278, 50, 90, 110, 130, { [27669] = 1 }) -- Bat Bites
add(3371, 60, 100, 120, 140, { [3173] = 1, [3172] = 1, [3174] = 1 }) -- Blood Sausage
add(9513, 60, 100, 120, 140, { [2452] = 1, [159] = 1 }) -- Thistle Tea
add(28267, 60, 100, 120, 140, { [22644] = 1 }) -- Crunchy Spider Surprise
add(2543, 75, 115, 135, 155, { [729] = 1, [730] = 1, [731] = 1 }) -- Westfall Stew
add(2544, 75, 115, 135, 155, { [2674] = 1, [2678] = 1 }) -- Crab Cake
add(2546, 80, 120, 140, 160, { [2677] = 1, [2678] = 1 }) -- Dry Pork Ribs
add(3370, 80, 120, 140, 160, { [2924] = 1, [2678] = 1 }) -- Crocolisk Steak
add(25704, 80, 120, 140, 160, { [21071] = 1, [2678] = 1 }) -- Smoked Sagefish
add(2545, 85, 125, 145, 165, { [2675] = 1, [2678] = 1 }) -- Cooked Crab Claw
add(8238, 85, 125, 145, 165, { [6522] = 1, [2678] = 1 }) -- Savory Deviate Delight
add(3372, 90, 130, 150, 170, { [1468] = 2, [2692] = 1 }) -- Murloc Fin Soup
add(6417, 90, 130, 150, 170, { [5051] = 1 }) -- Dig Rat Stew
add(6501, 90, 130, 150, 170, { [5503] = 1, [1179] = 1, [2678] = 1 }) -- Clam Chowder
add(45695, 100, 100, 105, 110, { [2596] = 1, [2594] = 1 }) -- Captain Rumsey's Lager
add(2547, 100, 135, 155, 175, { [1081] = 1, [1080] = 1 }) -- Redridge Goulash
add(2549, 100, 140, 160, 180, { [1015] = 2, [2665] = 1 }) -- Seasoned Wolf Kabob
add(6418, 100, 140, 160, 180, { [5470] = 1, [2692] = 1 }) -- Crispy Lizard Tail
add(7755, 100, 140, 160, 180, { [6308] = 1 }) -- Bristle Whisker Catfish
add(2548, 110, 130, 150, 170, { [2677] = 2, [2692] = 1 }) -- Succulent Pork Ribs
add(3377, 110, 150, 170, 190, { [2251] = 2, [2692] = 1 }) -- Gooey Spider Cake
add(3397, 110, 150, 170, 190, { [3730] = 1, [2692] = 1 }) -- Big Bear Steak
add(6419, 110, 150, 170, 190, { [5471] = 1, [2678] = 4 }) -- Lean Venison
add(3373, 120, 160, 180, 200, { [3667] = 1, [2692] = 1 }) -- Crocolisk Gumbo
add(6500, 125, 165, 185, 205, { [5504] = 1, [2692] = 1 }) -- Goblin Deviled Clams
add(15853, 125, 165, 185, 205, { [1015] = 1, [2678] = 1 }) -- Lean Wolf Steak
add(3398, 125, 175, 195, 215, { [3731] = 1, [2692] = 1 }) -- Hot Lion Chops
add(3376, 130, 170, 190, 210, { [3685] = 1, [2692] = 1 }) -- Curiously Tasty Omelet
add(24418, 150, 160, 180, 200, { [3667] = 2, [3713] = 1 }) -- Heavy Crocolisk Stew
add(3399, 150, 190, 210, 230, { [3731] = 2, [3713] = 1 }) -- Tasty Lion Steak
add(13028, 175, 175, 190, 205, { [3821] = 1, [159] = 1 }) -- Goldthorn Tea
add(7828, 175, 190, 210, 230, { [6362] = 1 }) -- Rockscale Cod
add(3400, 175, 215, 235, 255, { [3712] = 1, [3713] = 1 }) -- Soothing Turtle Bisque
add(4094, 175, 215, 235, 255, { [3404] = 1, [2692] = 1 }) -- Barbecued Buzzard Wing
add(7213, 175, 215, 235, 255, { [4655] = 1, [2692] = 1 }) -- Giant Clam Scorcho
add(15855, 175, 215, 235, 255, { [12184] = 1, [2692] = 1 }) -- Roast Raptor
add(15856, 175, 215, 235, 255, { [12203] = 1, [2692] = 1 }) -- Hot Wolf Ribs
add(15861, 175, 215, 235, 255, { [12202] = 1, [159] = 1, [4536] = 2 }) -- Jungle Stew
add(15863, 175, 215, 235, 255, { [12037] = 1, [2692] = 1 }) -- Carrion Surprise
add(15865, 175, 215, 235, 255, { [12037] = 1, [2596] = 1 }) -- Mystery Stew
add(20916, 175, 215, 235, 255, { [8365] = 1 }) -- Mithril Headed Trout
add(25954, 175, 215, 235, 255, { [21153] = 1, [2692] = 1 }) -- Sagefish Delight
add(15906, 200, 225, 237, 250, { [12037] = 1, [4402] = 1, [2692] = 1 }) -- Dragonbreath Chili
add(15910, 200, 225, 237, 250, { [12204] = 2, [3713] = 1, [159] = 1 }) -- Heavy Kodo Stew
add(21175, 200, 225, 237, 250, { [12205] = 2 }) -- Spider Sausage
add(15915, 225, 250, 262, 275, { [12206] = 1, [2692] = 2 }) -- Spiced Chili Crab
add(15933, 225, 250, 262, 275, { [12207] = 1, [3713] = 2 }) -- Monster Omelet
add(18238, 225, 250, 262, 275, { [4603] = 1 }) -- Spotted Yellowtail
add(18239, 225, 250, 262, 275, { [13754] = 1, [3713] = 1 }) -- Cooked Glossy Mightfish
add(18241, 225, 250, 262, 275, { [13758] = 1 }) -- Filet of Redgill
add(20626, 225, 250, 262, 275, { [7974] = 2, [2692] = 1, [1179] = 1 }) -- Undermine Clam Chowder
add(22480, 225, 250, 262, 275, { [12208] = 1, [3713] = 1 }) -- Tender Wolf Steak
add(18240, 240, 265, 277, 290, { [13755] = 1, [3713] = 1 }) -- Grilled Squid
add(18242, 240, 265, 277, 290, { [13756] = 1, [2692] = 2 }) -- Hot Smoked Bass
add(18243, 250, 275, 285, 295, { [13759] = 1, [159] = 1 }) -- Nightfin Soup
add(18244, 250, 275, 285, 295, { [13760] = 1 }) -- Poached Sunscale Salmon
add(46684, 250, 275, 285, 295, { [35562] = 1 }) -- Charred Bear Kabobs
add(46688, 250, 275, 285, 295, { [35562] = 1 }) -- Juicy Bear Burger
add(18245, 275, 300, 312, 325, { [13888] = 1, [159] = 1 }) -- Lobster Stew
add(18246, 275, 300, 312, 325, { [13893] = 1, [2692] = 1, [3713] = 1 }) -- Mightfish Steak
add(18247, 275, 300, 312, 325, { [13889] = 1, [3713] = 1 }) -- Baked Salmon
add(22761, 275, 300, 312, 325, { [18255] = 1, [3713] = 1 }) -- Runn Tum Tuber Surprise
add(24801, 285, 310, 322, 335, { [20424] = 1, [3713] = 1 }) -- Smoked Desert Dumplings
add(33279, 300, 320, 330, 340, { [27671] = 1 }) -- Buzzard Bites
add(33284, 300, 320, 330, 340, { [27674] = 1 }) -- Ravager Dog
add(33290, 300, 320, 330, 340, { [27422] = 1 }) -- Blackened Trout
add(33291, 300, 320, 330, 340, { [27425] = 1 }) -- Feltail Delight
add(36210, 300, 320, 330, 340, { [24477] = 2, [3713] = 1 }) -- Clam Bar
add(43758, 300, 320, 330, 340, { [27678] = 1, [13757] = 1 }) -- Stormchops
add(43761, 300, 320, 330, 340, { [33823] = 1 }) -- Broiled Bloodfin
add(25659, 300, 325, 337, 350, { [2692] = 1, [9061] = 1, [8150] = 1, [21024] = 1 }) -- Dirge's Kickin' Chimaerok Chops
add(43772, 300, 345, 355, 365, { [27671] = 1 }) -- Kibler's Bits
add(33285, 310, 330, 340, 350, { [27676] = 1 }) -- Sporeling Snack
add(33292, 310, 330, 340, 350, { [27429] = 1 }) -- Blackened Sporefish
add(33286, 315, 335, 345, 355, { [27677] = 1 }) -- Blackened Basilisk
add(33293, 320, 340, 350, 360, { [27435] = 1 }) -- Grilled Mudfish
add(33294, 320, 340, 350, 360, { [27437] = 1 }) -- Poached Bluefish
add(45022, 325, 325, 325, 325, { [34412] = 1, [17196] = 1, [17194] = 1 }) -- Hot Apple Cider
add(43707, 325, 335, 345, 355, { [33824] = 1 }) -- Skullfish Soup
add(43765, 325, 335, 345, 355, { [27682] = 1, [2692] = 1 }) -- Spicy Hot Talbuk
add(33287, 325, 345, 355, 365, { [27678] = 1 }) -- Roasted Clefthoof
add(33288, 325, 345, 355, 365, { [27681] = 1 }) -- Warp Burger
add(33289, 325, 345, 355, 365, { [27682] = 1 }) -- Talbuk Steak
add(33295, 325, 345, 355, 365, { [27438] = 1 }) -- Golden Fish Sticks
add(42296, 335, 335, 345, 355, { [27422] = 1, [2593] = 1, [3713] = 1 }) -- Stewed Trout
add(38867, 335, 355, 365, 375, { [31670] = 1 }) -- Mok'Nathal Shortribs
add(38868, 335, 355, 365, 375, { [31671] = 1 }) -- Crunchy Serpent
add(33296, 350, 370, 380, 390, { [27439] = 1 }) -- Spicy Crawdad
add(42302, 375, 375, 380, 385, { [27515] = 1, [4539] = 5, [3713] = 5 }) -- Fisherman's Feast
add(42305, 375, 375, 380, 385, { [27516] = 1, [3713] = 2 }) -- Hot Buttered Trout
-- DATA_END
