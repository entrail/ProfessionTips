local ADDON_NAME, ns = ...

-- Alchemy recipes for Classic Era (same shape as CookingData.lua): crafting
-- spell ID -> difficulty breakpoints + consumed reagents. Data from the
-- 1.15 client DB (wago.tools), cross-checked against Wowhead Classic.

local add = ns.NewRecipeDB("ALCHEMY", {
    [3371] = true, -- Empty Vial
    [3372] = true, -- Leaded Vial
    [8925] = true, -- Crystal Vial
})

-- DATA_START (generated; do not hand-edit between markers)
add(2329, 1, 55, 75, 95, { [2449] = 1, [765] = 1, [3371] = 1 }) -- Elixir of Lion's Strength
add(2330, 1, 55, 75, 95, { [2447] = 1, [765] = 1, [3371] = 1 }) -- Minor Healing Potion
add(7183, 1, 55, 75, 95, { [765] = 2, [3371] = 1 }) -- Elixir of Minor Defense
add(24266, 1, 315, 322, 330, { [12938] = 1, [19943] = 1, [12804] = 6, [13468] = 1 }) -- Gurubashi Mojo Madness
add(3170, 15, 60, 80, 100, { [2447] = 1, [2449] = 2, [3371] = 1 }) -- Weak Troll's Blood Potion
add(2331, 25, 65, 85, 105, { [785] = 1, [765] = 1, [3371] = 1 }) -- Minor Mana Potion
add(2332, 40, 70, 90, 110, { [785] = 2, [2447] = 1, [3371] = 1 }) -- Minor Rejuvenation Potion
add(2334, 50, 80, 100, 120, { [2449] = 2, [2447] = 1, [3371] = 1 }) -- Elixir of Minor Fortitude
add(3230, 50, 80, 100, 120, { [2452] = 1, [765] = 1, [3371] = 1 }) -- Elixir of Minor Agility
add(4508, 50, 80, 100, 120, { [3164] = 1, [2447] = 1, [3371] = 1 }) -- Discolored Healing Potion
add(2337, 55, 85, 105, 125, { [118] = 1, [2450] = 1 }) -- Lesser Healing Potion
add(2335, 60, 90, 110, 130, { [2452] = 1, [2450] = 1, [3371] = 1 }) -- Swiftness Potion
add(6617, 60, 90, 110, 130, { [5635] = 1, [2450] = 1, [3371] = 1 }) -- Rage Potion
add(7836, 80, 80, 90, 100, { [6358] = 2, [3371] = 1 }) -- Blackmouth Oil
add(3171, 90, 120, 140, 160, { [785] = 1, [2450] = 2, [3371] = 1 }) -- Elixir of Wisdom
add(7179, 90, 120, 140, 160, { [3820] = 1, [6370] = 2, [3371] = 1 }) -- Elixir of Water Breathing
add(8240, 90, 120, 140, 160, { [6522] = 1, [2449] = 1, [3371] = 1 }) -- Elixir of Giant Growth
add(7255, 100, 130, 150, 170, { [2453] = 1, [2452] = 1, [3371] = 1 }) -- Holy Protection Potion
add(7841, 100, 130, 150, 170, { [2452] = 1, [6370] = 1, [3371] = 1 }) -- Swim Speed Potion
add(3172, 110, 135, 155, 175, { [785] = 3, [3355] = 1, [3371] = 1 }) -- Minor Magic Resistance Potion
add(3447, 110, 135, 155, 175, { [2453] = 1, [2450] = 1, [3372] = 1 }) -- Healing Potion
add(3173, 120, 145, 165, 185, { [785] = 1, [3820] = 1, [3371] = 1 }) -- Lesser Mana Potion
add(3174, 120, 145, 165, 185, { [1288] = 1, [2453] = 1, [3372] = 1 }) -- Elixir of Poison Resistance
add(3176, 125, 150, 170, 190, { [2453] = 2, [2450] = 2, [3372] = 1 }) -- Strong Troll's Blood Potion
add(7837, 130, 150, 160, 170, { [6359] = 2, [3371] = 1 }) -- Fire Oil
add(3177, 130, 155, 175, 195, { [3355] = 1, [3820] = 1, [3372] = 1 }) -- Elixir of Defense
add(7256, 135, 160, 180, 200, { [3369] = 1, [3356] = 1, [3372] = 1 }) -- Shadow Protection Potion
add(2333, 140, 165, 185, 205, { [3355] = 1, [2452] = 1, [3372] = 1 }) -- Elixir of Lesser Agility
add(7845, 140, 165, 185, 205, { [6371] = 2, [3356] = 1, [3372] = 1 }) -- Elixir of Firepower
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
add(7259, 190, 210, 230, 250, { [3357] = 1, [3820] = 1, [3372] = 1 }) -- Nature Protection Potion
add(21923, 190, 210, 230, 250, { [3819] = 2, [3358] = 1, [3372] = 1 }) -- Elixir of Frost Power
add(3453, 195, 215, 235, 255, { [3358] = 1, [3818] = 1, [3372] = 1 }) -- Elixir of Detect Lesser Invisibility
add(11450, 195, 215, 235, 255, { [3355] = 1, [3821] = 1, [3372] = 1 }) -- Elixir of Greater Defense
add(3454, 200, 220, 240, 260, { [3358] = 4, [3819] = 2, [3372] = 1 }) -- Frost Oil
add(12609, 200, 220, 240, 260, { [3821] = 1, [3818] = 1, [3372] = 1 }) -- Catseye Elixir
add(11448, 205, 220, 240, 260, { [3358] = 1, [3821] = 1, [3372] = 1 }) -- Greater Mana Potion
add(11451, 205, 220, 240, 260, { [4625] = 1, [3821] = 1, [8925] = 1 }) -- Oil of Immolation
add(11453, 210, 225, 245, 265, { [3358] = 1, [8831] = 1, [8925] = 1 }) -- Magic Resistance Potion
add(11456, 210, 225, 245, 265, { [4625] = 1, [9260] = 1, [3372] = 1 }) -- Goblin Rocket Fuel
add(11452, 215, 225, 245, 265, { [7067] = 1, [3821] = 1, [8925] = 1 }) -- Restorative Potion
add(4942, 215, 230, 250, 270, { [3858] = 1, [3821] = 1, [3372] = 1 }) -- Lesser Stoneshield Potion
add(11457, 215, 230, 250, 270, { [8838] = 1, [3358] = 1, [8925] = 1 }) -- Superior Healing Potion
add(22808, 215, 230, 250, 270, { [7972] = 1, [8831] = 2, [8925] = 1 }) -- Elixir of Greater Water Breathing
add(11458, 225, 240, 260, 280, { [8153] = 1, [8831] = 1, [8925] = 1 }) -- Wildvine Potion
add(11459, 225, 240, 260, 280, { [3575] = 4, [9262] = 1, [8831] = 4, [4625] = 4 }) -- Philosophers' Stone
add(11479, 225, 240, 260, 280, { [3575] = 1 }) -- Transmute: Iron to Gold
add(11480, 225, 240, 260, 280, { [3860] = 1 }) -- Transmute: Mithril to Truesilver
add(11460, 230, 245, 265, 285, { [8836] = 1, [8925] = 1 }) -- Elixir of Detect Undead
add(15833, 230, 245, 265, 285, { [8831] = 3, [8925] = 1 }) -- Dreamless Sleep Potion
add(11461, 235, 250, 270, 290, { [8839] = 1, [3821] = 1, [8925] = 1 }) -- Arcane Elixir
add(11464, 235, 250, 270, 290, { [8845] = 1, [8838] = 1, [8925] = 1 }) -- Invisibility Potion
add(11465, 235, 250, 270, 290, { [8839] = 1, [3358] = 1, [8925] = 1 }) -- Elixir of Greater Intellect
add(11466, 240, 255, 275, 295, { [8836] = 1, [8839] = 1, [8925] = 1 }) -- Gift of Arthas
add(11467, 240, 255, 275, 295, { [8838] = 1, [3821] = 1, [8925] = 1 }) -- Elixir of Greater Agility
add(11468, 240, 255, 275, 295, { [8831] = 3, [8925] = 1 }) -- Elixir of Dream Vision
add(11472, 245, 260, 280, 300, { [8838] = 1, [8846] = 1, [8925] = 1 }) -- Elixir of Giants
add(11473, 245, 260, 280, 300, { [8845] = 2, [4342] = 1, [8925] = 1 }) -- Ghost Dye
add(17551, 250, 250, 255, 260, { [13422] = 1, [3372] = 1 }) -- Stonescale Oil
add(11476, 250, 265, 285, 305, { [8845] = 3, [8925] = 1 }) -- Elixir of Shadow Power
add(11477, 250, 265, 285, 305, { [8846] = 1, [8845] = 1, [8925] = 1 }) -- Elixir of Demonslaying
add(11478, 250, 265, 285, 305, { [8846] = 2, [8925] = 1 }) -- Elixir of Detect Demon
add(26277, 250, 265, 285, 305, { [6371] = 3, [4625] = 3, [8925] = 1 }) -- Elixir of Greater Firepower
add(3175, 250, 275, 295, 315, { [8839] = 2, [8845] = 1, [8925] = 1 }) -- Limited Invulnerability Potion
add(17552, 255, 270, 290, 310, { [8846] = 3, [8925] = 1 }) -- Mighty Rage Potion
add(17553, 260, 275, 295, 315, { [8838] = 2, [8839] = 2, [8925] = 1 }) -- Superior Mana Potion
add(17554, 265, 280, 300, 320, { [13423] = 2, [8838] = 1, [8925] = 1 }) -- Elixir of Superior Defense
add(17555, 270, 285, 305, 325, { [13463] = 1, [13466] = 2, [8925] = 1 }) -- Elixir of the Sages
add(17187, 275, 275, 282, 290, { [12359] = 1, [12363] = 1 }) -- Transmute: Arcanite
add(17559, 275, 275, 282, 290, { [7082] = 1 }) -- Transmute: Air to Fire
add(17560, 275, 275, 282, 290, { [7078] = 1 }) -- Transmute: Fire to Earth
add(17561, 275, 275, 282, 290, { [7076] = 1 }) -- Transmute: Earth to Water
add(17562, 275, 275, 282, 290, { [7080] = 1 }) -- Transmute: Water to Air
add(17563, 275, 275, 282, 290, { [12808] = 1 }) -- Transmute: Undeath to Water
add(17564, 275, 275, 282, 290, { [7080] = 1 }) -- Transmute: Water to Undeath
add(17565, 275, 275, 282, 290, { [12803] = 1 }) -- Transmute: Life to Earth
add(17566, 275, 275, 282, 290, { [7076] = 1 }) -- Transmute: Earth to Life
add(17556, 275, 290, 310, 330, { [13464] = 2, [13465] = 1, [8925] = 1 }) -- Major Healing Potion
add(17557, 275, 290, 310, 330, { [8846] = 2, [13466] = 2, [8925] = 1 }) -- Elixir of Brute Force
add(24365, 275, 290, 310, 330, { [13463] = 1, [13466] = 2, [8925] = 1 }) -- Mageblood Potion
add(24366, 275, 290, 310, 330, { [13463] = 2, [13464] = 1, [8925] = 1 }) -- Greater Dreamless Sleep Potion
add(17570, 280, 295, 315, 335, { [13423] = 3, [10620] = 1, [8925] = 1 }) -- Greater Stoneshield Potion
add(17571, 280, 295, 315, 335, { [13465] = 2, [13466] = 2, [8925] = 1 }) -- Elixir of the Mongoose
add(17572, 285, 300, 320, 340, { [13467] = 2, [13466] = 2, [8925] = 1 }) -- Purification Potion
add(17573, 285, 300, 320, 340, { [13463] = 3, [13465] = 1, [8925] = 1 }) -- Greater Arcane Elixir
add(24367, 285, 300, 320, 340, { [13467] = 2, [13465] = 2, [10286] = 2, [8925] = 1 }) -- Living Action Potion
add(17574, 290, 305, 325, 345, { [7068] = 1, [13463] = 1, [8925] = 1 }) -- Greater Fire Protection Potion
add(17575, 290, 305, 325, 345, { [7070] = 1, [13463] = 1, [8925] = 1 }) -- Greater Frost Protection Potion
add(17576, 290, 305, 325, 345, { [7067] = 1, [13463] = 1, [8925] = 1 }) -- Greater Nature Protection Potion
add(17577, 290, 305, 325, 345, { [11176] = 1, [13463] = 1, [8925] = 1 }) -- Greater Arcane Protection Potion
add(17578, 290, 305, 325, 345, { [3824] = 1, [13463] = 1, [8925] = 1 }) -- Greater Shadow Protection Potion
add(24368, 290, 305, 325, 345, { [8846] = 1, [13466] = 2, [8925] = 1 }) -- Major Troll's Blood Potion
add(17580, 295, 310, 330, 350, { [13463] = 3, [13467] = 2, [8925] = 1 }) -- Major Mana Potion
add(25146, 300, 301, 305, 310, { [7077] = 1 }) -- Transmute: Elemental Fire
add(22732, 300, 310, 320, 330, { [10286] = 1, [13464] = 4, [13463] = 4, [18256] = 1 }) -- Major Rejuvenation Potion
add(17632, 300, 315, 322, 330, { [7078] = 8, [7076] = 8, [7082] = 8, [7080] = 8, [12803] = 8, [9262] = 2, [13468] = 4 }) -- Alchemist's Stone
add(17634, 300, 315, 322, 330, { [13423] = 30, [13465] = 10, [13468] = 1, [8925] = 1 }) -- Flask of Petrification
add(17635, 300, 315, 322, 330, { [8846] = 30, [13423] = 10, [13468] = 1, [8925] = 1 }) -- Flask of the Titans
add(17636, 300, 315, 322, 330, { [13463] = 30, [13467] = 10, [13468] = 1, [8925] = 1 }) -- Flask of Distilled Wisdom
add(17637, 300, 315, 322, 330, { [13463] = 30, [13465] = 10, [13468] = 1, [8925] = 1 }) -- Flask of Supreme Power
add(17638, 300, 315, 322, 330, { [13467] = 30, [13465] = 10, [13468] = 1, [8925] = 1 }) -- Flask of Chromatic Resistance
-- DATA_END
