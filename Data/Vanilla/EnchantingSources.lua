local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla Enchanting recipes: where each recipe is
-- obtained. Keyed by crafting spell ID (same as EnchantingData.lua).
-- Generated from Wowhead classic data 2026-08-05.

local S = ns.NewSourceDB("ENCHANTING")

-- DATA_START (generated; do not hand-edit between markers)
S(7421, {{k="t"}}) -- Runed Copper Rod
S(7418, {{k="t"}}) -- Enchant Bracer - Minor Health
S(7428, {{k="t"}}) -- Enchant Bracer - Minor Deflect
S(14293, {{k="t", cost=50}}) -- Lesser Magic Wand
S(7420, {{k="t", cost=50}}) -- Enchant Chest - Minor Health
S(7443, {{k="v", item=6342, cost=300, npc=1318, name="Jessara Cordell", zone="Stormwind City", limited=true, faction="Alliance"},
         {k="v", item=6342, cost=300, npc=3346, name="Kithas", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=6342, cost=300, npc=5158, name="Tilli Thistlefuzz", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=6342, cost=300, npc=3012, name="Nata Dawnstrider", zone="Thunder Bluff", limited=true, faction="Horde"},
         {k="w", item=6342}}) -- Enchant Chest - Minor Mana
S(7426, {{k="t", cost=100}}) -- Enchant Chest - Minor Absorption
S(25124, {{k="v", item=20758, cost=500, npc=1318, name="Jessara Cordell", zone="Stormwind City", faction="Alliance"},
          {k="v", item=20758, cost=500, npc=3346, name="Kithas", zone="Orgrimmar", faction="Horde"},
          {k="v", item=20758, cost=500, npc=5158, name="Tilli Thistlefuzz", zone="Ironforge", faction="Alliance"},
          {k="v", item=20758, cost=500, npc=3012, name="Nata Dawnstrider", zone="Thunder Bluff", faction="Horde"}}) -- Minor Wizard Oil
S(7454, {{k="t", cost=100}}) -- Enchant Cloak - Minor Resistance
S(7457, {{k="t", cost=250}}) -- Enchant Bracer - Minor Stamina
S(7748, {{k="t", cost=250}}) -- Enchant Chest - Lesser Health
S(7766, {{k="w", item=6344}}) -- Enchant Bracer - Minor Spirit
S(7771, {{k="t", cost=200}}) -- Enchant Cloak - Minor Protection
S(14807, {{k="t", cost=200}}) -- Greater Magic Wand
S(7776, {{k="v", item=6346, cost=400, npc=3346, name="Kithas", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=6346, cost=400, npc=5757, name="Lilly", limited=true, faction="Horde"}}) -- Enchant Chest - Lesser Mana
S(7779, {{k="t", cost=400}}) -- Enchant Bracer - Minor Agility
S(7782, {{k="w", item=6347}}) -- Enchant Bracer - Minor Strength
S(7786, {{k="w", item=6348}}) -- Enchant Weapon - Minor Beastslayer
S(7788, {{k="t", cost=500}}) -- Enchant Weapon - Minor Striking
S(7745, {{k="t", cost=500}}) -- Enchant 2H Weapon - Minor Impact
S(7793, {{k="v", item=6349, cost=500, npc=3012, name="Nata Dawnstrider", zone="Thunder Bluff", limited=true, faction="Horde"},
         {k="v", item=6349, cost=500, npc=3346, name="Kithas", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=6349, cost=500, npc=5158, name="Tilli Thistlefuzz", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=6349, cost=500, npc=5758, name="Leo Sarn", limited=true, faction="Horde"}}) -- Enchant 2H Weapon - Lesser Intellect
S(7795, {{k="t", cost=1000}}) -- Runed Silver Rod
S(13378, {{k="t", cost=600}}) -- Enchant Shield - Minor Stamina
S(13380, {{k="w", item=11038}}) -- Enchant 2H Weapon - Lesser Spirit
S(13419, {{k="v", item=11039, cost=800, npc=3954, name="Dalria", zone="Ashenvale", limited=true, faction="Alliance"},
          {k="v", item=11039, cost=800, npc=12043, name="Kulwia", zone="Stonetalon Mountains", limited=true, faction="Horde"},
          {k="w", item=11039}}) -- Enchant Cloak - Minor Agility
