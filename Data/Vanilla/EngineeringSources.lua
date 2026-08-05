local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla Engineering recipes: where each recipe
-- is obtained. Keyed by crafting spell ID (same as EngineeringData.lua).
-- Generated from Wowhead classic data 2026-08-05.

local S = ns.NewSourceDB("ENGINEERING")

-- DATA_START (generated; do not hand-edit between markers)
S(3918, {{k="t"}}) -- Rough Blasting Powder
S(3919, {{k="t"}}) -- Rough Dynamite
S(3920, {{k="t"}}) -- Crafted Light Shot
S(3922, {{k="t", cost=115}}) -- Handful of Copper Bolts
S(3923, {{k="t", cost=130}}) -- Rough Copper Bomb
S(3924, {{k="t", cost=150}}) -- Copper Tube
S(3925, {{k="t", cost=150}}) -- Rough Boomstick
S(7430, {{k="t", cost=150}}) -- Arclight Spanner
S(3977, {{k="t", cost=200}}) -- Crude Scope
S(3926, {{k="t", cost=225}}) -- Copper Modulator
S(3928, {{k="w", item=4408}}) -- Mechanical Squirrel
S(3929, {{k="t", cost=250}}) -- Coarse Blasting Powder
S(3930, {{k="t", cost=250}}) -- Crafted Heavy Shot
S(3931, {{k="t", cost=250}}) -- Coarse Dynamite
S(3932, {{k="t", cost=300}}) -- Target Dummy
S(3973, {{k="t", cost=300}}) -- Silver Contact
S(3933, {{k="w", item=4409}}) -- Small Seaforium Charge
S(3934, {{k="t", cost=400}}) -- Flying Tiger Goggles
S(8334, {{k="t", cost=300}}) -- Practice Lock
S(8339, {{k="w", item=6716}}) -- EZ-Thro Dynamite
S(3936, {{k="t", cost=420}}) -- Deadly Blunderbuss
S(3937, {{k="t", cost=450}}) -- Large Copper Bomb
S(3938, {{k="t", cost=450}}) -- Bronze Tube
S(3978, {{k="t", cost=475}}) -- Standard Scope
S(3939, {{k="v", item=13309, cost=1000, npc=2682, name="Fradd Swiftgear", zone="Wetlands", limited=true, faction="Alliance"},
         {k="v", item=13309, cost=1000, npc=6730, name="Jinky Twizzlefixxit", zone="Thousand Needles", limited=true}}) -- Lovingly Crafted Boomstick
