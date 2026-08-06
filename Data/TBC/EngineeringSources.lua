local ADDON_NAME, ns = ...

-- Acquisition sources for TBC Engineering recipes: where each recipe
-- is obtained. Keyed by crafting spell ID (same as EngineeringData.lua).
-- Generated from Wowhead TBC (2.5.x) data 2026-08-05.

local S = ns.NewSourceDB("ENGINEERING")

-- DATA_START (generated; do not hand-edit between markers)
S(3918, {{k="t"}}) -- Rough Blasting Powder
S(3919, {{k="t"}}) -- Rough Dynamite
S(3920, {{k="t"}}) -- Crafted Light Shot
S(3922, {{k="t", cost=115}}) -- Handful of Copper Bolts
S(3923, {{k="t", cost=130}}) -- Rough Copper Bomb
S(7430, {{k="t", cost=150}}) -- Arclight Spanner
S(3924, {{k="t", cost=150}}) -- Copper Tube
S(3925, {{k="t", cost=150}}) -- Rough Boomstick
S(3977, {{k="t", cost=200}}) -- Crude Scope
S(3926, {{k="t", cost=225}}) -- Copper Modulator
S(3929, {{k="t", cost=250}}) -- Coarse Blasting Powder
S(3930, {{k="t", cost=250}}) -- Crafted Heavy Shot
S(3931, {{k="t", cost=250}}) -- Coarse Dynamite
S(3928, {{k="w", item=4408}}) -- Mechanical Squirrel
S(3932, {{k="t", cost=300}}) -- Target Dummy
S(3973, {{k="t", cost=300}}) -- Silver Contact
S(8334, {{k="t", cost=300}}) -- Practice Lock
S(8339, {{k="w", item=6716}}) -- EZ-Thro Dynamite
S(3933, {{k="w", item=4409}}) -- Small Seaforium Charge
S(3934, {{k="t", cost=400}}) -- Flying Tiger Goggles
S(3937, {{k="t", cost=450}}) -- Large Copper Bomb
S(3938, {{k="t", cost=450}}) -- Bronze Tube
S(3936, {{k="t", cost=420}}) -- Deadly Blunderbuss
S(3978, {{k="t", cost=475}}) -- Standard Scope
S(3941, {{k="t", cost=500}}) -- Small Bronze Bomb
S(3939, {{k="v", item=13309, cost=1000, npc=2682, name="Fradd Swiftgear", zone="Wetlands", limited=true, faction="Alliance"},
         {k="v", item=13309, cost=1000, npc=6730, name="Jinky Twizzlefixxit", zone="Thousand Needles", limited=true}}) -- Lovingly Crafted Boomstick
