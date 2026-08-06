local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla Blacksmithing recipes: where each recipe
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
S(3321, {{k="w", item=3609},
         {k="q", item=3609, quest=1578, name="Supplying the Front", zone="Ironforge", faction="Alliance"}}) -- Copper Chain Vest
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
S(3494, {{k="v", item=10858, cost=3000, npc=9179, name="Jazzrik", zone="Badlands", limited=true},
         {k="v", item=10858, cost=3000, npc=8878, name="Muuran", zone="Desolace", limited=true, faction="Horde"},
         {k="v", item=10858, cost=3000, npc=1471, name="Jannos Ironwill", zone="Arathi Highlands", limited=true, faction="Alliance"}}) -- Solid Iron Maul
S(3506, {{k="t", cost=5000}}) -- Green Iron Leggings
S(12259, {{k="w", item=10424}}) -- Silvered Bronze Leggings
S(3492, {{k="v", item=12162, cost=3000, npc=2843, name="Jutak", zone="Stranglethorn Vale", limited=true},
         {k="v", item=12162, cost=3000, npc=5512, name="Kaita Deepforge", zone="Stormwind City", limited=true, faction="Alliance"},
         {k="v", item=12162, cost=3000, npc=3356, name="Sumi", zone="Orgrimmar", limited=true, faction="Horde"}}) -- Hardened Iron Shortsword