S(3940, {{k="w", item=4410}}) -- Shadow Goggles
S(3941, {{k="t", cost=500}}) -- Small Bronze Bomb
S(3942, {{k="t", cost=500}}) -- Whirring Bronze Gizmo
S(3944, {{k="d", item=4411, zone="Gnomeregan"}}) -- Flame Deflector
S(3945, {{k="t", cost=500}}) -- Heavy Blasting Powder
S(3946, {{k="t", cost=500}}) -- Heavy Dynamite
S(3947, {{k="t", cost=300}}) -- Crafted Solid Shot
S(9269, {{k="v", item=7560, cost=1200, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=7560, cost=1200, npc=6730, name="Jinky Twizzlefixxit", zone="Thousand Needles", limited=true},
         {k="d", item=7560, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Gnomish Universal Remote
S(26416, {{k="d", item=21724, name="Winter Veil gift"}}) -- Small Blue Rocket
S(26417, {{k="d", item=21725, name="Winter Veil gift"}}) -- Small Green Rocket
S(26418, {{k="d", item=21726, name="Winter Veil gift"}}) -- Small Red Rocket
S(3949, {{k="t", cost=550}}) -- Silver-plated Shotgun
S(6458, {{k="t", cost=400}}) -- Ornate Spyglass
S(3950, {{k="t", cost=600}}) -- Big Bronze Bomb
S(3952, {{k="v", item=14639, cost=1500, npc=2682, name="Fradd Swiftgear", zone="Wetlands", limited=true, faction="Alliance"},
         {k="v", item=14639, cost=1500, npc=2683, name="Namdo Bizzfizzle", limited=true, faction="Alliance"}}) -- Minor Recombobulator
S(3953, {{k="t", cost=600}}) -- Bronze Framework
S(3954, {{k="w", item=4412}}) -- Moonsight Rifle
S(3955, {{k="t", cost=750}}) -- Explosive Sheep
S(3956, {{k="t", cost=750}}) -- Green Tinted Goggles
S(9271, {{k="t", cost=500}}) -- Aquadynamic Fish Attractor
S(12584, {{k="t", cost=1000}}) -- Gold Power Core
S(23066, {{k="v", item=18647, cost=1800, npc=3413, name="Sovik", zone="Orgrimmar", limited=true, faction="Horde"}}) -- Red Firework
S(23067, {{k="v", item=18649, cost=1694, npc=1304, name="Darian Singh", zone="Stormwind City", limited=true, faction="Alliance"},
          {k="v", item=18649, cost=1800, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"}}) -- Blue Firework
S(23068, {{k="v", item=18648, cost=1800, npc=2838, name="Crazk Sparks", zone="Stranglethorn Vale", limited=true},
          {k="v", item=18648, cost=1800, npc=3495, name="Gagsprocket", zone="The Barrens", limited=true}}) -- Green Firework
S(3957, {{k="v", item=13308, cost=1800, npc=2684, name="Rizz Loosebolt", zone="Alterac Mountains", limited=true}}) -- Ice Deflector
S(3958, {{k="t", cost=800}}) -- Iron Strut
S(3959, {{k="d", item=4413, zone="Gnomeregan"}}) -- Discombobulator Ray
S(3960, {{k="w", item=4414}}) -- Portable Bronze Mortar
S(9273, {{k="v", item=7561, cost=2000, npc=3134, name="Kzixx", zone="Duskwood", limited=true},
         {k="v", item=7561, cost=2000, npc=3537, name="Zixil", zone="Hillsbrad Foothills", limited=true},
         {k="v", item=7561, cost=2000, npc=4086, name="Veenix", zone="Stonetalon Mountains", limited=true},
         {k="v", item=7561, cost=2000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="d", item=7561, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Goblin Jumper Cables
S(3961, {{k="t", cost=900}}) -- Gyrochronatom
S(3962, {{k="t", cost=1000}}) -- Iron Grenade
S(3963, {{k="t", cost=1000}}) -- Compact Harvest Reaper Kit
S(12585, {{k="t", cost=1000}}) -- Solid Blasting Powder
S(12586, {{k="t", cost=1000}}) -- Solid Dynamite
S(12587, {{k="w", item=10601}}) -- Bright-Eye Goggles
S(12590, {{k="t", cost=1000}}) -- Gyromatic Micro-Adjustor
S(26420, {{k="d", item=21727, name="Winter Veil gift"}}) -- Large Blue Rocket
S(26421, {{k="d", item=21728, name="Winter Veil gift"}}) -- Large Green Rocket
S(26422, {{k="d", item=21729, name="Winter Veil gift"}}) -- Large Red Rocket
S(3979, {{k="v", item=13310, cost=2000, npc=2685, name="Mazk Snipeshot", zone="Stranglethorn Vale", limited=true},
         {k="v", item=13310, cost=2000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true}}) -- Accurate Scope
S(3965, {{k="t", cost=1200}}) -- Advanced Target Dummy
S(3966, {{k="w", item=4415}}) -- Craftsman's Monocle
S(8243, {{k="d", item=6672, zone="Gnomeregan"},
         {k="q", item=6672, quest=1559, name="Flash Bomb Recipe", zone="Badlands"}}) -- Flash Bomb
S(3967, {{k="t", cost=1400}}) -- Big Iron Bomb
S(21940, {{k="d", item=17720, name="Winter Veil gift"}}) -- SnowMaster 9000
S(3968, {{k="w", item=4416}}) -- Goblin Land Mine
S(12589, {{k="t", cost=1300}}) -- Mithril Tube
S(3969, {{k="v", item=13311, cost=10000, npc=2687, name="Gnaz Blunderflame", zone="Stranglethorn Vale", limited=true}}) -- Mechanical Dragonling
S(3971, {{k="v", item=7742, cost=2400, npc=6777, name="Zan Shivsproket", zone="Alterac Mountains", limited=true},
         {k="d", item=7742, npc=7800, name="Mekgineer Thermaplugg", zone="Gnomeregan"}}) -- Gnomish Cloaking Device
S(3972, {{k="w", item=4417}}) -- Large Seaforium Charge
S(12591, {{k="t", cost=1500}}) -- Unstable Trigger
S(15255, {{k="t", cost=1500}}) -- Mechanical Repair Kit
S(23069, {{k="v", item=18650, cost=5000, npc=8131, name="Blizrik Buckshot", zone="Tanaris", limited=true}}) -- EZ-Thro Dynamite II
S(12594, {{k="t", cost=1600}}) -- Fire Goggles
S(12595, {{k="t", cost=1600}}) -- Mithril Blunderbuss
S(12715, {{k="t", cost=1000}}) -- Goblin Rocket Fuel Recipe
S(12717, {{k="t", cost=1500}}) -- Goblin Mining Helmet
S(12718, {{k="t", cost=1500}}) -- Goblin Construction Helmet
S(12760, {{k="t", cost=1500}}) -- Goblin Sapper Charge
S(12895, {{k="t", cost=1500}}) -- Inlaid Mithril Cylinder Plans
S(12899, {{k="t", cost=1500}}) -- Gnomish Shrink Ray
S(15628, {{k="d", item=11828, name="Goblin Engineer's Renewal Gift"}}) -- Pet Bombling
S(15633, {{k="d", item=11827, name="Gnome Engineer's Renewal Gift"}}) -- Lil' Smoky
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
S(8895, {{k="t", cost=2200},
         {k="d", item=7192, zone="Gnomeregan"}}) -- Goblin Rocket Boots
S(12615, {{k="w", item=10605}}) -- Spellpower Goggles Xtreme
S(12616, {{k="w", item=10606}}) -- Parachute Cloak
S(12716, {{k="u"}}) -- Goblin Mortar
S(12905, {{k="t", cost=2200}}) -- Gnomish Rocket Boots
S(26423, {{k="d", item=21730, name="Winter Veil gift"}}) -- Blue Rocket Cluster
S(26424, {{k="d", item=21731, name="Winter Veil gift"}}) -- Green Rocket Cluster
S(26425, {{k="d", item=21732, name="Winter Veil gift"}}) -- Red Rocket Cluster
S(26442, {{k="q", item=21738, quest=8877, name="Firework Launcher", zone="Moonglade"}}) -- Firework Launcher
S(12617, {{k="v", item=10607, cost=3600, npc=8678, name="Jubie Gadgetspring", zone="Azshara", limited=true}}) -- Deepdive Helmet
S(12618, {{k="t", cost=2200}}) -- Rose Colored Goggles
S(12755, {{k="t", cost=2400}}) -- Goblin Bomb Dispenser
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
S(12624, {{k="v", item=10609, cost=4000, npc=2688, name="Ruppo Zipcoil", zone="The Hinterlands", limited=true}}) -- Mithril Mechanical Dragonling
S(19567, {{k="t", cost=4000}}) -- Salt Shaker
S(19788, {{k="t", cost=4000}}) -- Dense Blasting Powder
S(23070, {{k="t", cost=5000}}) -- Dense Dynamite
S(23507, {{k="v", item=19027, cost=5000, npc=14637, name="Zorbin Fandazzle", zone="Feralas"}}) -- Snake Burst Firework
S(26011, {{k="q", quest=8798, name="A Yeti of Your Own", zone="Winterspring"}}) -- Tranquil Mechanical Yeti
S(19790, {{k="v", item=16041, cost=12000, npc=3413, name="Sovik", zone="Orgrimmar", limited=true, faction="Horde"},
          {k="v", item=16041, cost=12000, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"}}) -- Thorium Grenade
S(19791, {{k="v", item=16042, cost=12000, npc=3413, name="Sovik", zone="Orgrimmar", limited=true, faction="Horde"},
          {k="v", item=16042, cost=12000, npc=5175, name="Gearcutter Cogspinner", zone="Ironforge", limited=true, faction="Alliance"}}) -- Thorium Widget
S(19792, {{k="w", item=16043}}) -- Thorium Rifle
S(23071, {{k="v", item=18651, cost=12000, npc=2685, name="Mazk Snipeshot", zone="Stranglethorn Vale", limited=true}}) -- Truesilver Transformer
S(23077, {{k="v", item=18652, cost=12000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Gyrofreeze Ice Reflector
S(23129, {{k="d", item=18661, npc=8920, name="Weapon Technician", zone="Blackrock Depths"}}) -- World Enlarger
S(19793, {{k="w", item=16044}}) -- Lifelike Mechanical Toad
S(23078, {{k="d", item=18653, npc=9499, name="Plugger Spazzring", zone="Blackrock Depths"}}) -- Goblin Jumper Cables XL
S(23096, {{k="d", item=18654, npc=8920, name="Weapon Technician", zone="Blackrock Depths"}}) -- Alarm-O-Bot
S(19794, {{k="d", item=16045, npc=6195, name="Spitelash Siren", zone="Azshara"}}) -- Spellpower Goggles Xtreme Plus
S(19795, {{k="v", item=16047, cost=16000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Thorium Tube
S(19796, {{k="d", item=16048, npc=8897, name="Doomforge Craftsman", zone="Blackrock Depths"}}) -- Dark Iron Rifle
S(19814, {{k="v", item=16046, cost=16000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Masterwork Target Dummy
S(23079, {{k="d", item=18655, name="Gordok Tribute", zone="Dire Maul"}}) -- Major Recombobulator
S(23080, {{k="v", item=18656, cost=16000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Powerful Seaforium Charge
S(26426, {{k="d", item=21733, name="Winter Veil gift"}}) -- Large Blue Rocket Cluster
S(26427, {{k="d", item=21734, name="Winter Veil gift"}}) -- Large Green Rocket Cluster
S(26428, {{k="d", item=21735, name="Winter Veil gift"}}) -- Large Red Rocket Cluster
S(26443, {{k="q", item=21737, quest=8882, name="Cluster Launcher", zone="Moonglade"}}) -- Firework Cluster Launcher
S(28327, {{k="q", item=22729, quest=9249, name="40 Tickets - Schematic: Steam Tonk Controller", zone="Darkmoon Faire"}}) -- Steam Tonk Controller
S(19799, {{k="d", item=16049, npc=8920, name="Weapon Technician", zone="Blackrock Depths"}}) -- Dark Iron Bomb
S(19800, {{k="w", item=16051}}) -- Thorium Shells
S(19815, {{k="v", item=16050, cost=20000, npc=11185, name="Xizzer Fizzbolt", zone="Winterspring", limited=true}}) -- Delicate Arcanite Converter
S(23486, {{k="t"}}) -- Dimensional Ripper - Everlook
S(23489, {{k="t"}}) -- Ultrasafe Transporter - Gadgetzan
S(19819, {{k="d", item=16052, npc=10426, name="Crimson Inquisitor", zone="Stratholme"}}) -- Voice Amplification Modulator
S(19825, {{k="d", item=16053, npc=8900, name="Doomforge Arcanasmith", zone="Blackrock Depths"}}) -- Master Engineer's Goggles
S(23081, {{k="d", item=18657, npc=10264, name="Solakar Flamewreath", zone="Blackrock Spire"}}) -- Hyper-Radiant Flame Reflector
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
-- DATA_END