S(13421, {{k="t", cost=800}}) -- Enchant Cloak - Lesser Protection
S(13464, {{k="w", item=11081}}) -- Enchant Shield - Lesser Protection
S(7857, {{k="t", cost=1000}}) -- Enchant Chest - Health
S(7859, {{k="w", item=6375}}) -- Enchant Bracer - Lesser Spirit
S(7861, {{k="t", cost=1250}}) -- Enchant Cloak - Lesser Fire Resistance
S(7863, {{k="t", cost=1400}}) -- Enchant Boots - Minor Stamina
S(7867, {{k="v", item=6377, cost=1000, npc=3012, name="Nata Dawnstrider", zone="Thunder Bluff", limited=true, faction="Horde"},
         {k="v", item=6377, cost=1000, npc=3537, name="Zixil", zone="Hillsbrad Foothills", limited=true}}) -- Enchant Boots - Minor Agility
S(13485, {{k="t", cost=1500}}) -- Enchant Shield - Lesser Spirit
S(13501, {{k="t", cost=1500}}) -- Enchant Bracer - Lesser Stamina
S(13522, {{k="w", item=11098}}) -- Enchant Cloak - Lesser Shadow Resistance
S(13503, {{k="t", cost=2000}}) -- Enchant Weapon - Lesser Striking
S(13536, {{k="v", item=11101, cost=2500, npc=3954, name="Dalria", zone="Ashenvale", limited=true, faction="Alliance"},
          {k="v", item=11101, cost=2500, npc=12043, name="Kulwia", zone="Stonetalon Mountains", limited=true, faction="Horde"}}) -- Enchant Bracer - Lesser Strength
S(13538, {{k="t", cost=2500}}) -- Enchant Chest - Lesser Absorption
S(13529, {{k="t", cost=2400}}) -- Enchant 2H Weapon - Lesser Impact
S(13607, {{k="t", cost=2400}}) -- Enchant Chest - Mana
S(13612, {{k="d", item=11150, npc=1052, name="Dark Iron Saboteur", zone="Wetlands"},
          {k="d", item=11150, npc=1053, name="Dark Iron Tunneler", zone="Wetlands"}}) -- Enchant Gloves - Mining
S(13617, {{k="d", item=11151, npc=4029, name="Blackened Ancient", zone="Ashenvale"},
          {k="d", item=11151, npc=3919, name="Withered Ancient", zone="Ashenvale"}}) -- Enchant Gloves - Herbalism
S(13620, {{k="d", item=11152, npc=2374, name="Torn Fin Muckdweller", zone="Hillsbrad Foothills"},
          {k="d", item=11152, npc=2376, name="Torn Fin Oracle", zone="Hillsbrad Foothills"}}) -- Enchant Gloves - Fishing
S(25125, {{k="v", item=20752, cost=3000, npc=1318, name="Jessara Cordell", zone="Stormwind City", faction="Alliance"},
          {k="v", item=20752, cost=3000, npc=3346, name="Kithas", zone="Orgrimmar", faction="Horde"},
          {k="v", item=20752, cost=3000, npc=5158, name="Tilli Thistlefuzz", zone="Ironforge", faction="Alliance"},
          {k="v", item=20752, cost=3000, npc=3012, name="Nata Dawnstrider", zone="Thunder Bluff", faction="Horde"}}) -- Minor Mana Oil
S(13622, {{k="t", cost=2500}}) -- Enchant Bracer - Lesser Intellect
S(13626, {{k="t", cost=2500}}) -- Enchant Chest - Minor Stats
S(13628, {{k="t", cost=2500}}) -- Runed Golden Rod
S(13631, {{k="t", cost=2600}}) -- Enchant Shield - Lesser Stamina
S(13635, {{k="t", cost=2600}}) -- Enchant Cloak - Defense
S(14809, {{k="t", cost=2600}}) -- Lesser Mystic Wand
S(13637, {{k="t", cost=2800}}) -- Enchant Boots - Lesser Agility
S(13640, {{k="t", cost=2700}}) -- Enchant Chest - Greater Health
S(13642, {{k="t", cost=2800}}) -- Enchant Bracer - Spirit
S(13644, {{k="t", cost=2800}}) -- Enchant Boots - Lesser Stamina
S(13646, {{k="v", item=11163, cost=3000, npc=2381, name="Micha Yance", zone="Hillsbrad Foothills", limited=true, faction="Alliance"},
          {k="v", item=11163, cost=3000, npc=2821, name="Keena", zone="Arathi Highlands", limited=true, faction="Horde"}}) -- Enchant Bracer - Lesser Deflection
