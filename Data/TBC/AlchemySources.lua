local ADDON_NAME, ns = ...

-- Acquisition sources for TBC Alchemy recipes: where each recipe is
-- obtained. Keyed by crafting spell ID (same as AlchemyData.lua).
-- Generated from Wowhead TBC (Anniversary 2.5.x) data 2026-08-05.

local S = ns.NewSourceDB("ALCHEMY")

-- DATA_START (generated; do not hand-edit between markers)
S(2329, {{k="t"}}) -- Elixir of Lion's Strength
S(7183, {{k="t"}}) -- Elixir of Minor Defense
S(2330, {{k="t"}}) -- Minor Healing Potion
S(24266, {{k="u"}}) -- Gurubashi Mojo Madness (learned from the Tablet of Madness object, Zul'Gurub)
S(41458, {{k="u"}}) -- Cauldron of Major Arcane Protection (discovery)
S(41500, {{k="u"}}) -- Cauldron of Major Fire Protection (discovery)
S(41501, {{k="u"}}) -- Cauldron of Major Frost Protection (discovery)
S(41502, {{k="u"}}) -- Cauldron of Major Nature Protection (discovery)
S(41503, {{k="u"}}) -- Cauldron of Major Shadow Protection (discovery)
S(28585, {{k="u"}}) -- Transmute: Primal Earth to Life (discovery)
S(28583, {{k="u"}}) -- Transmute: Primal Fire to Mana (discovery)
S(28584, {{k="u"}}) -- Transmute: Primal Life to Earth (discovery)
S(28582, {{k="u"}}) -- Transmute: Primal Mana to Fire (discovery)
S(28580, {{k="u"}}) -- Transmute: Primal Shadow to Water (discovery)
S(28581, {{k="u"}}) -- Transmute: Primal Water to Shadow (discovery)
S(28590, {{k="u"}}) -- Flask of Blinding Light (discovery)
S(28587, {{k="u"}}) -- Flask of Fortification (discovery)
S(28588, {{k="u"}}) -- Flask of Mighty Restoration (discovery)
S(28591, {{k="u"}}) -- Flask of Pure Death (discovery)
S(28589, {{k="u"}}) -- Flask of Relentless Assault (discovery)
S(28586, {{k="u"}}) -- Super Rejuvenation Potion (discovery)
S(3170, {{k="t", cost=50}}) -- Weak Troll's Blood Potion
S(2331, {{k="t", cost=100}}) -- Minor Mana Potion
S(2332, {{k="t", cost=150}}) -- Minor Rejuvenation Potion
S(4508, {{k="q", item=4597, quest=429, name="Wild Hearts", faction="Horde"}}) -- Discolored Healing Potion
S(3230, {{k="w", item=2553}}) -- Elixir of Minor Agility
S(2334, {{k="t", cost=250}}) -- Elixir of Minor Fortitude
S(2337, {{k="t", cost=1000}}) -- Lesser Healing Potion
S(6617, {{k="v", item=5640, cost=100, npc=1669, name="Defias Profiteer", zone="Westfall", limited=true},
         {k="v", item=5640, cost=90, npc=1685, name="Xandar Goodbeard", zone="Loch Modan", limited=true, faction="Alliance"},
         {k="v", item=5640, cost=90, npc=3335, name="Hagrus", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=5640, cost=100, npc=3499, name="Ranik", zone="The Barrens", limited=true}}) -- Rage Potion
S(2335, {{k="w", item=2555}}) -- Swiftness Potion
S(7836, {{k="t", cost=250}}) -- Blackmouth Oil
S(8240, {{k="w", item=6663}}) -- Elixir of Giant Growth
S(7179, {{k="t", cost=450}}) -- Elixir of Water Breathing
S(3171, {{k="t", cost=500}}) -- Elixir of Wisdom
S(7255, {{k="v", item=6053, cost=720, npc=1685, name="Xandar Goodbeard", zone="Loch Modan", limited=true, faction="Alliance"},
         {k="v", item=6053, cost=800, npc=3134, name="Kzixx", zone="Duskwood", limited=true},
         {k="v", item=6053, cost=720, npc=3490, name="Hula'mahi", zone="The Barrens", limited=true, faction="Horde"}}) -- Holy Protection Potion
S(7841, {{k="t", cost=1000}}) -- Swim Speed Potion
S(3447, {{k="t", cost=4000}}) -- Healing Potion
S(3172, {{k="w", item=3393}}) -- Minor Magic Resistance Potion
S(3173, {{k="t", cost=1500}}) -- Lesser Mana Potion
S(3174, {{k="w", item=3394}}) -- Potion of Curing
S(3176, {{k="t", cost=1500}}) -- Strong Troll's Blood Potion
S(7837, {{k="t", cost=1000}}) -- Fire Oil
S(3177, {{k="t", cost=2000}}) -- Elixir of Defense
S(7256, {{k="v", item=6054, cost=810, npc=2393, name="Christoph Jeffcoat", zone="Hillsbrad Foothills", limited=true, faction="Horde"},
         {k="v", item=6054, cost=900, npc=3956, name="Harklan Moongrove", zone="Ashenvale", limited=true, faction="Alliance"}}) -- Shadow Protection Potion
S(7845, {{k="t", cost=3000}}) -- Elixir of Firepower
S(2333, {{k="w", item=3396}}) -- Elixir of Lesser Agility
S(3188, {{k="w", item=6211}}) -- Elixir of Ogre's Strength
S(6624, {{k="v", item=5642, cost=1440, npc=3348, name="Kor'geld", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=5642, cost=1620, npc=4226, name="Ulthir", zone="Darnassus", limited=true, faction="Alliance"},
         {k="v", item=5642, cost=1800, npc=5178, name="Soolie Berryfizz", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=5642, cost=1800, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Free Action Potion
S(7181, {{k="t", cost=5000}}) -- Greater Healing Potion
S(3452, {{k="t", cost=5000}}) -- Mana Potion
S(3448, {{k="t", cost=5000}}) -- Lesser Invisibility Potion
S(3449, {{k="v", item=6068, cost=1500, npc=2481, name="Bliztik", zone="Duskwood", limited=true},
         {k="v", item=6068, cost=1500, npc=4878, name="Montarr", zone="Thousand Needles", limited=true, faction="Horde"},
         {k="v", item=6068, cost=1500, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Shadow Oil
S(7257, {{k="v", item=6055, cost=1500, npc=2380, name="Nandar Branson", zone="Hillsbrad Foothills", limited=true, faction="Alliance"},
         {k="v", item=6055, cost=1275, npc=4083, name="Jeeda", zone="Stonetalon Mountains", limited=true, faction="Horde"}}) -- Fire Protection Potion
S(3450, {{k="t", cost=6000}, {k="w", item=3830}}) -- Elixir of Fortitude
S(6618, {{k="v", item=5643, cost=1800, npc=3335, name="Hagrus", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=5643, cost=1600, npc=4226, name="Ulthir", zone="Darnassus", limited=true, faction="Alliance"},
         {k="v", item=5643, cost=2000, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Great Rage Potion
S(3451, {{k="w", item=3831}}) -- Mighty Troll's Blood Potion
S(11449, {{k="t", cost=6500}}) -- Elixir of Agility
S(7258, {{k="v", item=6056, cost=1800, npc=2812, name="Drovnar Strongbrew", zone="Arathi Highlands", limited=true, faction="Alliance"},
         {k="v", item=6056, cost=2000, npc=2848, name="Glyx Brewright", zone="Stranglethorn Vale", limited=true}}) -- Frost Protection Potion
S(21923, {{k="q", item=17709, quest=8769, name="A Ticking Present"}}) -- Elixir of Frost Power (recipe from Feast of Winter Veil presents)
S(7259, {{k="v", item=6057, cost=2000, npc=2848, name="Glyx Brewright", zone="Stranglethorn Vale", limited=true},
         {k="v", item=6057, cost=2000, npc=5594, name="Alchemist Pestlezugg", zone="Tanaris", limited=true},
         {k="v", item=6057, cost=2000, npc=8157, name="Logannas", zone="Feralas", limited=true, faction="Alliance"},
         {k="v", item=6057, cost=1800, npc=8158, name="Bronk", zone="Feralas", limited=true, faction="Horde"}}) -- Nature Protection Potion
S(3453, {{k="w", item=3832}}) -- Elixir of Detect Lesser Invisibility
S(11450, {{k="t", cost=7500}}) -- Elixir of Greater Defense
S(12609, {{k="t", cost=8000}}) -- Catseye Elixir
S(3454, {{k="v", item=14634, cost=2500, npc=2480, name="Bro'kin", zone="Alterac Mountains", limited=true}}) -- Frost Oil
S(11448, {{k="t", cost=9000}}) -- Greater Mana Potion
S(11451, {{k="t", cost=8000}}) -- Oil of Immolation
S(11456, {{k="u"}}) -- Goblin Rocket Fuel (recipe item crafted by Goblin Engineers)
S(11453, {{k="w", item=9293}}) -- Magic Resistance Potion
S(11452, {{k="q", quest=2501, name="Badlands Reagent Run II", zone="Badlands", faction="Alliance"},
          {k="q", quest=2203, name="Badlands Reagent Run II", zone="Badlands", faction="Horde"}}) -- Restorative Potion
S(22808, {{k="t", cost=10000}}) -- Elixir of Greater Water Breathing
S(4942, {{k="q", item=4624, quest=715, name="Liquid Stone"}}) -- Lesser Stoneshield Potion
S(11457, {{k="t", cost=10000}}) -- Superior Healing Potion
S(11459, {{k="v", item=9303, cost=8000, npc=5594, name="Alchemist Pestlezugg", zone="Tanaris"}}) -- Philosopher's Stone
S(11479, {{k="v", item=9304, cost=8000, npc=5594, name="Alchemist Pestlezugg", zone="Tanaris"}}) -- Transmute: Iron to Gold
S(11480, {{k="v", item=9305, cost=8000, npc=5594, name="Alchemist Pestlezugg", zone="Tanaris", limited=true}}) -- Transmute: Mithril to Truesilver
S(11458, {{k="w", item=9294}}) -- Wildvine Potion
S(15833, {{k="t", cost=10000}}) -- Dreamless Sleep Potion
S(11460, {{k="t", cost=5000}}) -- Elixir of Detect Undead
S(11461, {{k="t", cost=10000}}) -- Arcane Elixir
S(11465, {{k="t", cost=12000}}) -- Elixir of Greater Intellect
S(11464, {{k="w", item=9295}}) -- Invisibility Potion
S(11468, {{k="w", item=9297}}) -- Elixir of Dream Vision
S(11467, {{k="t", cost=12000}}) -- Elixir of Greater Agility
S(11466, {{k="d", item=9296, npc=1783, name="Skeletal Flayer", zone="Western Plaguelands"},
          {k="d", item=9296, npc=1791, name="Slavering Ghoul", zone="Western Plaguelands"}}) -- Gift of Arthas
S(11472, {{k="w", item=9298}}) -- Elixir of Giants
S(11473, {{k="v", item=9302, cost=9000, npc=8157, name="Logannas", zone="Feralas", limited=true, faction="Alliance"},
          {k="v", item=9302, cost=9000, npc=8158, name="Bronk", zone="Feralas", limited=true, faction="Horde"}}) -- Ghost Dye
S(17551, {{k="t", cost=15000}}) -- Stonescale Oil
S(11477, {{k="v", item=9300, cost=9000, npc=8177, name="Rartar", zone="Swamp of Sorrows", limited=true, faction="Horde"},
          {k="v", item=9300, cost=9000, npc=8178, name="Nina Lightbrew", zone="Blasted Lands", limited=true, faction="Alliance"}}) -- Elixir of Demonslaying
S(11478, {{k="t", cost=14000}}) -- Elixir of Detect Demon
S(26277, {{k="d", item=21547, npc=8637, name="Dark Iron Watchman", zone="Searing Gorge"},
          {k="d", item=21547, npc=5844, name="Dark Iron Slaver", zone="Searing Gorge"},
          {k="d", item=21547, npc=5846, name="Dark Iron Taskmaster", zone="Searing Gorge"}}) -- Elixir of Greater Firepower
S(11476, {{k="v", item=9301, cost=9000, npc=1313, name="Maria Lumere", zone="Stormwind City", limited=true, faction="Alliance"},
          {k="v", item=9301, cost=9000, npc=4610, name="Algernon", zone="Undercity", limited=true, faction="Horde"}}) -- Elixir of Shadow Power
S(3175, {{k="w", item=3395}}) -- Limited Invulnerability Potion
S(17552, {{k="t", cost=15000},
          {k="d", item=13476, npc=7027, name="Blackrock Slayer", zone="Burning Steppes"}}) -- Mighty Rage Potion
S(17553, {{k="t", cost=15000},
          {k="v", item=13477, cost=12631, npc=4226, name="Ulthir", zone="Darnassus", limited=true, faction="Alliance"},
          {k="v", item=13477, cost=12000, npc=4610, name="Algernon", zone="Undercity", limited=true, faction="Horde"}}) -- Superior Mana Potion
S(17554, {{k="v", item=13478, cost=11700, npc=3348, name="Kor'geld", zone="Orgrimmar", limited=true, faction="Horde"},
          {k="v", item=13478, cost=11700, npc=5178, name="Soolie Berryfizz", zone="Ironforge", limited=true, faction="Alliance"}}) -- Elixir of Superior Defense
S(17555, {{k="t", cost=15000},
          {k="d", item=13479, npc=9450, name="Scarlet Curate", zone="Eastern Plaguelands"},
          {k="d", item=13479, npc=9449, name="Scarlet Cleric", zone="Eastern Plaguelands"},
          {k="d", item=13479, npc=9452, name="Scarlet Enchanter", zone="Eastern Plaguelands"}}) -- Elixir of the Sages
S(17559, {{k="v", item=13482, cost=15000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades"},
          {k="v", item=13482, cost=13500, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
          {k="v", item=13482, cost=15000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"}}) -- Transmute: Air to Fire
S(17187, {{k="v", item=12958, cost=50000, npc=5594, name="Alchemist Pestlezugg", zone="Tanaris"}}) -- Transmute: Arcanite
S(17566, {{k="w", item=13489}}) -- Transmute: Earth to Life
S(17561, {{k="v", item=13484, cost=15000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Transmute: Earth to Water
S(17560, {{k="v", item=13483, cost=15000, npc=9499, name="Plugger Spazzring", zone="Blackrock Depths"}}) -- Transmute: Fire to Earth
S(17565, {{k="w", item=13488}}) -- Transmute: Life to Earth
S(17563, {{k="w", item=13486}}) -- Transmute: Undeath to Water
S(17562, {{k="v", item=13485, cost=15000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"}}) -- Transmute: Water to Air
S(17564, {{k="w", item=13487}}) -- Transmute: Water to Undeath
S(17557, {{k="t", cost=20000},
          {k="q", item=13481, quest=5150, name="Dadanga is Hungry!", zone="Un'Goro Crater"}}) -- Elixir of Brute Force (trainer, or Dadanga is Hungry! reward package)
S(24366, {{k="v", item=20012, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Greater Dreamless Sleep Potion
S(24365, {{k="v", item=20011, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Mageblood Potion
S(17556, {{k="t", cost=20000},
          {k="v", item=13480, cost=15789, npc=11188, name="Evie Whirlbrew", zone="Winterspring", limited=true}}) -- Major Healing Potion
S(17571, {{k="d", item=13491, npc=6201, name="Legashi Rogue", zone="Azshara"},
          {k="d", item=13491, npc=7106, name="Jadefire Rogue", zone="Felwood"}}) -- Elixir of the Mongoose
S(17570, {{k="w", item=13490}}) -- Greater Stoneshield Potion
S(17573, {{k="t", cost=20000}, {k="w", item=13493}}) -- Greater Arcane Elixir
S(24367, {{k="v", item=20013, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Living Action Potion
S(17572, {{k="t", cost=20000}, {k="w", item=13492}}) -- Purification Potion
S(17577, {{k="d", item=13497, npc=7437, name="Cobalt Mageweaver", zone="Winterspring"}}) -- Greater Arcane Protection Potion
S(17574, {{k="d", item=13494, npc=9262, name="Firebrand Invoker", zone="Blackrock Spire"},
          {k="d", item=13494, npc=9264, name="Firebrand Pyromancer", zone="Blackrock Spire"}}) -- Greater Fire Protection Potion
S(17575, {{k="d", item=13495, npc=7428, name="Frostmaul Giant", zone="Winterspring"}}) -- Greater Frost Protection Potion
S(17576, {{k="d", item=13496, npc=1813, name="Decaying Horror", zone="Western Plaguelands"},
          {k="d", item=13496, npc=1812, name="Rotting Behemoth", zone="Western Plaguelands"}}) -- Greater Nature Protection Potion
S(17578, {{k="d", item=13499, npc=8546, name="Dark Adept", zone="Eastern Plaguelands"},
          {k="d", item=13499, npc=8550, name="Shadowmage", zone="Eastern Plaguelands"}}) -- Greater Shadow Protection Potion
S(24368, {{k="v", item=20014, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Major Troll's Blood Potion
S(17580, {{k="v", item=13501, cost=30000, npc=11278, name="Magnus Frostwake", zone="Western Plaguelands"},
          {k="d", item=13501, npc=1853, name="Darkmaster Gandling", zone="Scholomance"}}) -- Major Mana Potion
S(25146, {{k="v", item=20761, cost=102000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Transmute: Elemental Fire
S(22732, {{k="d", item=18257, zone="Molten Core"}}) -- Major Rejuvenation Potion
S(33740, {{k="t", cost=20000}}) -- Adept's Elixir
S(17638, {{k="v", item=31357, cost=34000, npc=21655, name="Nakodu", zone="Shattrath City"},
          {k="d", item=13522, npc=10339, name="Gyth", zone="Blackrock Spire"}}) -- Flask of Chromatic Resistance
S(17636, {{k="v", item=31356, cost=34000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"},
          {k="d", item=13520, npc=10812, name="Grand Crusader Dathrohan", zone="Stratholme"}}) -- Flask of Distilled Wisdom
S(17634, {{k="w", item=13518}}) -- Flask of Petrification
S(17637, {{k="v", item=31355, cost=34000, npc=21643, name="Alurmi", zone="Tanaris"},
          {k="d", item=13521, npc=10508, name="Ras Frostwhisper", zone="Scholomance"}}) -- Flask of Supreme Power
S(17635, {{k="v", item=31354, cost=36000, npc=21432, name="Almaador", zone="Shattrath City"},
          {k="d", item=13519, npc=10363, name="General Drakkisath", zone="Blackrock Spire"}}) -- Flask of the Titans
S(33738, {{k="t", cost=20000}}) -- Onslaught Elixir
S(33732, {{k="t", cost=20000}}) -- Volatile Healing Potion
S(17632, {{k="v", item=13517, cost=68000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Alchemist's Stone
S(28543, {{k="v", item=22900, cost=24000, npc=16588, name="Apothecary Antonivich", zone="Hellfire Peninsula", limited=true, faction="Horde"},
          {k="v", item=22900, cost=28500, npc=16641, name="Melaris", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=22900, cost=27000, npc=16705, name="Altaa", zone="The Exodar", limited=true, faction="Alliance"},
          {k="v", item=22900, cost=24000, npc=18802, name="Alchemist Gribble", zone="Hellfire Peninsula", limited=true, faction="Alliance"}}) -- Elixir of Camouflage
S(28544, {{k="t", cost=25000}}) -- Elixir of Major Strength
S(28545, {{k="t", cost=25000}}) -- Elixir of Healing Power
S(39636, {{k="t", cost=25000}}) -- Elixir of Major Fortitude
S(33733, {{k="t", cost=25000}}) -- Unstable Mana Potion
S(33741, {{k="t", cost=30000}}) -- Elixir of Mastery
S(28546, {{k="v", item=22901, cost=27000, npc=18017, name="Seer Janidi", zone="Zangarmarsh", limited=true, faction="Horde"},
          {k="v", item=22901, cost=30000, npc=19042, name="Leeli Longhaggle", zone="Terokkar Forest", limited=true, faction="Alliance"}}) -- Sneaking Potion
S(39637, {{k="v", item=32070, cost=32000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Earthen Elixir
S(39638, {{k="t", cost=30000}}) -- Elixir of Draenic Wisdom
S(28549, {{k="v", item=22902, cost=38000, npc=18005, name="Haalrun", zone="Zangarmarsh", limited=true, faction="Alliance"},
          {k="v", item=22902, cost=36000, npc=18017, name="Seer Janidi", zone="Zangarmarsh", limited=true, faction="Horde"}}) -- Elixir of Major Frost Power
S(28550, {{k="w", item=22903}}) -- Insane Strength Potion
S(45061, {{k="t", cost=35000}}) -- Mad Alchemist's Potion
S(28552, {{k="w", item=22904}}) -- Elixir of the Searching Eye
S(38070, {{k="t", cost=20000}}) -- Mercurial Stone
S(28551, {{k="t", cost=50000}}) -- Super Healing Potion
S(39639, {{k="v", item=32071, npc=18821, name="Quartermaster Jaffrey Noreliqe", zone="Nagrand", faction="Horde"},
          {k="v", item=32071, npc=18822, name="Quartermaster Davian Vaclav", zone="Nagrand", faction="Alliance"}}) -- Elixir of Ironskin
S(28553, {{k="v", item=24001, cost=42500, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=22905, cost=40000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Elixir of Major Agility
S(38960, {{k="d", item=31680, zone="Shadowmoon Valley"}}) -- Fel Strength Elixir
S(28554, {{k="v", item=22906, npc=18382, name="Mycah", zone="Zangarmarsh"}}) -- Shrouding Potion
S(28555, {{k="v", item=22907, cost=45000, npc=18005, name="Haalrun", zone="Zangarmarsh", faction="Alliance"},
          {k="v", item=22907, cost=50000, npc=19837, name="Daga Ramba", zone="Blade's Edge Mountains", faction="Horde"}}) -- Super Mana Potion
S(28557, {{k="v", item=22909, cost=45000, npc=18005, name="Haalrun", zone="Zangarmarsh", faction="Alliance"},
          {k="v", item=22909, cost=50000, npc=19837, name="Daga Ramba", zone="Blade's Edge Mountains", faction="Horde"}}) -- Elixir of Major Defense
S(28556, {{k="v", item=22908, cost=51000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Elixir of Major Firepower
S(38962, {{k="d", item=31681, zone="Shadowmoon Valley"}}) -- Fel Regeneration Potion
S(28565, {{k="w", item=22914}}) -- Destruction Potion
S(28558, {{k="v", item=22910, cost=64000, npc=21655, name="Nakodu", zone="Shattrath City"}}) -- Elixir of Major Shadow Power
S(28564, {{k="w", item=22913},
          {k="d", item=35295, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Haste Potion
S(28563, {{k="w", item=22912}}) -- Heroic Potion
S(28562, {{k="v", item=22911, cost=50000, npc=19042, name="Leeli Longhaggle", zone="Terokkar Forest", faction="Alliance"},
          {k="v", item=22911, cost=50000, npc=19837, name="Daga Ramba", zone="Blade's Edge Mountains", faction="Horde"}}) -- Major Dreamless Sleep Potion
S(32765, {{k="v", item=25869, cost=68000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Transmute: Earthstorm Diamond
S(28566, {{k="v", item=22915, cost=68000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Transmute: Primal Air to Fire
S(28567, {{k="v", item=22916, npc=18382, name="Mycah", zone="Zangarmarsh"}}) -- Transmute: Primal Earth to Water
S(28568, {{k="v", item=30443, cost=64000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"},
          {k="v", item=22917, cost=64000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"}}) -- Transmute: Primal Fire to Earth
S(29688, {{k="v", item=23574, cost=76000, npc=16641, name="Melaris", zone="Silvermoon City", faction="Horde"},
          {k="v", item=23574, cost=72000, npc=16705, name="Altaa", zone="The Exodar", faction="Alliance"},
          {k="v", item=23574, cost=64000, npc=19074, name="Skreah", zone="Shattrath City"}}) -- Transmute: Primal Might
S(28569, {{k="v", item=22918, cost=64000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Transmute: Primal Water to Air
S(32766, {{k="v", item=29232, cost=68000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=25870, cost=64000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Transmute: Skyfire Diamond
S(28570, {{k="w", item=22919}}) -- Elixir of Major Mageblood
S(38961, {{k="d", item=31682, zone="Shadowmoon Valley"}}) -- Fel Mana Potion
S(28575, {{k="d", item=22923, npc=17150, name="Vir'aani Arcanist", zone="Nagrand"}}) -- Major Arcane Protection Potion
S(28571, {{k="d", item=22920, npc=19221, name="Nethermancer Sepethrea", zone="The Mechanar"},
          {k="d", item=22920, npc=19168, name="Sunseeker Astromage", zone="The Mechanar"}}) -- Major Fire Protection Potion
S(28572, {{k="d", item=22921, npc=18344, name="Nexus-Prince Shaffar", zone="Mana-Tombs"}}) -- Major Frost Protection Potion
S(28577, {{k="d", item=22925, npc=19973, name="Abyssal Flamebringer", zone="Blade's Edge Mountains"}}) -- Major Holy Protection Potion
S(28573, {{k="v", item=22922, cost=80000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Major Nature Protection Potion
S(28576, {{k="d", item=22924, npc=21302, name="Shadow Council Warlock", zone="Shadowmoon Valley"}}) -- Major Shadow Protection Potion
S(28578, {{k="w", item=22926},
          {k="d", item=35294, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Elixir of Empowerment
S(28579, {{k="d", item=22927, npc=17862, name="Captain Skarloc", zone="Old Hillsbrad Foothills"}}) -- Ironshield Potion
S(47050, {{k="v", item=35755, cost=200000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Assassin's Alchemist Stone
S(42736, {{k="v", item=33209, cost=34000, npc=18255, name="Apprentice Darius", zone="Deadwind Pass"}}) -- Flask of Chromatic Wonder
S(47046, {{k="v", item=35752, cost=200000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Guardian's Alchemist Stone
S(47049, {{k="v", item=35754, cost=200000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Redeemer's Alchemist Stone
S(47048, {{k="v", item=35753, cost=200000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Sorcerer's Alchemist Stone
-- DATA_END
