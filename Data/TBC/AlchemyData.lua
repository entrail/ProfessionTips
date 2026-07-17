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
add(2329, 1, 55, 75, 95, { [2449] = 1, [765] = 1, [3371] = 1 }) -- Elixir of Lion's Strength
add(7183, 1, 55, 75, 95, { [765] = 2, [3371] = 1 }) -- Elixir of Minor Defense
add(2330, 1, 55, 75, 95, { [2447] = 1, [765] = 1, [3371] = 1 }) -- Minor Healing Potion
add(24266, 315, 315, 322, 330, { [12938] = 1, [19943] = 1, [12804] = 6, [13468] = 1 }) -- Gurubashi Mojo Madness
add(41458, 360, 360, 370, 380, { [22457] = 2, [22793] = 7, [23782] = 1 }) -- Cauldron of Major Arcane Protection
add(41500, 360, 360, 370, 380, { [21884] = 2, [22793] = 7, [23782] = 1 }) -- Cauldron of Major Fire Protection
add(41501, 360, 360, 370, 380, { [21885] = 2, [22793] = 7, [23782] = 1 }) -- Cauldron of Major Frost Protection
add(41502, 360, 360, 370, 380, { [21886] = 2, [22793] = 7, [23782] = 1 }) -- Cauldron of Major Nature Protection
add(41503, 360, 360, 370, 380, { [22456] = 2, [22793] = 7, [23782] = 1 }) -- Cauldron of Major Shadow Protection
add(28585, 385, 385, 392, 400, { [22452] = 1 }) -- Transmute: Primal Earth to Life
add(28583, 385, 385, 392, 400, { [21884] = 1 }) -- Transmute: Primal Fire to Mana
add(28584, 385, 385, 392, 400, { [21886] = 1 }) -- Transmute: Primal Life to Earth
add(28582, 385, 385, 392, 400, { [22457] = 1 }) -- Transmute: Primal Mana to Fire
add(28580, 385, 385, 392, 400, { [22456] = 1 }) -- Transmute: Primal Shadow to Water
add(28581, 385, 385, 392, 400, { [21885] = 1 }) -- Transmute: Primal Water to Shadow
add(28590, 390, 390, 397, 405, { [22794] = 1, [22793] = 3, [22791] = 7, [18256] = 1 }) -- Flask of Blinding Light
add(28587, 390, 390, 397, 405, { [22794] = 1, [22793] = 3, [22790] = 7, [18256] = 1 }) -- Flask of Fortification
add(28588, 390, 390, 397, 405, { [22794] = 1, [22793] = 3, [22786] = 7, [18256] = 1 }) -- Flask of Mighty Restoration
add(28591, 390, 390, 397, 405, { [22794] = 1, [22793] = 3, [22792] = 7, [18256] = 1 }) -- Flask of Pure Death
add(28589, 390, 390, 397, 405, { [22794] = 1, [22793] = 3, [22789] = 7, [18256] = 1 }) -- Flask of Relentless Assault
add(28586, 390, 390, 397, 405, { [22793] = 2, [22786] = 1, [22791] = 1, [18256] = 1 }) -- Super Rejuvenation Potion
add(3170, 15, 60, 80, 100, { [2447] = 1, [2449] = 2, [3371] = 1 }) -- Weak Troll's Blood Potion
add(2331, 25, 65, 85, 105, { [785] = 1, [765] = 1, [3371] = 1 }) -- Minor Mana Potion
add(2332, 40, 70, 90, 110, { [785] = 2, [2447] = 1, [3371] = 1 }) -- Minor Rejuvenation Potion
add(4508, 50, 80, 100, 120, { [3164] = 1, [2447] = 1, [3371] = 1 }) -- Discolored Healing Potion
add(3230, 50, 80, 100, 120, { [2452] = 1, [765] = 1, [3371] = 1 }) -- Elixir of Minor Agility
add(2334, 50, 80, 100, 120, { [2449] = 2, [2447] = 1, [3371] = 1 }) -- Elixir of Minor Fortitude
add(2337, 55, 85, 105, 125, { [118] = 1, [2450] = 1 }) -- Lesser Healing Potion
add(6617, 60, 90, 110, 130, { [5635] = 2, [3371] = 1 }) -- Rage Potion
add(2335, 60, 90, 110, 130, { [2452] = 1, [2450] = 1, [3371] = 1 }) -- Swiftness Potion
add(7836, 80, 80, 90, 100, { [6358] = 2, [3371] = 1 }) -- Blackmouth Oil
add(8240, 90, 120, 140, 160, { [6522] = 1, [2449] = 1, [3371] = 1 }) -- Elixir of Giant Growth
add(7179, 90, 120, 140, 160, { [3820] = 1, [6370] = 2, [3371] = 1 }) -- Elixir of Water Breathing
add(3171, 90, 120, 140, 160, { [785] = 1, [2450] = 2, [3371] = 1 }) -- Elixir of Wisdom
add(7255, 100, 130, 150, 170, { [2453] = 1, [2452] = 1, [3371] = 1 }) -- Holy Protection Potion
add(7841, 100, 130, 150, 170, { [2452] = 1, [6370] = 1, [3371] = 1 }) -- Swim Speed Potion
add(3447, 110, 135, 155, 175, { [2453] = 1, [2450] = 1, [3372] = 1 }) -- Healing Potion
add(3172, 110, 135, 155, 175, { [785] = 3, [3355] = 1, [3371] = 1 }) -- Minor Magic Resistance Potion
add(3173, 120, 145, 165, 185, { [785] = 1, [3820] = 1, [3371] = 1 }) -- Lesser Mana Potion
add(3174, 120, 145, 165, 185, { [1288] = 1, [2453] = 1, [3372] = 1 }) -- Potion of Curing
add(3176, 125, 150, 170, 190, { [2453] = 2, [2450] = 2, [3372] = 1 }) -- Strong Troll's Blood Potion
add(7837, 130, 150, 160, 170, { [6359] = 2, [3371] = 1 }) -- Fire Oil
add(3177, 130, 155, 175, 195, { [3355] = 1, [3820] = 1, [3372] = 1 }) -- Elixir of Defense
add(7256, 135, 160, 180, 200, { [3369] = 1, [3356] = 1, [3372] = 1 }) -- Shadow Protection Potion
add(7845, 140, 165, 185, 205, { [6371] = 2, [3356] = 1, [3372] = 1 }) -- Elixir of Firepower
add(2333, 140, 165, 185, 205, { [3355] = 1, [2452] = 1, [3372] = 1 }) -- Elixir of Lesser Agility
add(3188, 150, 175, 195, 215, { [2449] = 1, [3356] = 1, [3372] = 1 }) -- Elixir of Ogre's Strength
add(6624, 150, 175, 195, 215, { [6370] = 2, [3820] = 1, [3372] = 1 }) -- Free Action Potion
add(7181, 155, 175, 195, 215, { [3357] = 1, [3356] = 1, [3372] = 1 }) -- Greater Healing Potion
add(3452, 160, 180, 200, 220, { [3820] = 1, [3356] = 1, [3372] = 1 }) -- Mana Potion
add(3448, 165, 185, 205, 225, { [3818] = 1, [3355] = 1, [3372] = 1 }) -- Lesser Invisibility Potion
add(3449, 165, 190, 210, 230, { [3818] = 4, [3369] = 4, [3372] = 1 }) -- Shadow Oil
add(7257, 165, 210, 230, 250, { [4402] = 1, [6371] = 1, [3372] = 1 }) -- Fire Protection Potion
add(3450, 175, 195, 215, 235, { [3355] = 1, [3821] = 1, [3372] = 1 }) -- Elixir of Fortitude
add(6618, 175, 195, 215, 235, { [5637] = 1, [3356] = 1, [3372] = 1 }) -- Great Rage Potion
add(3451, 180, 200, 220, 240, { [3357] = 1, [2453] = 1, [3372] = 1 }) -- Mighty Troll's Blood Potion
add(11449, 185, 205, 225, 245, { [3820] = 1, [3821] = 1, [3372] = 1 }) -- Elixir of Agility
add(7258, 190, 205, 225, 245, { [3819] = 1, [3821] = 1, [3372] = 1 }) -- Frost Protection Potion
add(21923, 190, 210, 230, 250, { [3819] = 2, [3358] = 1, [3372] = 1 }) -- Elixir of Frost Power
add(7259, 190, 210, 230, 250, { [3357] = 1, [3820] = 1, [3372] = 1 }) -- Nature Protection Potion
add(3453, 195, 215, 235, 255, { [3358] = 1, [3818] = 1, [3372] = 1 }) -- Elixir of Detect Lesser Invisibility
add(11450, 195, 215, 235, 255, { [3355] = 1, [3821] = 1, [3372] = 1 }) -- Elixir of Greater Defense
add(12609, 200, 220, 240, 260, { [3821] = 1, [3818] = 1, [3372] = 1 }) -- Catseye Elixir
add(3454, 200, 220, 240, 260, { [3358] = 4, [3819] = 2, [3372] = 1 }) -- Frost Oil
add(11448, 205, 220, 240, 260, { [3358] = 1, [3821] = 1, [3372] = 1 }) -- Greater Mana Potion
add(11451, 205, 220, 240, 260, { [4625] = 1, [3821] = 1, [8925] = 1 }) -- Oil of Immolation
add(11456, 210, 225, 245, 265, { [4625] = 1, [9260] = 1, [3372] = 1 }) -- Goblin Rocket Fuel
add(11453, 210, 225, 245, 265, { [3358] = 1, [8831] = 1, [8925] = 1 }) -- Magic Resistance Potion
add(11452, 215, 225, 245, 265, { [7067] = 1, [3821] = 1, [8925] = 1 }) -- Restorative Potion
add(22808, 215, 230, 250, 270, { [7972] = 1, [8831] = 2, [8925] = 1 }) -- Elixir of Greater Water Breathing
add(4942, 215, 230, 250, 270, { [3858] = 1, [3821] = 1, [3372] = 1 }) -- Lesser Stoneshield Potion
add(11457, 215, 230, 250, 270, { [8838] = 1, [3358] = 1, [8925] = 1 }) -- Superior Healing Potion
add(11459, 225, 240, 260, 280, { [3575] = 4, [9262] = 1, [8831] = 4, [4625] = 4 }) -- Philosopher's Stone
add(11479, 225, 240, 260, 280, { [3575] = 1 }) -- Transmute: Iron to Gold
add(11480, 225, 240, 260, 280, { [3860] = 1 }) -- Transmute: Mithril to Truesilver
add(11458, 225, 240, 260, 280, { [8153] = 1, [8831] = 1, [8925] = 1 }) -- Wildvine Potion
add(15833, 230, 245, 265, 285, { [8831] = 3, [8925] = 1 }) -- Dreamless Sleep Potion
add(11460, 230, 245, 265, 285, { [8836] = 1, [8925] = 1 }) -- Elixir of Detect Undead
add(11461, 235, 250, 270, 290, { [8839] = 1, [3821] = 1, [8925] = 1 }) -- Arcane Elixir
add(11465, 235, 250, 270, 290, { [8839] = 1, [3358] = 1, [8925] = 1 }) -- Elixir of Greater Intellect
add(11464, 235, 250, 270, 290, { [8845] = 1, [8838] = 1, [8925] = 1 }) -- Invisibility Potion
add(11468, 240, 255, 275, 295, { [8831] = 3, [8925] = 1 }) -- Elixir of Dream Vision
add(11467, 240, 255, 275, 295, { [8838] = 1, [3821] = 1, [8925] = 1 }) -- Elixir of Greater Agility
add(11466, 240, 255, 275, 295, { [8836] = 1, [8839] = 1, [8925] = 1 }) -- Gift of Arthas
add(11472, 245, 260, 280, 300, { [8838] = 1, [8846] = 1, [8925] = 1 }) -- Elixir of Giants
add(11473, 245, 260, 280, 300, { [8845] = 2, [4342] = 1, [8925] = 1 }) -- Ghost Dye
add(17551, 250, 250, 255, 260, { [13422] = 1, [3372] = 1 }) -- Stonescale Oil
add(11477, 250, 265, 285, 305, { [8846] = 1, [8845] = 1, [8925] = 1 }) -- Elixir of Demonslaying
add(11478, 250, 265, 285, 305, { [8846] = 2, [8925] = 1 }) -- Elixir of Detect Demon
add(26277, 250, 265, 285, 305, { [6371] = 3, [4625] = 3, [8925] = 1 }) -- Elixir of Greater Firepower
add(11476, 250, 265, 285, 305, { [8845] = 3, [8925] = 1 }) -- Elixir of Shadow Power
add(3175, 250, 275, 295, 315, { [8839] = 2, [8845] = 1, [8925] = 1 }) -- Limited Invulnerability Potion
add(17552, 255, 270, 290, 310, { [8846] = 3, [8925] = 1 }) -- Mighty Rage Potion
add(17553, 260, 275, 295, 315, { [8838] = 2, [8839] = 2, [8925] = 1 }) -- Superior Mana Potion
add(17554, 265, 280, 300, 320, { [13423] = 2, [8838] = 1, [8925] = 1 }) -- Elixir of Superior Defense
add(17555, 270, 285, 305, 325, { [13463] = 1, [13466] = 2, [8925] = 1 }) -- Elixir of the Sages
add(17559, 275, 275, 282, 290, { [7082] = 1 }) -- Transmute: Air to Fire
add(17187, 275, 275, 282, 290, { [12359] = 1, [12363] = 1 }) -- Transmute: Arcanite
add(17566, 275, 275, 282, 290, { [7076] = 1 }) -- Transmute: Earth to Life
add(17561, 275, 275, 282, 290, { [7076] = 1 }) -- Transmute: Earth to Water
add(17560, 275, 275, 282, 290, { [7078] = 1 }) -- Transmute: Fire to Earth
add(17565, 275, 275, 282, 290, { [12803] = 1 }) -- Transmute: Life to Earth
add(17563, 275, 275, 282, 290, { [12808] = 1 }) -- Transmute: Undeath to Water
add(17562, 275, 275, 282, 290, { [7080] = 1 }) -- Transmute: Water to Air
add(17564, 275, 275, 282, 290, { [7080] = 1 }) -- Transmute: Water to Undeath
add(17557, 275, 290, 310, 330, { [8846] = 2, [13466] = 2, [8925] = 1 }) -- Elixir of Brute Force
add(24366, 275, 290, 310, 330, { [13463] = 2, [13464] = 1, [8925] = 1 }) -- Greater Dreamless Sleep Potion
add(24365, 275, 290, 310, 330, { [13463] = 1, [13466] = 2, [8925] = 1 }) -- Mageblood Potion
add(17556, 275, 290, 310, 330, { [13464] = 2, [13465] = 1, [8925] = 1 }) -- Major Healing Potion
add(17571, 280, 295, 315, 335, { [13465] = 2, [13466] = 2, [8925] = 1 }) -- Elixir of the Mongoose
add(17570, 280, 295, 315, 335, { [13423] = 2, [10620] = 1, [8925] = 1 }) -- Greater Stoneshield Potion
add(17573, 285, 300, 320, 340, { [13463] = 3, [13465] = 1, [8925] = 1 }) -- Greater Arcane Elixir
add(24367, 285, 300, 320, 340, { [13467] = 2, [13465] = 2, [10286] = 2, [8925] = 1 }) -- Living Action Potion
add(17572, 285, 300, 320, 340, { [13467] = 2, [13466] = 2, [8925] = 1 }) -- Purification Potion
add(17577, 290, 305, 325, 345, { [11176] = 1, [13463] = 1, [8925] = 1 }) -- Greater Arcane Protection Potion
add(17574, 290, 305, 325, 345, { [7068] = 1, [13463] = 1, [8925] = 1 }) -- Greater Fire Protection Potion
add(17575, 290, 305, 325, 345, { [7070] = 1, [13463] = 1, [8925] = 1 }) -- Greater Frost Protection Potion
add(17576, 290, 305, 325, 345, { [7067] = 1, [13463] = 1, [8925] = 1 }) -- Greater Nature Protection Potion
add(17578, 290, 305, 325, 345, { [3824] = 1, [13463] = 1, [8925] = 1 }) -- Greater Shadow Protection Potion
add(24368, 290, 305, 325, 345, { [8846] = 1, [13466] = 2, [8925] = 1 }) -- Major Troll's Blood Potion
add(17580, 295, 310, 330, 350, { [13463] = 3, [13467] = 2, [8925] = 1 }) -- Major Mana Potion
add(25146, 300, 301, 305, 310, { [7077] = 1 }) -- Transmute: Elemental Fire
add(22732, 300, 310, 320, 330, { [10286] = 1, [13464] = 4, [13463] = 4, [18256] = 1 }) -- Major Rejuvenation Potion
add(33740, 300, 315, 322, 330, { [13463] = 1, [22785] = 1, [18256] = 1 }) -- Adept's Elixir
add(17638, 300, 315, 322, 330, { [13467] = 7, [13465] = 3, [13468] = 1, [8925] = 1 }) -- Flask of Chromatic Resistance
add(17636, 300, 315, 322, 330, { [13463] = 7, [13467] = 3, [13468] = 1, [8925] = 1 }) -- Flask of Distilled Wisdom
add(17634, 300, 315, 322, 330, { [13423] = 7, [13465] = 3, [13468] = 1, [8925] = 1 }) -- Flask of Petrification
add(17637, 300, 315, 322, 330, { [13463] = 7, [13465] = 3, [13468] = 1, [8925] = 1 }) -- Flask of Supreme Power
add(17635, 300, 315, 322, 330, { [8846] = 7, [13423] = 3, [13468] = 1, [8925] = 1 }) -- Flask of the Titans
add(33738, 300, 315, 322, 330, { [13465] = 1, [22785] = 1, [18256] = 1 }) -- Onslaught Elixir
add(33732, 300, 315, 322, 330, { [13464] = 1, [22785] = 1, [18256] = 1 }) -- Volatile Healing Potion
add(17632, 300, 365, 372, 380, { [9149] = 1, [25867] = 1, [25868] = 1, [22794] = 2, [23571] = 5 }) -- Alchemist's Stone
add(28543, 305, 320, 327, 335, { [22787] = 1, [22785] = 1, [18256] = 1 }) -- Elixir of Camouflage
add(28544, 305, 320, 327, 335, { [13465] = 1, [22785] = 1, [18256] = 1 }) -- Elixir of Major Strength
add(28545, 310, 325, 332, 340, { [13464] = 1, [22786] = 1, [18256] = 1 }) -- Elixir of Healing Power
add(39636, 310, 325, 332, 340, { [22787] = 2, [22785] = 1, [18256] = 1 }) -- Elixir of Major Fortitude
add(33733, 310, 325, 332, 340, { [22787] = 2, [22785] = 1, [18256] = 1 }) -- Unstable Mana Potion
add(33741, 315, 330, 337, 345, { [22789] = 3, [22785] = 1, [18256] = 1 }) -- Elixir of Mastery
add(28546, 315, 330, 337, 345, { [22787] = 2, [22785] = 1, [18256] = 1 }) -- Sneaking Potion
add(39637, 320, 335, 342, 350, { [22786] = 1, [22787] = 2, [18256] = 1 }) -- Earthen Elixir
add(39638, 320, 335, 342, 350, { [22785] = 1, [22789] = 1, [18256] = 1 }) -- Elixir of Draenic Wisdom
add(28549, 320, 335, 342, 350, { [22578] = 2, [22790] = 1, [18256] = 1 }) -- Elixir of Major Frost Power
add(28550, 320, 335, 342, 350, { [22789] = 3, [18256] = 1 }) -- Insane Strength Potion
add(45061, 325, 335, 342, 350, { [8925] = 1, [22787] = 2 }) -- Mad Alchemist's Potion
add(28552, 325, 340, 347, 355, { [22787] = 2, [22789] = 1, [18256] = 1 }) -- Elixir of the Searching Eye
add(38070, 325, 340, 347, 355, { [22452] = 1, [21886] = 1, [22457] = 1 }) -- Mercurial Stone
add(28551, 325, 340, 347, 355, { [22791] = 2, [22785] = 1, [18256] = 1 }) -- Super Healing Potion
add(39639, 330, 345, 352, 360, { [22790] = 1, [22787] = 1, [18256] = 1 }) -- Elixir of Ironskin
add(28553, 330, 345, 352, 360, { [22789] = 1, [22785] = 2, [18256] = 1 }) -- Elixir of Major Agility
add(38960, 335, 350, 357, 365, { [22789] = 1, [22792] = 2, [18256] = 1 }) -- Fel Strength Elixir
add(28554, 335, 350, 357, 365, { [22787] = 3, [22791] = 1, [18256] = 1 }) -- Shrouding Potion
add(28555, 340, 355, 362, 370, { [22786] = 2, [22785] = 1, [18256] = 1 }) -- Super Mana Potion
add(28557, 345, 360, 367, 375, { [22790] = 3, [22789] = 1, [18256] = 1 }) -- Elixir of Major Defense
add(28556, 345, 360, 367, 375, { [22574] = 2, [22790] = 1, [18256] = 1 }) -- Elixir of Major Firepower
add(38962, 345, 360, 367, 375, { [22785] = 2, [22792] = 3, [18256] = 1 }) -- Fel Regeneration Potion
add(28565, 350, 365, 372, 380, { [22792] = 2, [22791] = 1, [18256] = 1 }) -- Destruction Potion
add(28558, 350, 365, 372, 380, { [22790] = 1, [22792] = 1, [18256] = 1 }) -- Elixir of Major Shadow Power
add(28564, 350, 365, 372, 380, { [22789] = 2, [22791] = 1, [18256] = 1 }) -- Haste Potion
add(28563, 350, 365, 372, 380, { [22789] = 2, [22790] = 1, [18256] = 1 }) -- Heroic Potion
add(28562, 350, 365, 372, 380, { [22786] = 1, [22792] = 1, [18256] = 1 }) -- Major Dreamless Sleep Potion
add(32765, 350, 365, 372, 380, { [23079] = 3, [23107] = 3, [23112] = 3, [22452] = 2, [21885] = 2 }) -- Transmute: Earthstorm Diamond
add(28566, 350, 365, 372, 380, { [22451] = 1 }) -- Transmute: Primal Air to Fire
add(28567, 350, 365, 372, 380, { [22452] = 1 }) -- Transmute: Primal Earth to Water
add(28568, 350, 365, 372, 380, { [21884] = 1 }) -- Transmute: Primal Fire to Earth
add(29688, 350, 365, 372, 380, { [22452] = 1, [21885] = 1, [22451] = 1, [21884] = 1, [22457] = 1 }) -- Transmute: Primal Might
add(28569, 350, 365, 372, 380, { [21885] = 1 }) -- Transmute: Primal Water to Air
add(32766, 350, 365, 372, 380, { [23077] = 3, [21929] = 3, [23117] = 3, [21884] = 2, [22451] = 2 }) -- Transmute: Skyfire Diamond
add(28570, 355, 370, 377, 385, { [22790] = 1, [22791] = 1, [18256] = 1 }) -- Elixir of Major Mageblood
add(38961, 360, 375, 382, 390, { [22793] = 1, [22792] = 2, [18256] = 1 }) -- Fel Mana Potion
add(28575, 360, 375, 382, 390, { [22457] = 1, [22793] = 3, [18256] = 5 }) -- Major Arcane Protection Potion
add(28571, 360, 375, 382, 390, { [21884] = 1, [22793] = 3, [18256] = 5 }) -- Major Fire Protection Potion
add(28572, 360, 375, 382, 390, { [21885] = 1, [22793] = 3, [18256] = 5 }) -- Major Frost Protection Potion
add(28577, 360, 375, 382, 390, { [21886] = 1, [22793] = 3, [18256] = 5 }) -- Major Holy Protection Potion
add(28573, 360, 375, 382, 390, { [21886] = 1, [22793] = 3, [18256] = 5 }) -- Major Nature Protection Potion
add(28576, 360, 375, 382, 390, { [22456] = 1, [22793] = 3, [18256] = 5 }) -- Major Shadow Protection Potion
add(28578, 365, 380, 387, 395, { [22791] = 1, [22793] = 1, [18256] = 1 }) -- Elixir of Empowerment
add(28579, 365, 380, 387, 395, { [22790] = 2, [22573] = 3, [18256] = 1 }) -- Ironshield Potion
add(47050, 375, 390, 397, 405, { [13503] = 1, [22456] = 6, [30183] = 2 }) -- Assassin's Alchemist Stone
add(42736, 375, 390, 397, 405, { [22786] = 7, [22791] = 3, [22794] = 1, [18256] = 1 }) -- Flask of Chromatic Wonder
add(47046, 375, 390, 397, 405, { [13503] = 1, [22451] = 6, [30183] = 2 }) -- Guardian's Alchemist Stone
add(47049, 375, 390, 397, 405, { [13503] = 1, [21886] = 6, [30183] = 2 }) -- Redeemer's Alchemist Stone
add(47048, 375, 390, 397, 405, { [13503] = 1, [21884] = 6, [30183] = 2 }) -- Sorcerer's Alchemist Stone
-- DATA_END