S(3940, {{k="w", item=4410}}) -- Shadow Goggles
S(3942, {{k="t", cost=500}}) -- Whirring Bronze Gizmo
S(3944, {{k="d", item=4411, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Flame Deflector
S(3945, {{k="t", cost=500}}) -- Heavy Blasting Powder
S(3946, {{k="t", cost=500}}) -- Heavy Dynamite
S(3947, {{k="t", cost=300}}) -- Crafted Solid Shot
S(26416, {{k="d", item=21724, name="Winter Veil gift"}}) -- Small Blue Rocket
S(26417, {{k="d", item=21725, name="Winter Veil gift"}}) -- Small Green Rocket
S(26418, {{k="d", item=21726, name="Winter Veil gift"}}) -- Small Red Rocket
S(9269, {{k="v", item=7560, cost=1200, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=7560, cost=1200, npc=6730, name="Jinky Twizzlefixxit", zone="Thousand Needles", limited=true},
         {k="d", item=7560, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Gnomish Universal Remote
S(3949, {{k="t", cost=550}}) -- Silver-plated Shotgun
S(6458, {{k="t", cost=400}}) -- Ornate Spyglass
S(3950, {{k="t", cost=600}}) -- Big Bronze Bomb
S(3952, {{k="v", item=14639, cost=1500, npc=2682, name="Fradd Swiftgear", zone="Wetlands", limited=true, faction="Alliance"},
         {k="v", item=14639, cost=1500, npc=2683, name="Namdo Bizzfizzle", limited=true, faction="Alliance"}}) -- Minor Recombobulator
S(3953, {{k="t", cost=600}}) -- Bronze Framework
S(3954, {{k="w", item=4412}}) -- Moonsight Rifle
S(9271, {{k="t", cost=500}}) -- Aquadynamic Fish Attractor
S(12584, {{k="t", cost=1000}}) -- Gold Power Core
S(23066, {{k="v", item=18647, cost=1800, npc=3413, name="Sovik", zone="Orgrimmar", limited=true, faction="Horde"}}) -- Red Firework
S(23067, {{k="v", item=18649, cost=1694, npc=1304, name="Darian Singh", zone="Stormwind City", limited=true, faction="Alliance"},
          {k="v", item=18649, cost=1800, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"}}) -- Blue Firework
S(23068, {{k="v", item=18648, cost=1800, npc=2838, name="Crazk Sparks", zone="Stranglethorn Vale", limited=true},
          {k="v", item=18648, cost=1800, npc=3495, name="Gagsprocket", zone="The Barrens", limited=true}}) -- Green Firework
S(3955, {{k="t", cost=750}}) -- Explosive Sheep
S(3956, {{k="t", cost=750}}) -- Green Tinted Goggles
S(3957, {{k="v", item=13308, cost=1800, npc=2684, name="Rizz Loosebolt", zone="Alterac Mountains", limited=true}}) -- Ice Deflector
S(3958, {{k="t", cost=800}}) -- Iron Strut
S(3959, {{k="d", item=4413, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Discombobulator Ray
S(9273, {{k="v", item=7561, cost=2000, npc=3134, name="Kzixx", zone="Duskwood", limited=true},
         {k="v", item=7561, cost=2000, npc=3537, name="Zixil", zone="Hillsbrad Foothills", limited=true},
         {k="v", item=7561, cost=2000, npc=4086, name="Veenix", zone="Stonetalon Mountains", limited=true},
         {k="v", item=7561, cost=2000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="d", item=7561, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Goblin Jumper Cables
S(3960, {{k="w", item=4414}}) -- Portable Bronze Mortar
S(3961, {{k="t", cost=900}}) -- Gyrochronatom
S(3962, {{k="t", cost=1000}}) -- Iron Grenade
S(3963, {{k="t", cost=1000}}) -- Compact Harvest Reaper Kit
S(12585, {{k="t", cost=1000}}) -- Solid Blasting Powder
S(12586, {{k="t", cost=1000}}) -- Solid Dynamite
S(12590, {{k="t", cost=1000}}) -- Gyromatic Micro-Adjustor
S(26420, {{k="d", item=21727, name="Winter Veil gift"}}) -- Large Blue Rocket
S(26421, {{k="d", item=21728, name="Winter Veil gift"}}) -- Large Green Rocket
S(26422, {{k="d", item=21729, name="Winter Veil gift"}}) -- Large Red Rocket
S(12587, {{k="w", item=10601}}) -- Bright-Eye Goggles
S(3979, {{k="v", item=13310, cost=2000, npc=2685, name="Mazk Snipeshot", zone="Stranglethorn Vale", limited=true},
         {k="v", item=13310, cost=2000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true}}) -- Accurate Scope
S(3965, {{k="t", cost=1200}}) -- Advanced Target Dummy
S(8243, {{k="d", item=6672, zone="Gnomeregan"},
         {k="q", item=6672, quest=1559, name="Flash Bomb Recipe", zone="Badlands"}}) -- Flash Bomb
S(3966, {{k="w", item=4415}}) -- Craftsman's Monocle
S(3967, {{k="t", cost=1400}}) -- Big Iron Bomb
S(21940, {{k="d", item=17720, name="Winter Veil gift"}}) -- Snowmaster 9000
S(12589, {{k="t", cost=1300}}) -- Mithril Tube
S(3968, {{k="w", item=4416}}) -- Goblin Land Mine
S(3972, {{k="w", item=4417}}) -- Large Seaforium Charge
S(12591, {{k="t", cost=1500}}) -- Unstable Trigger
S(15255, {{k="t", cost=1500}}) -- Mechanical Repair Kit
S(23069, {{k="v", item=18650, cost=5000, npc=8131, name="Blizrik Buckshot", zone="Tanaris", limited=true}}) -- EZ-Thro Dynamite II
S(3969, {{k="v", item=13311, cost=10000, npc=2687, name="Gnaz Blunderflame", zone="Stranglethorn Vale", limited=true}}) -- Mechanical Dragonling
S(3971, {{k="v", item=7742, cost=2400, npc=6777, name="Zan Shivsproket", zone="Alterac Mountains", limited=true},
         {k="d", item=7742, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Gnomish Cloaking Device
S(13240, {{k="t", cost=1500}}) -- The Mortar: Reloaded
S(12715, {{k="t", cost=1000}}) -- Goblin Rocket Fuel Recipe
S(12760, {{k="t", cost=1500}}) -- Goblin Sapper Charge
S(12895, {{k="t", cost=1500}}) -- Inlaid Mithril Cylinder Plans
S(15628, {{k="d", item=11828, name="Goblin Engineer's Renewal Gift"}}) -- Pet Bombling
S(15633, {{k="d", item=11827, name="Gnome Engineer's Renewal Gift"}}) -- Lil' Smoky
S(12594, {{k="t", cost=1600}}) -- Fire Goggles
S(12595, {{k="t", cost=1600}}) -- Mithril Blunderbuss
S(12716, {{k="u"}}) -- Goblin Mortar
S(12717, {{k="t", cost=1500}}) -- Goblin Mining Helmet
S(12718, {{k="t", cost=1500}}) -- Goblin Construction Helmet
S(12899, {{k="t", cost=1500}}) -- Gnomish Shrink Ray
S(12596, {{k="t", cost=1700}}) -- Hi-Impact Mithril Slugs
S(12597, {{k="v", item=10602, cost=3000, npc=8679, name="Knaz Blunderflame", zone="Stranglethorn Vale", limited=true},
          {k="v", item=10602, cost=3000, npc=9544, name="Yuka Screwspigot", zone="Burning Steppes", limited=true}}) -- Deadly Scope
S(12897, {{k="t", cost=1500}}) -- Gnomish Goggles
S(12902, {{k="t", cost=1800}}) -- Gnomish Net-o-Matic Projector
S(12599, {{k="t", cost=1800}}) -- Mithril Casing
S(12603, {{k="t", cost=1800}}) -- Mithril Frag Bomb
S(12903, {{k="t", cost=2000}}) -- Gnomish Harm Prevention Belt
S(12607, {{k="w", item=10603}}) -- Catseye Ultra Goggles
S(12614, {{k="w", item=10604}}) -- Mithril Heavy-bore Rifle
S(26423, {{k="d", item=21730, name="Winter Veil gift"}}) -- Blue Rocket Cluster
S(26424, {{k="d", item=21731, name="Winter Veil gift"}}) -- Green Rocket Cluster
S(26425, {{k="d", item=21732, name="Winter Veil gift"}}) -- Red Rocket Cluster
S(8895, {{k="t", cost=2200},
         {k="d", item=7192, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Goblin Rocket Boots
S(12615, {{k="t", cost=2500},
          {k="w", item=10605}}) -- Spellpower Goggles Xtreme
S(12616, {{k="w", item=10606}}) -- Parachute Cloak
S(12905, {{k="t", cost=2200}}) -- Gnomish Rocket Boots
S(26442, {{k="q", item=21738, quest=8877, name="Firework Launcher", zone="Moonglade"}}) -- Firework Launcher
S(12755, {{k="t", cost=2400}}) -- Goblin Bomb Dispenser
S(12617, {{k="v", item=10607, cost=3600, npc=8678, name="Jubie Gadgetspring", zone="Azshara", limited=true}}) -- Deepdive Helmet
S(12618, {{k="t", cost=2200}}) -- Rose Colored Goggles
S(12906, {{k="t", cost=2400}}) -- Gnomish Battle Chicken
S(12619, {{k="t", cost=2400}}) -- Hi-Explosive Bomb
S(12754, {{k="t", cost=2600}}) -- The Big One
S(12907, {{k="t", cost=2600}}) -- Gnomish Mind Control Cap
S(12620, {{k="w", item=10608}}) -- Sniper Scope
S(12759, {{k="t", cost=2800}}) -- Gnomish Death Ray
S(12908, {{k="t", cost=2800}}) -- Goblin Dragon Gun
S(12621, {{k="t", cost=2800}}) -- Mithril Gyro-Shot
S(12622, {{k="t", cost=2800}}) -- Green Lens
S(12758, {{k="t", cost=3000}}) -- Goblin Rocket Helmet
S(19788, {{k="t", cost=4000}}) -- Dense Blasting Powder
S(23070, {{k="t", cost=5000}}) -- Dense Dynamite
S(23507, {{k="v", item=19027, cost=5000, npc=14637, name="Zorbin Fandazzle", zone="Feralas"}}) -- Snake Burst Firework
S(12624, {{k="v", item=10609, cost=4000, npc=2688, name="Ruppo Zipcoil", zone="The Hinterlands", limited=true}}) -- Mithril Mechanical Dragonling
S(19567, {{k="t", cost=4000}}) -- Salt Shaker
S(26011, {{k="q", quest=8798, name="A Yeti of Your Own", zone="Winterspring"}}) -- Tranquil Mechanical Yeti
S(23129, {{k="d", item=18661, npc=8920, name="Weapon Technician", zone="Blackrock Depths"}}) -- World Enlarger
S(23071, {{k="v", item=18651, cost=12000, npc=2685, name="Mazk Snipeshot", zone="Stranglethorn Vale", limited=true}}) -- Truesilver Transformer
S(19790, {{k="t", cost=10000},
          {k="v", item=16041, cost=12000, npc=3413, name="Sovik", zone="Orgrimmar", limited=true, faction="Horde"},
          {k="v", item=16041, cost=12000, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"}}) -- Thorium Grenade
S(19791, {{k="t", cost=5000},
          {k="v", item=16042, cost=12000, npc=3413, name="Sovik", zone="Orgrimmar", limited=true, faction="Horde"},
          {k="v", item=16042, cost=12000, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"}}) -- Thorium Widget
S(19792, {{k="t", cost=10000},
          {k="w", item=16043}}) -- Thorium Rifle
S(23077, {{k="v", item=18652, cost=12000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Gyrofreeze Ice Reflector
S(23486, {{k="t"}}) -- Dimensional Ripper - Everlook
S(23489, {{k="t"}}) -- Ultrasafe Transporter - Gadgetzan
S(23096, {{k="d", item=18654, npc=8920, name="Weapon Technician", zone="Blackrock Depths"}}) -- Alarm-O-Bot
S(19793, {{k="w", item=16044}}) -- Lifelike Mechanical Toad
S(23078, {{k="d", item=18653, npc=9499, name="Plugger Spazzring", zone="Blackrock Depths"}}) -- Goblin Jumper Cables XL
S(19794, {{k="t", cost=20000},
          {k="d", item=16045, npc=6195, name="Spitelash Siren", zone="Azshara"}}) -- Spellpower Goggles Xtreme Plus
S(23080, {{k="v", item=18656, cost=16000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Powerful Seaforium Charge
S(26426, {{k="d", item=21733, name="Winter Veil gift"}}) -- Large Blue Rocket Cluster
S(26427, {{k="d", item=21734, name="Winter Veil gift"}}) -- Large Green Rocket Cluster
S(26428, {{k="d", item=21735, name="Winter Veil gift"}}) -- Large Red Rocket Cluster
S(28327, {{k="q", item=22729, quest=9249, name="40 Tickets - Schematic: Steam Tonk Controller", zone="Darkmoon Faire"}}) -- Steam Tonk Controller
S(39895, {{k="v", item=32381, cost=12800, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true},
          {k="v", item=32381, cost=12800, npc=19661, name="Viggz Shinesparked", zone="Shattrath City", limited=true}}) -- Fused Wiring
S(23079, {{k="d", item=18655, name="Gordok Tribute", zone="Dire Maul"}}) -- Major Recombobulator
S(19795, {{k="t", cost=10000},
          {k="v", item=16047, cost=16000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Thorium Tube
S(19796, {{k="d", item=16048, npc=8897, name="Doomforge Craftsman", zone="Blackrock Depths"}}) -- Dark Iron Rifle
S(19814, {{k="v", item=16046, cost=16000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Masterwork Target Dummy
S(26443, {{k="q", item=21737, quest=8882, name="Cluster Launcher", zone="Moonglade"}}) -- Firework Cluster Launcher
S(19800, {{k="t", cost=10000},
          {k="w", item=16051}}) -- Thorium Shells
S(19799, {{k="d", item=16049, npc=8920, name="Weapon Technician", zone="Blackrock Depths"}}) -- Dark Iron Bomb
S(19815, {{k="v", item=16050, cost=20000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Delicate Arcanite Converter
S(19819, {{k="d", item=16052, npc=10426, name="Crimson Inquisitor", zone="Stratholme"}}) -- Voice Amplification Modulator
S(19825, {{k="t", cost=20000},
          {k="d", item=16053, npc=8900, name="Doomforge Arcanasmith", zone="Blackrock Depths"}}) -- Master Engineer's Goggles
S(23081, {{k="d", item=18657, npc=10264, name="Solakar Flamewreath", zone="Blackrock Spire"}}) -- Hyper-Radiant Flame Reflector
S(30303, {{k="t", cost=10000}}) -- Elemental Blasting Powder
S(30304, {{k="t", cost=10000}}) -- Fel Iron Casing
S(30305, {{k="t", cost=10000}}) -- Handful of Fel Iron Bolts
S(19830, {{k="d", item=16054, npc=7437, name="Cobalt Mageweaver", zone="Winterspring"}}) -- Arcanite Dragonling
S(19831, {{k="w", item=16055}}) -- Arcane Bomb
S(19833, {{k="d", item=16056, npc=8561, name="Mossflayer Shadowhunter", zone="Eastern Plaguelands"}}) -- Flawless Arcanite Rifle
S(22704, {{k="d", item=18235, name="Ground object in Golem Lord Argelmach's room", zone="Blackrock Depths"}}) -- Field Repair Bot 74A
S(22793, {{k="d", item=18290, zone="Molten Core"}}) -- Biznicks 247x128 Accurascope
S(22795, {{k="d", item=18292, zone="Molten Core"}}) -- Core Marksman Rifle
S(22797, {{k="d", item=18291, zone="Molten Core"}}) -- Force Reactive Disk
S(23082, {{k="d", item=18658, npc=10426, name="Crimson Inquisitor", zone="Stratholme"}}) -- Ultra-Flash Shadow Reflector
S(24356, {{k="v", item=20000, cost=135000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodvine Goggles
S(24357, {{k="v", item=20001, cost=56250, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodvine Lens
S(30310, {{k="t", cost=15000}}) -- Fel Iron Bomb
S(30548, {{k="q", item=23888, quest=9636, name="The Zapthrottle Mote Extractor!", zone="Zangarmarsh", faction="Alliance"},
          {k="q", item=23888, quest=9635, name="The Zapthrottle Mote Extractor!", zone="Zangarmarsh", faction="Horde"}}) -- Zapthrottle Mote Extractor
S(30346, {{k="t", cost=15000}}) -- Fel Iron Shells
S(30312, {{k="t", cost=20000}}) -- Fel Iron Musket
S(30306, {{k="t", cost=20000}}) -- Adamantite Frame
S(30348, {{k="v", item=23816, cost=32000, npc=16657, name="Feera", zone="The Exodar", limited=true, faction="Alliance"},
          {k="v", item=23816, cost=32000, npc=16782, name="Yatheon", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=23816, cost=40000, npc=18484, name="Wind Trader Lathrai", zone="Shattrath City", limited=true}}) -- Fel Iron Toolbox
S(30558, {{k="t", cost=25000}}) -- The Bigger One
S(30311, {{k="t", cost=25000}}) -- Adamantite Grenade
S(30337, {{k="w", item=23810}}) -- Crashin' Thrashin' Robot
S(30568, {{k="t", cost=22500}}) -- Gnomish Flame Turret
S(30551, {{k="w", item=23883},
          {k="d", item=35310, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Healing Potion Injector
S(30341, {{k="v", item=23811, cost=48000, npc=16657, name="Feera", zone="The Exodar", limited=true, faction="Alliance"},
          {k="v", item=23811, cost=48000, npc=16782, name="Yatheon", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=23811, cost=60000, npc=18484, name="Wind Trader Lathrai", zone="Shattrath City", limited=true},
          {k="v", item=23811, cost=60000, npc=19383, name="Captured Gnome", zone="Zangarmarsh", limited=true, faction="Horde"}}) -- White Smoke Flare
S(30344, {{k="v", item=23814, cost=48000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Green Smoke Flare
S(30347, {{k="v", item=23815, cost=51000, npc=16657, name="Feera", zone="The Exodar", limited=true, faction="Alliance"},
          {k="v", item=23815, cost=51000, npc=16782, name="Yatheon", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=23815, cost=60000, npc=18484, name="Wind Trader Lathrai", zone="Shattrath City", limited=true}}) -- Adamantite Shell Machine
S(32814, {{k="w", item=25887}}) -- Purple Smoke Flare
S(39971, {{k="t", cost=20000}}) -- Icy Blasting Primers
S(43676, {{k="d", item=33804, npc=19707, name="Sunfury Archer", zone="Netherstorm"}}) -- Adamantite Arrow Maker
S(30329, {{k="v", item=23807, cost=60000, npc=19351, name="Daggle Ironshaper", zone="Shadowmoon Valley", limited=true, faction="Alliance"},
          {k="v", item=23807, cost=48000, npc=19836, name="Mixie Farshot", zone="Hellfire Peninsula", limited=true, faction="Horde"}}) -- Adamantite Scope
S(39973, {{k="t", cost=50000}}) -- Frost Grenades
S(30560, {{k="t", cost=35000}}) -- Super Sapper Charge
S(30307, {{k="t", cost=50000}}) -- Hardened Adamantite Tube
S(30308, {{k="t", cost=50000}}) -- Khorium Power Core
S(30309, {{k="t", cost=50000}}) -- Felsteel Stabilizer
S(30316, {{k="v", item=23803, cost=48000, npc=18775, name="Lebowski", zone="Hellfire Peninsula", limited=true, faction="Alliance"},
          {k="v", item=23803, cost=48000, npc=19836, name="Mixie Farshot", zone="Hellfire Peninsula", limited=true, faction="Horde"}}) -- Cogspinner Goggles
S(30317, {{k="w", item=23804}}) -- Power Amplification Goggles
S(30569, {{k="t", cost=31500}}) -- Gnomish Poultryizer
S(30552, {{k="w", item=23884},
          {k="d", item=35311, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Mana Potion Injector
S(30547, {{k="v", item=23874, cost=64000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=23874, cost=64000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Elemental Seaforium Charge
S(36954, {{k="t"}}) -- Dimensional Ripper - Area 52
S(36955, {{k="t"}}) -- Ultrasafe Transporter - Toshley's Station
S(30313, {{k="v", item=23799, cost=64000, npc=16657, name="Feera", zone="The Exodar", limited=true, faction="Alliance"},
          {k="v", item=23799, cost=64000, npc=16782, name="Yatheon", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=23799, cost=64000, npc=19661, name="Viggz Shinesparked", zone="Shattrath City", limited=true}}) -- Adamantite Rifle
S(30318, {{k="v", item=23805, cost=64000, npc=18775, name="Lebowski", zone="Hellfire Peninsula", limited=true, faction="Alliance"},
          {k="v", item=23805, cost=80000, npc=19383, name="Captured Gnome", zone="Zangarmarsh", limited=true, faction="Horde"}}) -- Ultra-Spectropic Detection Goggles
S(30349, {{k="u"}}) -- Khorium Toolbox
S(30563, {{k="t", cost=50000}}) -- Goblin Rocket Launcher
S(30570, {{k="t", cost=45000}}) -- Nigh-Invulnerability Belt
S(40274, {{k="t", cost=50000}}) -- Furious Gizmatic Goggles
S(41311, {{k="t", cost=50000}}) -- Justicebringer 2000 Specs
S(41312, {{k="t", cost=50000}}) -- Tankatronic Goggles
S(41314, {{k="t", cost=50000}}) -- Surestrike Goggles v2.0
S(41315, {{k="t", cost=50000}}) -- Gadgetstorm Goggles
S(41316, {{k="t", cost=50000}}) -- Living Replicator Specs
S(41317, {{k="t", cost=50000}}) -- Deathblow X11 Goggles
S(41318, {{k="t", cost=50000}}) -- Wonderheal XT40 Shades
S(41319, {{k="t", cost=50000}}) -- Magnified Moon Specs
S(41320, {{k="t", cost=50000}}) -- Destruction Holo-gogs
S(41321, {{k="t", cost=50000}}) -- Powerheal 4000 Lens
S(44155, {{k="t", cost=120000}}) -- Flying Machine
S(30556, {{k="d", item=23887, npc=17796, name="Mekgineer Steamrigger", zone="The Steamvault"}}) -- Rocket Boots Xtreme
S(46697, {{k="d", item=35582, npc=19219, name="Mechano-Lord Capacitus", zone="The Mechanar"}}) -- Rocket Boots Xtreme Lite
S(30314, {{k="d", item=23800, npc=19960, name="Doomforge Engineer", zone="Blade's Edge Mountains"}}) -- Felsteel Boomstick
S(30325, {{k="d", item=23806, npc=19755, name="Mo'arg Weaponsmith", zone="Shadowmoon Valley"}}) -- Hyper-Vision Goggles
S(30332, {{k="d", item=23808, npc=20207, name="Sunfury Bowman", zone="Netherstorm"}}) -- Khorium Scope
S(44391, {{k="d", item=34114, npc=23385, name="Simon Unit", zone="Blade's Edge Mountains"}}) -- Field Repair Bot 110G
S(30565, {{k="t", cost=100000}}) -- Foreman's Enchanted Helmet
S(30566, {{k="t", cost=100000}}) -- Foreman's Reinforced Helmet
S(30574, {{k="t", cost=90000}}) -- Gnomish Power Goggles
S(30575, {{k="t", cost=90000}}) -- Gnomish Battle Goggles
S(41307, {{k="t", cost=50000}}) -- Gyro-balanced Khorium Destroyer
S(30315, {{k="w", item=23802}}) -- Ornate Khorium Rifle
S(30334, {{k="d", item=23809, npc=16152, name="Attumen the Huntsman", zone="Karazhan"}}) -- Stabilized Eternium Scope
S(44157, {{k="t", cost=180000}}) -- Turbo-Charged Flying Machine
S(46106, {{k="d", item=35191, zone="Sunwell Plateau"}}) -- Wonderheal XT68 Shades
S(46107, {{k="d", item=35187, zone="Sunwell Plateau"}}) -- Justicebringer 3000 Specs
S(46108, {{k="d", item=35189, zone="Sunwell Plateau"}}) -- Powerheal 9000 Lens
S(46109, {{k="d", item=35190, zone="Sunwell Plateau"}}) -- Hyper-Magnified Moon Specs
S(46110, {{k="d", item=35192, zone="Sunwell Plateau"}}) -- Primal-Attuned Goggles
S(46111, {{k="d", item=35186, zone="Sunwell Plateau"}}) -- Annihilator Holo-Gogs
S(46112, {{k="d", item=35193, zone="Sunwell Plateau"}}) -- Lightning Etched Specs
S(46113, {{k="d", item=35194, zone="Sunwell Plateau"}}) -- Surestrike Goggles v3.0
S(46114, {{k="d", item=35195, zone="Sunwell Plateau"}}) -- Mayhem Projection Goggles
S(46115, {{k="d", item=35196, zone="Sunwell Plateau"}}) -- Hard Khorium Goggles
S(46116, {{k="d", item=35197, zone="Sunwell Plateau"}}) -- Quad Deathblow X44 Goggles
-- DATA_END
