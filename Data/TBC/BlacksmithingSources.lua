local ADDON_NAME, ns = ...

-- Acquisition sources for TBC Blacksmithing recipes: where each recipe
-- is obtained. Keyed by crafting spell ID (same as BlacksmithingData.lua).
-- Generated from Wowhead classic data 2026-08-05.

local S = ns.NewSourceDB("BLACKSMITHING")

-- DATA_START (generated; do not hand-edit between markers)
S(2660, {{k="t"}}) -- Rough Sharpening Stone (auto-learned with Apprentice Blacksmithing)
S(3115, {{k="t"}}) -- Rough Weightstone (auto-learned with Apprentice Blacksmithing)
S(12260, {{k="t"}}) -- Rough Copper Vest (auto-learned with Apprentice Blacksmithing)
S(2663, {{k="t"}}) -- Copper Bracers (auto-learned with Apprentice Blacksmithing)
S(2662, {{k="t", cost=50}}) -- Copper Chain Pants
S(2737, {{k="t", cost=50}}) -- Copper Mace
S(2738, {{k="t", cost=50}}) -- Copper Axe
S(3319, {{k="t", cost=50}}) -- Copper Chain Boots
S(3320, {{k="t", cost=100}}) -- Rough Grinding Stone
S(2739, {{k="t", cost=50}}) -- Copper Shortsword
S(8880, {{k="t", cost=100}}) -- Copper Dagger
S(9983, {{k="t", cost=100}}) -- Copper Claymore
S(2661, {{k="t", cost=100}}) -- Copper Chain Belt
S(3293, {{k="t", cost=250}}) -- Copper Battle Axe
S(3321, {{k="w", item=3609}}) -- Copper Chain Vest
S(43549, {{k="q", item=33792, quest=1578, name="Supplying the Front", zone="Ironforge", faction="Alliance"}}) -- Heavy Copper Longsword
S(3323, {{k="t", cost=100}}) -- Runed Copper Gauntlets
S(3324, {{k="t", cost=200}}) -- Runed Copper Pants
S(3325, {{k="w", item=3610}}) -- Gemmed Copper Gauntlets
S(2665, {{k="t", cost=100}}) -- Coarse Sharpening Stone
S(3116, {{k="t", cost=100}}) -- Coarse Weightstone
S(7408, {{k="t", cost=300}}) -- Heavy Copper Maul
S(2666, {{k="t", cost=200}}) -- Runed Copper Belt
S(3294, {{k="t", cost=500}}) -- Thick War Axe
S(3326, {{k="t", cost=250}}) -- Coarse Grinding Stone
S(2667, {{k="w", item=2881}}) -- Runed Copper Breastplate
S(2664, {{k="t", cost=500}}) -- Runed Copper Bracers
S(7817, {{k="t", cost=200}}) -- Rough Bronze Boots
S(3292, {{k="t", cost=500}}) -- Heavy Copper Broadsword
S(19666, {{k="t", cost=100}}) -- Silver Skeleton Key
S(7818, {{k="t", cost=100}}) -- Silver Rod
S(34979, {{k="t", cost=600}}) -- Thick Bronze Darts
S(8367, {{k="q", item=6735, quest=1618, name="Gearing Redridge", zone="Ironforge", faction="Alliance"}}) -- Ironforge Breastplate
S(3491, {{k="t", cost=600}}) -- Big Bronze Knife
S(2668, {{k="t", cost=300}}) -- Rough Bronze Leggings
S(2670, {{k="t", cost=500}}) -- Rough Bronze Cuirass
S(2740, {{k="t", cost=200}}) -- Bronze Mace
S(3328, {{k="t", cost=500}}) -- Rough Bronze Shoulders
S(6517, {{k="t", cost=800}}) -- Pearl-handled Dagger
S(2741, {{k="t", cost=200}}) -- Bronze Axe
S(2672, {{k="t", cost=500}}) -- Patterned Bronze Bracers
S(2742, {{k="t", cost=200}}) -- Bronze Shortsword
S(2674, {{k="t", cost=1000}}) -- Heavy Sharpening Stone
S(3117, {{k="t", cost=1000}}) -- Heavy Weightstone
S(3337, {{k="t", cost=1000}}) -- Heavy Grinding Stone
S(3295, {{k="w", item=2883}}) -- Deadly Bronze Poniard
S(3330, {{k="w", item=2882}}) -- Silvered Bronze Shoulders
S(9985, {{k="t", cost=250}}) -- Bronze Warhammer
S(2673, {{k="w", item=5578}}) -- Silvered Bronze Breastplate
S(3296, {{k="t", cost=1000}}) -- Heavy Bronze Mace
S(3331, {{k="t", cost=500}}) -- Silvered Bronze Boots
S(9986, {{k="t", cost=500}}) -- Bronze Greatsword
S(3333, {{k="t", cost=1000}}) -- Silvered Bronze Gauntlets
S(9987, {{k="t", cost=500}}) -- Bronze Battle Axe
S(6518, {{k="w", item=5543}}) -- Iridescent Hammer
S(2675, {{k="t", cost=1000}}) -- Shining Silver Breastplate
S(3297, {{k="w", item=3608}}) -- Mighty Iron Hammer
S(3334, {{k="w", item=3611}}) -- Green Iron Boots
S(8768, {{k="t", cost=250}}) -- Iron Buckle
S(19667, {{k="t", cost=250}}) -- Golden Skeleton Key
S(14379, {{k="t", cost=250}}) -- Golden Rod
S(3336, {{k="w", item=3612}}) -- Green Iron Gauntlets
S(7221, {{k="w", item=6044}}) -- Iron Shield Spike
S(3494, {{k="v", item=10858, cost=3000, npc=1471, name="Jannos Ironwill", zone="Arathi Highlands"},
         {k="v", item=10858, cost=3000, npc=8878, name="Muuran", limited=true, zone="Desolace"},
         {k="v", item=10858, cost=3000, npc=9179, name="Jazzrik", limited=true, zone="Badlands"}}) -- Solid Iron Maul