S(13648, {{k="t", cost=2800}}) -- Enchant Bracer - Stamina
S(13653, {{k="w", item=11164}}) -- Enchant Weapon - Lesser Beastslayer
S(13655, {{k="w", item=11165}}) -- Enchant Weapon - Lesser Elemental Slayer
S(13657, {{k="t", cost=3000}}) -- Enchant Cloak - Fire Resistance
S(14810, {{k="t", cost=3000}}) -- Greater Mystic Wand
S(13659, {{k="t", cost=3200}}) -- Enchant Shield - Spirit
S(13661, {{k="t", cost=3600}}) -- Enchant Bracer - Strength
S(13663, {{k="t", cost=3800}}) -- Enchant Chest - Greater Mana
S(13687, {{k="w", item=11167}}) -- Enchant Boots - Lesser Spirit
S(21931, {{k="q", item=17725, quest=6984, name="A Smokywood Pastures Thank You!", zone="Ironforge", faction="Alliance"},
          {k="q", item=17725, quest=7045, name="A Smokywood Pastures Thank You!", zone="Orgrimmar", faction="Horde"}}) -- Enchant Weapon - Winter's Might
S(13689, {{k="w", item=11168}}) -- Enchant Shield - Lesser Block
S(13693, {{k="t", cost=4000}}) -- Enchant Weapon - Striking
S(25126, {{k="v", item=20753, cost=4000, npc=1318, name="Jessara Cordell", zone="Stormwind City", faction="Alliance"},
          {k="v", item=20753, cost=4000, npc=3346, name="Kithas", zone="Orgrimmar", faction="Horde"},
          {k="v", item=20753, cost=4000, npc=5158, name="Tilli Thistlefuzz", zone="Ironforge", faction="Alliance"},
          {k="v", item=20753, cost=4000, npc=3012, name="Nata Dawnstrider", zone="Thunder Bluff", faction="Horde"}}) -- Lesser Wizard Oil
S(13695, {{k="t", cost=4000}}) -- Enchant 2H Weapon - Impact
S(13698, {{k="d", item=11166, npc=2556, name="Witherbark Headhunter", zone="Arathi Highlands"},
          {k="d", item=11166, npc=2557, name="Witherbark Shadow Hunter", zone="Arathi Highlands"}}) -- Enchant Gloves - Skinning
S(13700, {{k="t", cost=4000}}) -- Enchant Chest - Lesser Stats
S(13702, {{k="t", cost=4000}}) -- Runed Truesilver Rod
S(13746, {{k="t", cost=4200}}) -- Enchant Cloak - Greater Defense
S(13794, {{k="t", cost=4200}}) -- Enchant Cloak - Resistance
S(13815, {{k="t", cost=4400}}) -- Enchant Gloves - Agility
S(13817, {{k="w", item=11202}}) -- Enchant Shield - Stamina
S(13822, {{k="t", cost=4400}}) -- Enchant Bracer - Intellect
S(13836, {{k="t", cost=4600}}) -- Enchant Boots - Stamina
S(13841, {{k="d", item=11203, npc=674, name="Venture Co. Strip Miner", zone="Stranglethorn Vale"}}) -- Enchant Gloves - Advanced Mining
S(13846, {{k="w", item=11204}}) -- Enchant Bracer - Greater Spirit
S(13858, {{k="t", cost=4800}}) -- Enchant Chest - Superior Health
S(13868, {{k="d", item=11205, npc=764, name="Swampwalker", zone="Swamp of Sorrows"},
          {k="d", item=11205, npc=765, name="Swampwalker Elder", zone="Swamp of Sorrows"}}) -- Enchant Gloves - Advanced Herbalism
S(13882, {{k="d", item=11206, npc=7805, name="Wastewander Scofflaw", zone="Tanaris"},
          {k="d", item=11206, npc=2246, name="Syndicate Assassin", zone="Alterac Mountains"}}) -- Enchant Cloak - Lesser Agility
S(13887, {{k="t", cost=5000}}) -- Enchant Gloves - Strength
S(13890, {{k="t", cost=5000}}) -- Enchant Boots - Minor Speed
S(13905, {{k="t", cost=5400}}) -- Enchant Shield - Greater Spirit
S(13915, {{k="w", item=11208}}) -- Enchant Weapon - Demonslaying
S(13917, {{k="t", cost=5400}}) -- Enchant Chest - Superior Mana
S(13931, {{k="v", item=11223, cost=5800, npc=989, name="Banalash", zone="Swamp of Sorrows", limited=true, faction="Horde"},
          {k="v", item=11223, cost=5800, npc=4229, name="Mythrin'dir", zone="Darnassus", limited=true, faction="Alliance"}}) -- Enchant Bracer - Deflection