S(3504, {{k="w", item=3870}}) -- Green Iron Shoulders
S(9811, {{k="q", item=7978, quest=2752, name="On Iron Pauldrons", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Shoulders
S(9813, {{k="q", item=7979, quest=2751, name="Barbaric Battlements", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Breastplate
S(3501, {{k="t", cost=1000}}) -- Green Iron Bracers
S(7222, {{k="w", item=6045}}) -- Iron Counterweight
S(3495, {{k="w", item=3867}}) -- Golden Iron Destroyer
S(3502, {{k="t", cost=1250}}) -- Green Iron Helm
S(3507, {{k="w", item=3872}}) -- Golden Scale Leggings
S(3493, {{k="w", item=3866}}) -- Jade Serpentblade
S(3505, {{k="w", item=3871}}) -- Golden Scale Shoulders
S(9814, {{k="q", item=7980, quest=2754, name="Horns of Frenzy", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Helm
S(3496, {{k="v", item=12163, cost=4400, npc=2482, name="Zarena Cromwind", zone="Stranglethorn Vale", limited=true}}) -- Moonsteel Broadsword
S(3508, {{k="t", cost=7500}}) -- Green Iron Hauberk
S(9818, {{k="q", item=7981, quest=2753, name="Trampled Under Foot", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Boots
S(15972, {{k="t", cost=7500}}) -- Glinting Steel Dagger
S(3498, {{k="v", item=12164, cost=4400, npc=2483, name="Jaquilina Dramet", zone="Stranglethorn Vale", limited=true},
         {k="v", item=12164, cost=4400, npc=1146, name="Vharr", zone="Stranglethorn Vale", limited=true}}) -- Massive Iron Axe
S(3513, {{k="w", item=3874}}) -- Polished Steel Boots
S(7223, {{k="t", cost=1000}}) -- Golden Scale Bracers
S(9820, {{k="q", item=7982, quest=2755, name="Joys of Omosh", zone="Orgrimmar", faction="Horde"}}) -- Barbaric Iron Gloves
S(3503, {{k="v", item=6047, cost=4400, npc=5411, name="Krinkle Goodsteel", zone="Tanaris", limited=true}}) -- Golden Scale Coif
S(7224, {{k="w", item=6046}}) -- Steel Weapon Chain
S(15973, {{k="w", item=12261}}) -- Searing Golden Blade
S(21913, {{k="d", item=17706}}) -- Edge of Winter
S(3511, {{k="w", item=3873}}) -- Golden Scale Cuirass
S(9918, {{k="t", cost=2500}}) -- Solid Sharpening Stone
S(9920, {{k="t", cost=2500}}) -- Solid Grinding Stone
S(9921, {{k="t", cost=2500}}) -- Solid Weightstone
S(19668, {{k="t", cost=2500}}) -- Truesilver Skeleton Key
S(14380, {{k="t", cost=2500}}) -- Truesilver Rod
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
S(9937, {{k="v", item=7995, cost=6000, npc=8176, name="Gharash", zone="Swamp of Sorrows", limited=true},
         {k="v", item=7995, cost=6000, npc=8161, name="Harggan", zone="The Hinterlands", limited=true}}) -- Mithril Scale Bracers
S(9939, {{k="w", item=7976}}) -- Mithril Shield Spike
S(9945, {{k="q", item=7983, quest=2761, name="Smelt On, Smelt Off", zone="Stranglethorn Vale"}}) -- Ornate Mithril Pants
S(9950, {{k="q", item=7984, quest=2762, name="The Great Silver Deceiver", zone="Stranglethorn Vale"}}) -- Ornate Mithril Gloves
S(9995, {{k="w", item=7992}}) -- Blue Glittering Axe
S(9952, {{k="q", item=7985, quest=2763, name="The Art of the Imbue", zone="Stranglethorn Vale"}}) -- Ornate Mithril Shoulders
S(9954, {{k="t", cost=9000}}) -- Truesilver Gauntlets
S(9997, {{k="w", item=8029}}) -- Wicked Mithril Blade
S(9957, {{k="u"}}) -- Orcish War Leggings
S(9959, {{k="t", cost=15000}}) -- Heavy Mithril Breastplate
S(9961, {{k="t", cost=15000}}) -- Mithril Coif
S(10001, {{k="t", cost=15000}}) -- Big Black Mace
S(9964, {{k="w", item=7989}}) -- Mithril Spurs
S(9966, {{k="w", item=7991}}) -- Mithril Scale Shoulders
S(9968, {{k="t", cost=20000}}) -- Heavy Mithril Boots
S(10003, {{k="t", cost=13500}}) -- The Shatterer
S(9972, {{k="u"}}) -- Ornate Mithril Breastplate
S(10005, {{k="w", item=7993}}) -- Dazzling Mithril Rapier
S(9970, {{k="w", item=7990}}) -- Heavy Mithril Helm
S(9974, {{k="t", cost=9000}}) -- Truesilver Breastplate
S(9979, {{k="u"}}) -- Ornate Mithril Boots
S(9980, {{k="u"}}) -- Ornate Mithril Helm
S(10007, {{k="t", cost=13500}}) -- Phantom Blade
S(10009, {{k="w", item=8028}}) -- Runed Mithril Hammer
S(16639, {{k="t", cost=10000}}) -- Dense Grinding Stone
S(16640, {{k="t", cost=10000}}) -- Dense Weightstone
S(16641, {{k="t", cost=10000}}) -- Dense Sharpening Stone
S(16642, {{k="w", item=12682}}) -- Thorium Armor
S(16643, {{k="w", item=12683}}) -- Thorium Belt
S(10011, {{k="t", cost=13500}}) -- Blight
S(16644, {{k="w", item=12684}}) -- Thorium Bracers
S(10013, {{k="v", item=8030, cost=10000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"}}) -- Ebon Shiv
S(16645, {{k="w", item=12685}}) -- Radiant Belt
S(10015, {{k="t", cost=13500}}) -- Truesilver Champion
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
S(16660, {{k="d", item=12698, npc=12397, name="Lord Kazzak", zone="Blasted Lands"},
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
S(20872, {{k="v", item=17049, cost=90000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Fiery Chain Girdle
S(20874, {{k="v", item=17051, cost=70000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Dark Iron Bracers
S(22757, {{k="w", item=18264}}) -- Elemental Sharpening Stone
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
S(16732, {{k="d", item=12719, npc=1885, name="Scarlet Smith"}}) -- Runic Plate Leggings
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
S(20890, {{k="v", item=17059, cost=220000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Dark Iron Reaver
S(20897, {{k="v", item=17060, cost=220000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Dark Iron Destroyer
S(23629, {{k="v", item=19204, cost=40000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Heavy Timbermaw Boots
S(23633, {{k="v", item=19205, cost=40000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades", faction="Horde"},
          {k="v", item=19205, cost=40000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
          {k="v", item=19205, cost=40000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"}}) -- Gloves of the Dawn
S(23636, {{k="v", item=19206, cost=60000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Dark Iron Helm
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
S(21161, {{k="q", item=18592, quest=7604, name="A Binding Contract", zone="Blackrock Depths"}}) -- Sulfuron Hammer
-- DATA_END