S(3506, {{k="t", cost=5000}}) -- Green Iron Leggings
S(12259, {{k="w", item=10424}}) -- Silvered Bronze Leggings
S(3492, {{k="v", item=12162, cost=3000, npc=2843, name="Jutak", limited=true, zone="Stranglethorn Vale"},
         {k="v", item=12162, cost=3000, npc=5512, name="Kaita Deepforge", limited=true, zone="Stormwind City"},
         {k="v", item=12162, cost=3000, npc=3356, name="Sumi", limited=true, zone="Orgrimmar"}}) -- Hardened Iron Shortsword
S(3504, {{k="w", item=3870}}) -- Green Iron Shoulders
S(9811, {{k="q", item=7978, quest=2752, name="On Iron Pauldrons", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Shoulders
S(9813, {{k="q", item=7979, quest=2751, name="Barbaric Battlements", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Breastplate
S(3501, {{k="t", cost=1000}}) -- Green Iron Bracers
S(7222, {{k="w", item=6045}}) -- Iron Counterweight
S(3495, {{k="w", item=3867}}) -- Golden Iron Destroyer
S(3502, {{k="t", cost=1250}}) -- Green Iron Helm
S(3507, {{k="w", item=3872}}) -- Golden Scale Leggings
S(3493, {{k="w", item=3866}}) -- Jade Serpentblade
S(3505, {{k="d", item=3871, npc=2376, name="Torn Fin Oracle", zone="Hillsbrad Foothills"}}) -- Golden Scale Shoulders
S(9814, {{k="q", item=7980, quest=2754, name="Horns of Frenzy", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Helm
S(3496, {{k="v", item=12163, cost=4400, npc=2482, name="Zarena Cromwind", limited=true, zone="Stranglethorn Vale"}}) -- Moonsteel Broadsword
S(3508, {{k="t", cost=7500}}) -- Green Iron Hauberk
S(9818, {{k="q", item=7981, quest=2753, name="Trampled Under Foot", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Boots
S(15972, {{k="t", cost=7500}}) -- Glinting Steel Dagger
S(3498, {{k="v", item=12164, cost=4400, npc=2483, name="Jaquilina Dramet", limited=true, zone="Stranglethorn Vale"},
         {k="v", item=12164, cost=4400, npc=1146, name="Vharr", limited=true, zone="Stranglethorn Vale"}}) -- Massive Iron Axe
S(3513, {{k="w", item=3874}}) -- Polished Steel Boots
S(7223, {{k="t", cost=1000}}) -- Golden Scale Bracers
S(9820, {{k="q", item=7982, quest=2755, name="Joys of Omosh", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Gloves
S(3503, {{k="v", item=6047, cost=4400, npc=5411, name="Krinkle Goodsteel", limited=true, zone="Tanaris"}}) -- Golden Scale Coif
S(7224, {{k="w", item=6046}}) -- Steel Weapon Chain
S(15973, {{k="d", item=12261, npc=2377, name="Torn Fin Tidehunter", zone="Hillsbrad Foothills"}}) -- Searing Golden Blade
S(21913, {{k="d", item=17706}}) -- Edge of Winter
S(3511, {{k="w", item=3873}}) -- Golden Scale Cuirass
S(9918, {{k="t", cost=2500}}) -- Solid Sharpening Stone
S(9920, {{k="t", cost=2500}}) -- Solid Grinding Stone
S(9921, {{k="t", cost=2500}}) -- Solid Weightstone
S(19668, {{k="t", cost=2500}}) -- Truesilver Skeleton Key
S(14380, {{k="t", cost=2500}}) -- Truesilver Rod
S(34981, {{k="t", cost=7500}}) -- Whirling Steel Axes
S(3497, {{k="w", item=3868}}) -- Frost Tiger Blade
S(3500, {{k="w", item=3869}}) -- Shadow Crescent Axe
S(3515, {{k="w", item=3875}}) -- Golden Scale Boots
S(9916, {{k="t", cost=2500}}) -- Steel Breastplate
S(11454, {{k="u"}}) -- Inlaid Mithril Cylinder
S(9926, {{k="t", cost=5000}}) -- Heavy Mithril Shoulder
S(9928, {{k="t", cost=5000}}) -- Heavy Mithril Gauntlet
S(11643, {{k="q", item=9367, quest=2758, name="The Origins of Smithing", zone="Stormwind City", faction="Alliance"}}) -- Golden Scale Gauntlets
S(9931, {{k="t", cost=5000}}) -- Mithril Scale Pants
S(9933, {{k="w", item=7975}}) -- Heavy Mithril Pants
S(9993, {{k="t", cost=10000}}) -- Heavy Mithril Axe
S(9935, {{k="t", cost=5000}}) -- Steel Plate Helm
S(9937, {{k="v", item=7995, cost=6000, npc=8176, name="Gharash", zone="Swamp of Sorrows"},
         {k="v", item=7995, cost=6000, npc=8161, name="Harggan", zone="The Hinterlands"}}) -- Mithril Scale Bracers
S(9939, {{k="w", item=7976}}) -- Mithril Shield Spike
S(9945, {{k="q", item=7983, quest=2761, name="Smelt On, Smelt Off", zone="Stranglethorn Vale"}}) -- Ornate Mithril Pants
S(9950, {{k="q", item=7984, quest=2762, name="The Great Silver Deceiver", zone="Stranglethorn Vale"}}) -- Ornate Mithril Gloves
S(9995, {{k="w", item=7992}}) -- Blue Glittering Axe
S(9952, {{k="q", item=7985, quest=2763, name="The Art of the Imbue", zone="Stranglethorn Vale"}}) -- Ornate Mithril Shoulder
S(9954, {{k="t", cost=10000}}) -- Truesilver Gauntlets
S(9997, {{k="w", item=8029}}) -- Wicked Mithril Blade
S(9957, {{k="u"}}) -- Orcish War Leggings
S(9959, {{k="t", cost=15000}}) -- Heavy Mithril Breastplate
S(9961, {{k="t", cost=15000}}) -- Mithril Coif
S(10001, {{k="t", cost=15000}}) -- Big Black Mace
S(9964, {{k="w", item=7989}}) -- Mithril Spurs
S(9966, {{k="w", item=7991}}) -- Mithril Scale Shoulders
S(9968, {{k="t", cost=20000}}) -- Heavy Mithril Boots
S(10003, {{k="t", cost=15000}}) -- The Shatterer
S(9972, {{k="u"}}) -- Ornate Mithril Breastplate
S(10005, {{k="w", item=7993}}) -- Dazzling Mithril Rapier
S(9970, {{k="w", item=7990}}) -- Heavy Mithril Helm
S(9974, {{k="t", cost=10000}}) -- Truesilver Breastplate
S(9979, {{k="u"}}) -- Ornate Mithril Boots
S(9980, {{k="u"}}) -- Ornate Mithril Helm
S(10007, {{k="t", cost=15000}}) -- Phantom Blade
S(10009, {{k="w", item=8028}}) -- Runed Mithril Hammer
S(16639, {{k="t", cost=10000}}) -- Dense Grinding Stone
S(16640, {{k="t", cost=10000}}) -- Dense Weightstone
S(16641, {{k="t", cost=10000}}) -- Dense Sharpening Stone
S(16642, {{k="w", item=12682}}) -- Thorium Armor
S(16643, {{k="w", item=12683}}) -- Thorium Belt
S(10011, {{k="t", cost=15000}}) -- Blight
S(16644, {{k="w", item=12684}}) -- Thorium Bracers
S(10013, {{k="v", item=8030, cost=10000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"}}) -- Ebon Shiv
S(16645, {{k="w", item=12685}}) -- Radiant Belt
S(36122, {{k="t", cost=10000}}) -- Earthforged Leggings
S(36124, {{k="t", cost=10000}}) -- Windforged Leggings
S(36125, {{k="t", cost=10000}}) -- Light Earthforged Blade
S(36126, {{k="t", cost=10000}}) -- Light Skyforged Axe
S(36128, {{k="t", cost=10000}}) -- Light Emberforged Hammer
S(10015, {{k="t", cost=15000}}) -- Truesilver Champion
S(15292, {{k="d", item=11610, npc=9028, name="Grizzle", zone="Blackrock Depths"}}) -- Dark Iron Pulverizer
S(16646, {{k="q", item=12687, quest=7659, name="Imperial Plate Shoulders", zone="Tanaris"}}) -- Imperial Plate Shoulders
S(16647, {{k="q", item=12688, quest=7653, name="Imperial Plate Belt", zone="Tanaris"}}) -- Imperial Plate Belt
S(15293, {{k="d", item=11614, zone="Blackrock Depths"}}) -- Dark Iron Mail
S(16648, {{k="w", item=12689}}) -- Radiant Breastplate
S(16649, {{k="q", item=12690, quest=7655, name="Imperial Plate Bracer", zone="Tanaris"}}) -- Imperial Plate Bracers
S(16650, {{k="w", item=12691}}) -- Wildthorn Mail
S(19669, {{k="t", cost=10000}}) -- Arcanite Skeleton Key
S(20201, {{k="t", cost=10000}}) -- Arcanite Rod
S(15294, {{k="d", item=11611, npc=10043, name="Ribbly's Crony", zone="Blackrock Depths"},
          {k="d", item=11611, npc=9554, name="Hammered Patron", zone="Blackrock Depths"}}) -- Dark Iron Sunderer
S(16651, {{k="w", item=12692}}) -- Thorium Shield Spike
S(16969, {{k="v", item=12819, cost=16000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"}}) -- Ornate Thorium Handaxe
S(16970, {{k="q", item=12821, quest=5306, name="Snakestone of the Shadow Huntress", zone="Winterspring"}}) -- Dawn's Edge
S(15295, {{k="d", item=11615, zone="Blackrock Depths"}}) -- Dark Iron Shoulders
S(16652, {{k="w", item=12693}}) -- Thorium Boots
S(16653, {{k="w", item=12694}}) -- Thorium Helm
S(16971, {{k="v", item=12823, cost=20000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"}}) -- Huge Thorium Battleaxe
S(16973, {{k="q", item=12824, quest=5305, name="Sweet Serenity", zone="Winterspring"}}) -- Enchanted Battlehammer
S(16978, {{k="q", item=12825, quest=5307, name="Corruption", zone="Winterspring"}}) -- Blazing Rapier
S(15296, {{k="d", item=11612, npc=9543, name="Ribbly Screwspigot", zone="Blackrock Depths"}}) -- Dark Iron Plate
S(16654, {{k="w", item=12695}}) -- Radiant Gloves
S(16667, {{k="q", item=12696, quest=5127, name="The Demon Forge", zone="Winterspring"}}) -- Demon Forged Breastplate
S(16983, {{k="d", item=12827, zone="Stratholme"}}) -- Serenity
S(16655, {{k="q", item=12699, quest=5124, name="Fiery Plate Gauntlets", zone="Winterspring"}}) -- Fiery Plate Gauntlets
S(16656, {{k="w", item=12697}}) -- Radiant Boots
S(16660, {{k="d", item=12698, npc=11502, name="Ragnaros", zone="Molten Core"},
          {k="d", item=12698, npc=6109, name="Azuregos", zone="Azshara"},
          {k="d", item=12698, npc=14887, name="Ysondre"}}) -- Dawnbringer Shoulders
S(23628, {{k="v", item=19202, cost=22000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Heavy Timbermaw Belt
S(23632, {{k="v", item=19203, cost=22000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades", faction="Horde"},
          {k="v", item=19203, cost=22000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
          {k="v", item=19203, cost=22000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"}}) -- Girdle of the Dawn
S(16984, {{k="d", item=12828, npc=10119, name="Volchan", zone="Burning Steppes"}}) -- Volcanic Hammer
S(16985, {{k="d", item=12830, zone="Stratholme"}}) -- Corruption
S(16657, {{k="q", item=12700, quest=7654, name="Imperial Plate Boots", zone="Tanaris"}}) -- Imperial Plate Boots
S(16658, {{k="q", item=12701, quest=7657, name="Imperial Plate Helm", zone="Tanaris"}}) -- Imperial Plate Helm
S(16659, {{k="w", item=12702}}) -- Radiant Circlet
S(16661, {{k="v", item=12703, cost=40000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"},
          {k="w", item=12703}}) -- Storm Gauntlets
S(20872, {{k="v", item=17049, cost=90000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Fiery Chain Girdle
S(20874, {{k="v", item=17051, cost=70000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Bracers
S(22757, {{k="w", item=18264}}) -- Elemental Sharpening Stone
S(29654, {{k="t", cost=15000}}) -- Fel Sharpening Stone
S(32655, {{k="t", cost=10000}}) -- Fel Iron Rod
S(34607, {{k="t", cost=15000}}) -- Fel Weightstone
S(29545, {{k="t", cost=15000}}) -- Fel Iron Plate Gloves
S(29551, {{k="t", cost=15000}}) -- Fel Iron Chain Coif
S(16662, {{k="w", item=12704}}) -- Thorium Leggings
S(16663, {{k="q", item=12705, quest=7656, name="Imperial Plate Chest", zone="Tanaris"}}) -- Imperial Plate Chest
S(16664, {{k="d", item=12706, npc=4366, name="Strashaz Serpent Guard", zone="Dustwallow Marsh"}}) -- Runic Plate Shoulders
S(16665, {{k="d", item=12707, npc=1836, name="Scarlet Cavalier", zone="Western Plaguelands"}}) -- Runic Plate Boots
S(16724, {{k="w", item=12711}}) -- Whitesoul Helm
S(16725, {{k="w", item=12713}}) -- Radiant Leggings
S(16726, {{k="d", item=12714, npc=4364, name="Strashaz Warrior", zone="Dustwallow Marsh"}}) -- Runic Plate Helm
S(16728, {{k="w", item=12716}}) -- Helm of the Great Chief
S(16729, {{k="w", item=12717}}) -- Lionheart Helm
S(16730, {{k="q", item=12715, quest=7658, name="Imperial Plate Leggings", zone="Tanaris"}}) -- Imperial Plate Leggings
S(16731, {{k="d", item=12718, npc=4368, name="Strashaz Myrmidon", zone="Dustwallow Marsh"},
          {k="d", item=12718, npc=16072, name="Tidelord Rrurgaz", zone="Dustwallow Marsh"}}) -- Runic Breastplate
S(16732, {{k="d", item=12719, npc=1885, name="Scarlet Smith", zone="Western Plaguelands"}}) -- Runic Plate Leggings
S(16741, {{k="w", item=12720}}) -- Stronghold Gauntlets
S(16742, {{k="q", item=12725, quest=7651, name="Enchanted Thorium Platemail: Volume III", zone="Dire Maul"}}) -- Enchanted Thorium Helm
S(16744, {{k="q", item=12726, quest=7650, name="Enchanted Thorium Platemail: Volume II", zone="Dire Maul"}}) -- Enchanted Thorium Leggings
S(16745, {{k="q", item=12727, quest=7649, name="Enchanted Thorium Platemail: Volume I", zone="Dire Maul"}}) -- Enchanted Thorium Breastplate
S(16746, {{k="w", item=12728}}) -- Invulnerable Mail
S(16988, {{k="d", item=12833, npc=10438, name="Maleki the Pallid", zone="Stratholme"}}) -- Hammer of the Titans
S(16990, {{k="d", item=12834, npc=10899, name="Goraluk Anvilcrack", zone="Blackrock Spire"}}) -- Arcanite Champion
S(16991, {{k="d", item=12835, npc=9736, name="Quartermaster Zigris", zone="Blackrock Spire"}}) -- Annihilator
S(16992, {{k="d", item=12836, npc=1844, name="Foreman Marcrid", zone="Western Plaguelands"}}) -- Frostguard
S(16993, {{k="d", item=12837, npc=10899, name="Goraluk Anvilcrack", zone="Blackrock Spire"}}) -- Masterwork Stormhammer
S(16994, {{k="d", item=12838, npc=9596, name="Bannok Grimaxe", zone="Blackrock Spire"}}) -- Arcanite Reaper
S(16995, {{k="d", item=12839, npc=10997, name="Cannon Master Willey", zone="Stratholme"}}) -- Heartseeker
S(20873, {{k="v", item=17053, cost=200000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Fiery Chain Shoulders
S(20876, {{k="v", item=17052, cost=180000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Leggings
S(20890, {{k="v", item=17059, cost=220000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Reaver
S(20897, {{k="v", item=17060, cost=220000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Destroyer
S(23629, {{k="v", item=19204, cost=40000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Heavy Timbermaw Boots
S(23633, {{k="v", item=19205, cost=40000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades", faction="Horde"},
          {k="v", item=19205, cost=40000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
          {k="v", item=19205, cost=40000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"}}) -- Gloves of the Dawn
S(23636, {{k="v", item=19206, cost=60000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Helm
S(23637, {{k="v", item=19207, cost=80000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Gauntlets
S(23638, {{k="v", item=19208, cost=70000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Black Amnesty
S(23639, {{k="v", item=19209, cost=70000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Blackfury
S(23650, {{k="v", item=19210, cost=120000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Ebon Hand
S(23652, {{k="v", item=19211, cost=120000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Blackguard
S(23653, {{k="v", item=19212, cost=120000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Nightfall
S(24136, {{k="v", item=19776, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodsoul Breastplate
S(24137, {{k="v", item=19777, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodsoul Shoulders
S(24138, {{k="v", item=19778, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodsoul Gauntlets
S(24139, {{k="v", item=19779, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Darksoul Breastplate
S(24140, {{k="v", item=19780, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Darksoul Leggings
S(24141, {{k="v", item=19781, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Darksoul Shoulders
S(24399, {{k="v", item=20040, cost=80000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Dark Iron Boots
S(24912, {{k="d", item=20553, zone="Silithus"}}) -- Darkrune Gauntlets
S(24913, {{k="d", item=20555, zone="Silithus"}}) -- Darkrune Helm
S(24914, {{k="d", item=20554, zone="Silithus"}}) -- Darkrune Breastplate
S(27585, {{k="v", item=22209, cost=50000, npc=15176, name="Vargus", zone="Silithus"}}) -- Heavy Obsidian Belt
S(27586, {{k="v", item=22219, cost=50000, npc=15471, name="Lieutenant General Andorov", limited=true, zone="Ruins of Ahn'Qiraj"}}) -- Jagged Obsidian Shield
S(27587, {{k="d", item=22222, npc=15263, name="The Prophet Skeram", zone="Ahn'Qiraj"}}) -- Thick Obsidian Breastplate
S(27588, {{k="v", item=22214, cost=50000, npc=15176, name="Vargus", zone="Silithus"}}) -- Light Obsidian Belt
S(27589, {{k="d", item=22220, npc=15340, name="Moam", zone="Ruins of Ahn'Qiraj"}}) -- Black Grasp of the Destroyer
S(27590, {{k="v", item=22221, cost=80000, npc=15471, name="Lieutenant General Andorov", limited=true, zone="Ruins of Ahn'Qiraj"}}) -- Obsidian Mail Tunic
S(27829, {{k="w", item=22388}}) -- Titanic Leggings
S(27830, {{k="w", item=22390}}) -- Persuader
S(27832, {{k="w", item=22389}}) -- Sageblade
S(28242, {{k="u"}}) -- Icebane Breastplate
S(28243, {{k="u"}}) -- Icebane Gauntlets
S(28244, {{k="u"}}) -- Icebane Bracers
S(28461, {{k="v", item=22766, cost=50000, npc=15176, name="Vargus", zone="Silithus"}}) -- Ironvine Breastplate
S(28462, {{k="v", item=22767, cost=50000, npc=15176, name="Vargus", zone="Silithus"}}) -- Ironvine Gloves
S(28463, {{k="v", item=22768, cost=50000, npc=15176, name="Vargus", zone="Silithus"}}) -- Ironvine Belt
S(34982, {{k="t", cost=10000}}) -- Enchanted Thorium Blades
S(21161, {{k="q", item=18592, quest=7604, name="A Binding Contract", zone="Blackrock Depths"}}) -- Sulfuron Hammer
S(29547, {{k="t", cost=15000}}) -- Fel Iron Plate Belt
S(29552, {{k="t", cost=18000}}) -- Fel Iron Chain Gloves
S(29557, {{k="t", cost=18000}}) -- Fel Iron Hatchet
S(29548, {{k="t", cost=20000}}) -- Fel Iron Plate Boots
S(29549, {{k="t", cost=20000}}) -- Fel Iron Plate Pants
S(29553, {{k="t", cost=20000}}) -- Fel Iron Chain Bracers
S(29558, {{k="t", cost=20000}}) -- Fel Iron Hammer
S(29556, {{k="t", cost=22000}}) -- Fel Iron Chain Tunic
S(29565, {{k="t", cost=22000}}) -- Fel Iron Greatsword
S(32284, {{k="t", cost=25000}}) -- Lesser Rune of Warding
S(29550, {{k="t", cost=25000}}) -- Fel Iron Breastplate
S(29566, {{k="v", item=23590, cost=40000, npc=19662, name="Aaron Hollman", limited=true, zone="Shattrath City"},
          {k="v", item=23590, cost=40000, npc=16713, name="Arras", limited=true, zone="The Exodar"},
          {k="v", item=23590, cost=40000, npc=16670, name="Eriden", limited=true, zone="Silvermoon City"}}) -- Adamantite Maul
S(29568, {{k="v", item=23591, cost=40000, npc=19662, name="Aaron Hollman", limited=true, zone="Shattrath City"},
          {k="v", item=23591, cost=40000, npc=16713, name="Arras", limited=true, zone="The Exodar"},
          {k="v", item=23591, cost=40000, npc=16670, name="Eriden", limited=true, zone="Silvermoon City"}}) -- Adamantite Cleaver
S(29569, {{k="v", item=23592, cost=40000, npc=19662, name="Aaron Hollman", limited=true, zone="Shattrath City"},
          {k="v", item=23592, cost=40000, npc=16713, name="Arras", limited=true, zone="The Exodar"},
          {k="v", item=23592, cost=40000, npc=16670, name="Eriden", limited=true, zone="Silvermoon City"}}) -- Adamantite Dagger
S(36129, {{k="t", cost=40000}}) -- Heavy Earthforged Breastplate
S(36130, {{k="t", cost=40000}}) -- Stormforged Hauberk
S(36131, {{k="t", cost=40000}}) -- Windforged Rapier
S(36133, {{k="t", cost=40000}}) -- Stoneforged Claymore
S(36134, {{k="t", cost=40000}}) -- Stormforged Axe
S(36135, {{k="t", cost=40000}}) -- Skyforged Great Axe
S(36136, {{k="t", cost=40000}}) -- Lavaforged Warhammer
S(36137, {{k="t", cost=40000}}) -- Great Earthforged Hammer
S(29571, {{k="v", item=23593, cost=40000, npc=19662, name="Aaron Hollman", limited=true, zone="Shattrath City"},
          {k="v", item=23593, cost=40000, npc=16713, name="Arras", limited=true, zone="The Exodar"},
          {k="v", item=23593, cost=40000, npc=16670, name="Eriden", limited=true, zone="Silvermoon City"}}) -- Adamantite Rapier
S(29603, {{k="v", item=23594, cost=60000, npc=19342, name="Krek Cragcrush", limited=true, zone="Shadowmoon Valley"},
          {k="v", item=23594, cost=60000, npc=19694, name="Loolruna", limited=true, zone="Zangarmarsh"}}) -- Adamantite Plate Bracers
S(29605, {{k="v", item=23595, cost=60000, npc=19342, name="Krek Cragcrush", limited=true, zone="Shadowmoon Valley"},
          {k="v", item=23595, cost=60000, npc=19694, name="Loolruna", limited=true, zone="Zangarmarsh"}}) -- Adamantite Plate Gloves
S(42688, {{k="d", item=35296, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Adamantite Weapon Chain
S(29728, {{k="v", item=23638, cost=60000, npc=19373, name="Mari Stonehand", zone="Shadowmoon Valley"},
          {k="v", item=23638, cost=60000, npc=16583, name="Rohok", zone="Hellfire Peninsula"}}) -- Lesser Ward of Shielding
S(29606, {{k="v", item=23596, cost=60000, npc=19342, name="Krek Cragcrush", limited=true, zone="Shadowmoon Valley"},
          {k="v", item=23596, cost=60000, npc=19694, name="Loolruna", limited=true, zone="Zangarmarsh"}}) -- Adamantite Breastplate
S(29656, {{k="v", item=23618, cost=60000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Adamantite Sharpening Stone
S(32285, {{k="v", item=25526, cost=60000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Greater Rune of Warding
S(32656, {{k="v", item=25846, cost=40000, npc=19662, name="Aaron Hollman", limited=true, zone="Shattrath City"}}) -- Adamantite Rod
S(34608, {{k="v", item=28632, cost=60000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Adamantite Weightstone
S(29614, {{k="v", item=23601, cost=60000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamebane Bracers
S(34529, {{k="t", cost=100000}}) -- Nether Chain Shirt
S(34533, {{k="t", cost=100000}}) -- Breastplate of Kings
S(34535, {{k="t", cost=100000}}) -- Fireguard
S(34538, {{k="t", cost=100000}}) -- Lionheart Blade
S(34541, {{k="t", cost=100000}}) -- The Planar Edge
S(34543, {{k="t", cost=100000}}) -- Lunar Crescent
S(34545, {{k="t", cost=100000}}) -- Drakefist Hammer
S(34547, {{k="t"}}) -- Thunder
S(34983, {{k="t", cost=50000}}) -- Felsteel Whisper Knives
S(29608, {{k="v", item=23597, cost=60000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Adamantite Belt
S(29611, {{k="v", item=23598, cost=60000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Adamantite Boots
S(29615, {{k="v", item=23602, cost=60000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamebane Helm
S(29610, {{k="v", item=23599, cost=60000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Adamantite Breastplate
S(29616, {{k="v", item=23603, cost=60000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamebane Gloves
S(29619, {{k="d", item=23605, npc=18497, name="Auchenai Monk", zone="Auchenai Crypts"}}) -- Felsteel Gloves
S(29620, {{k="d", item=23606, npc=20900, name="Unchained Doombringer", zone="The Arcatraz"}}) -- Felsteel Leggings
S(29628, {{k="d", item=23608, npc=18203, name="Murkblood Raider", zone="Nagrand"}}) -- Khorium Belt
S(29629, {{k="d", item=23609, npc=20878, name="Deathforge Guardian", zone="Shadowmoon Valley"}}) -- Khorium Pants
S(29657, {{k="v", item=24002, cost=60000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula"}}) -- Felsteel Shield Spike
S(29613, {{k="v", item=23600, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Adamantite Leggings
S(29617, {{k="v", item=23604, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamebane Breastplate
S(29621, {{k="d", item=23607, npc=18830, name="Cabal Fanatic", zone="Shadow Labyrinth"}}) -- Felsteel Helm
S(29622, {{k="w", item=23621}}) -- Gauntlets of the Iron Tower
S(29630, {{k="d", item=23610, npc=18873, name="Disembodied Protector", zone="Netherstorm"}}) -- Khorium Boots
S(29642, {{k="d", item=23611, npc=17136, name="Boulderfist Warrior", zone="Nagrand"}}) -- Ragesteel Gloves
S(29643, {{k="d", item=23612, npc=16952, name="Anger Guard", zone="Blade's Edge Mountains"}}) -- Ragesteel Helm
S(29658, {{k="w", item=23620}}) -- Felfury Gauntlets
S(29662, {{k="w", item=23622}}) -- Steelgrip Gauntlets
S(29663, {{k="w", item=23623}}) -- Storm Helm
S(29664, {{k="w", item=23624}}) -- Helm of the Stalwart Defender
S(29668, {{k="w", item=23625}}) -- Oathkeeper's Helm
S(29669, {{k="w", item=23626}}) -- Black Felsteel Bracers
S(29671, {{k="w", item=23627}}) -- Bracers of the Green Fortress
S(29672, {{k="w", item=23628}}) -- Blessed Bracers
S(29692, {{k="w", item=23629}}) -- Felsteel Longblade
S(29693, {{k="w", item=23630}}) -- Khorium Champion
S(29694, {{k="w", item=23631}}) -- Fel Edged Battleaxe
S(29695, {{k="w", item=23632}}) -- Felsteel Reaper
S(29696, {{k="w", item=23633}}) -- Runic Hammer
S(29697, {{k="w", item=23634}}) -- Fel Hardened Maul
S(29698, {{k="w", item=23635}}) -- Eternium Runed Blade
S(29699, {{k="w", item=23636}}) -- Dirge
S(29700, {{k="w", item=23637}}) -- Hand of Eternity
S(42662, {{k="d", item=33174, npc=21061, name="Enraged Fire Spirit", zone="Shadowmoon Valley"},
          {k="d", item=33174, npc=21050, name="Enraged Earth Spirit", zone="Shadowmoon Valley"},
          {k="d", item=33174, npc=21060, name="Enraged Air Spirit", zone="Shadowmoon Valley"}}) -- Ragesteel Shoulders
S(43846, {{k="w", item=33954}}) -- Hammer of Righteous Might
S(46140, {{k="u"}}) -- Sunblessed Gauntlets
S(46141, {{k="u"}}) -- Hard Khorium Battlefists
S(46142, {{k="u"}}) -- Sunblessed Breastplate
S(46144, {{k="u"}}) -- Hard Khorium Battleplate
S(29645, {{k="d", item=23613, npc=21454, name="Ashtongue Warrior", zone="Shadowmoon Valley"}}) -- Ragesteel Breastplate
S(29648, {{k="d", item=23615, npc=18314, name="Nexus Stalker", zone="Mana-Tombs"}}) -- Swiftsteel Gloves
S(29649, {{k="d", item=23617, npc=17975, name="High Botanist Freywinn", zone="The Botanica"}}) -- Earthpeace Breastplate
S(29729, {{k="d", item=23639, npc=18853, name="Sunfury Bloodwarder", zone="Netherstorm"}}) -- Greater Ward of Shielding
S(32657, {{k="v", item=25847, cost=120000, npc=16583, name="Rohok", zone="Hellfire Peninsula"},
          {k="v", item=25847, cost=120000, npc=19373, name="Mari Stonehand", limited=true, zone="Shadowmoon Valley"}}) -- Eternium Rod
S(34530, {{k="t", cost=250000}}) -- Twisting Nether Chain Shirt
S(34534, {{k="t", cost=250000}}) -- Bulwark of Kings
S(34537, {{k="t", cost=250000}}) -- Blazeguard
S(34540, {{k="t", cost=250000}}) -- Lionheart Champion
S(34542, {{k="t", cost=250000}}) -- Black Planar Edge
S(34544, {{k="t", cost=250000}}) -- Mooncleaver
S(34546, {{k="t", cost=250000}}) -- Dragonmaw
S(34548, {{k="t", cost=250000}}) -- Deep Thunder
S(36256, {{k="t", cost=500000}}) -- Embrace of the Twisting Nether
S(36257, {{k="t", cost=500000}}) -- Bulwark of the Ancient Kings
S(36258, {{k="t", cost=500000}}) -- Blazefury
S(36259, {{k="t", cost=500000}}) -- Lionheart Executioner
S(36260, {{k="t", cost=500000}}) -- Wicked Edge of the Planes
S(36261, {{k="t", cost=500000}}) -- Bloodmoon
S(36262, {{k="t", cost=500000}}) -- Dragonstrike
S(36263, {{k="t", cost=500000}}) -- Stormherald
S(36389, {{k="w", item=30321}}) -- Belt of the Guardian
S(36390, {{k="w", item=30322}}) -- Red Belt of Battle
S(36391, {{k="w", item=30323}}) -- Boots of the Protector
S(36392, {{k="w", item=30324}}) -- Red Havoc Boots
S(38473, {{k="v", item=31390, cost=240000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Wildguard Breastplate
S(38475, {{k="v", item=31391, cost=240000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Wildguard Leggings
S(38476, {{k="v", item=31392, cost=240000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Wildguard Helm
S(38477, {{k="v", item=31393, cost=240000, npc=16388, name="Koren", zone="Karazhan"}}) -- Iceguard Breastplate
S(38478, {{k="v", item=31394, cost=240000, npc=16388, name="Koren", zone="Karazhan"}}) -- Iceguard Leggings
S(38479, {{k="v", item=31395, cost=240000, npc=16388, name="Koren", zone="Karazhan"}}) -- Iceguard Helm
S(40033, {{k="v", item=32441, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Shadesteel Sabots
S(40034, {{k="v", item=32442, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Shadesteel Bracers
S(40035, {{k="v", item=32443, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Shadesteel Greaves
S(40036, {{k="v", item=32444, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Shadesteel Girdle
S(41132, {{k="u"}}) -- Swiftsteel Bracers
S(41133, {{k="u"}}) -- Swiftsteel Shoulders
S(41134, {{k="u"}}) -- Dawnsteel Bracers
S(41135, {{k="u"}}) -- Dawnsteel Shoulders
-- DATA_END