S(13933, {{k="d", item=11224, npc=10184, name="Onyxia", zone="Onyxia's Lair"},
          {k="d", item=11224, npc=11583, name="Nefarian", zone="Blackwing Lair"},
          {k="w", item=11224}}) -- Enchant Shield - Frost Resistance
S(13935, {{k="t", cost=5800}}) -- Enchant Boots - Agility
S(13937, {{k="t", cost=6200}}) -- Enchant 2H Weapon - Greater Impact
S(13939, {{k="t", cost=6200}}) -- Enchant Bracer - Greater Strength
S(13941, {{k="t", cost=6200}}) -- Enchant Chest - Stats
S(13943, {{k="t", cost=6200}}) -- Enchant Weapon - Greater Striking
S(13945, {{k="w", item=11225}}) -- Enchant Bracer - Greater Stamina
S(17180, {{k="t", cost=10000}}) -- Enchanted Thorium
S(17181, {{k="t", cost=10000}}) -- Enchanted Leather
S(25127, {{k="v", item=20754, cost=10000, npc=15419, name="Kania", zone="Silithus"}}) -- Lesser Mana Oil
S(13947, {{k="d", item=11226, npc=10184, name="Onyxia", zone="Onyxia's Lair"},
          {k="d", item=11226, npc=11583, name="Nefarian", zone="Blackwing Lair"},
          {k="w", item=11226}}) -- Enchant Gloves - Riding Skill
S(13948, {{k="t", cost=6500}}) -- Enchant Gloves - Minor Haste
S(20008, {{k="d", item=16214, npc=2642, name="Vilebranch Shadowcaster", zone="The Hinterlands"}}) -- Enchant Bracer - Greater Intellect
S(20020, {{k="w", item=16215}}) -- Enchant Boots - Greater Stamina
S(13898, {{k="d", item=11207, npc=9024, name="Pyromancer Loregrain", zone="Blackrock Depths"}}) -- Enchant Weapon - Fiery Weapon
S(15596, {{k="d", item=11813, npc=9025, name="Lord Roccor", zone="Blackrock Depths"}}) -- Smoking Heart of the Mountain
S(20014, {{k="d", item=16216, npc=5259, name="Atal'ai Witch Doctor", zone="The Temple of Atal'Hakkar"}}) -- Enchant Cloak - Greater Resistance
S(20017, {{k="v", item=16217, cost=12000, npc=4229, name="Mythrin'dir", zone="Darnassus", limited=true, faction="Alliance"},
          {k="v", item=16217, cost=12000, npc=4561, name="Daniel Bartlett", zone="Undercity", limited=true, faction="Horde"}}) -- Enchant Shield - Greater Stamina
S(20009, {{k="w", item=16218}}) -- Enchant Bracer - Superior Spirit
S(20012, {{k="d", item=16219, npc=6201, name="Legashi Rogue", zone="Azshara"}}) -- Enchant Gloves - Greater Agility
S(25128, {{k="v", item=20755, cost=20000, npc=15419, name="Kania", zone="Silithus"}}) -- Wizard Oil
S(20024, {{k="w", item=16220}}) -- Enchant Boots - Spirit
S(20026, {{k="v", item=16221, cost=16000, npc=11189, name="Qia", zone="Winterspring", limited=true}}) -- Enchant Chest - Major Health
S(20016, {{k="d", item=16222, npc=9447, name="Scarlet Warder", zone="Eastern Plaguelands"}}) -- Enchant Shield - Superior Spirit
S(20015, {{k="v", item=16224, cost=20000, npc=12022, name="Lorelae Wintersong", zone="Moonglade", limited=true}}) -- Enchant Cloak - Superior Defense
S(20029, {{k="d", item=16223, npc=7524, name="Anguished Highborne", zone="Winterspring"}}) -- Enchant Weapon - Icy Chill
S(20028, {{k="d", item=16242, npc=9452, name="Scarlet Enchanter", zone="Eastern Plaguelands"}}) -- Enchant Chest - Major Mana
S(20051, {{k="v", item=16243, cost=22000, npc=12022, name="Lorelae Wintersong", zone="Moonglade", limited=true}}) -- Runed Arcanite Rod
S(23799, {{k="v", item=19444, cost=30000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Enchant Weapon - Strength
S(23800, {{k="v", item=19445, cost=30000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Enchant Weapon - Agility
S(23801, {{k="v", item=19446, cost=30000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades", faction="Horde"},
          {k="v", item=19446, cost=30000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands", faction="Alliance"},
          {k="v", item=19446, cost=30000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"}}) -- Enchant Bracer - Mana Regeneration
S(27837, {{k="v", item=22392, cost=25000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Enchant 2H Weapon - Agility
S(20010, {{k="d", item=16246, npc=7372, name="Deadwind Warlock", zone="Deadwind Pass"}}) -- Enchant Bracer - Superior Strength
S(20013, {{k="d", item=16244, npc=9198, name="Spirestone Mystic", zone="Blackrock Spire"}}) -- Enchant Gloves - Greater Strength
S(20023, {{k="w", item=16245}}) -- Enchant Boots - Greater Agility
S(20030, {{k="d", item=16247, npc=10317, name="Blackhand Elite", zone="Blackrock Spire"}}) -- Enchant 2H Weapon - Superior Impact
S(20033, {{k="d", item=16248, npc=10398, name="Thuzadin Shadowcaster", zone="Stratholme"}}) -- Enchant Weapon - Unholy Weapon
S(25129, {{k="v", item=20756, cost=40000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Brilliant Wizard Oil
S(25130, {{k="v", item=20757, cost=40000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Brilliant Mana Oil
S(20011, {{k="w", item=16251}}) -- Enchant Bracer - Superior Stamina
S(20025, {{k="d", item=16253, npc=10184, name="Onyxia", zone="Onyxia's Lair"},
          {k="d", item=16253, npc=11583, name="Nefarian", zone="Blackwing Lair"},
          {k="w", item=16253}}) -- Enchant Chest - Greater Stats
S(20031, {{k="d", item=16250, zone="Blackrock Spire"}}) -- Enchant Weapon - Superior Striking
S(20032, {{k="d", item=16254, npc=10499, name="Spectral Researcher", zone="Scholomance"}}) -- Enchant Weapon - Lifestealing
S(20034, {{k="d", item=16252, npc=4494, name="Scarlet Spellbinder", zone="Western Plaguelands"}}) -- Enchant Weapon - Crusader
S(20035, {{k="d", item=16255, npc=10469, name="Scholomance Adept", zone="Scholomance"}}) -- Enchant 2H Weapon - Major Spirit
S(20036, {{k="d", item=16249, npc=10422, name="Crimson Sorcerer", zone="Stratholme"}}) -- Enchant 2H Weapon - Major Intellect
S(22749, {{k="d", item=18259, zone="Molten Core"}}) -- Enchant Weapon - Spell Power
S(22750, {{k="d", item=18260, zone="Molten Core"}}) -- Enchant Weapon - Healing Power
S(23802, {{k="v", item=19447, cost=60000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades", faction="Horde"},
          {k="v", item=19447, cost=60000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands", faction="Alliance"},
          {k="v", item=19447, cost=60000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"}}) -- Enchant Bracer - Healing Power
S(23803, {{k="v", item=19448, cost=80000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Enchant Weapon - Mighty Spirit
S(23804, {{k="v", item=19449, cost=100000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Enchant Weapon - Mighty Intellect
S(25072, {{k="d", item=20726, npc=15275, name="Emperor Vek'nilash", zone="Ahn'Qiraj"}}) -- Enchant Gloves - Threat
S(25073, {{k="d", item=20727, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Gloves - Shadow Power
S(25074, {{k="d", item=20728, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Gloves - Frost Power
S(25078, {{k="d", item=20729, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Gloves - Fire Power
S(25079, {{k="d", item=20730, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Gloves - Healing Power
S(25080, {{k="d", item=20731, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Gloves - Superior Agility
S(25081, {{k="v", item=20732, cost=100000, npc=15419, name="Kania", zone="Silithus"},
          {k="v", item=229008, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Enchant Cloak - Greater Fire Resistance
S(25082, {{k="v", item=20733, cost=100000, npc=15419, name="Kania", zone="Silithus"},
          {k="v", item=229009, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Enchant Cloak - Greater Nature Resistance
S(25083, {{k="d", item=20734, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Cloak - Stealth
S(25084, {{k="d", item=20735, npc=15276, name="Emperor Vek'lor", zone="Ahn'Qiraj"}}) -- Enchant Cloak - Subtlety
S(25086, {{k="d", item=20736, zone="Ruins of Ahn'Qiraj"}}) -- Enchant Cloak - Dodge
-- DATA_END
