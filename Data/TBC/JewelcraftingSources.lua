local ADDON_NAME, ns = ...

-- Acquisition sources for TBC Jewelcrafting recipes: where each recipe is
-- obtained. Keyed by crafting spell ID (same as JewelcraftingData.lua).
-- Generated from Wowhead tbc data 2026-08-05.

local S = ns.NewSourceDB("JEWELCRAFTING")

-- DATA_START (generated; do not hand-edit between markers)
S(25255, {{k="t"}}) -- Delicate Copper Wire
S(25493, {{k="t"}}) -- Braided Copper Ring
S(26925, {{k="t"}}) -- Woven Copper Ring
S(32259, {{k="t"}}) -- Rough Stone Statue
S(26926, {{k="t", cost=50}}) -- Heavy Copper Ring
S(32178, {{k="t", cost=100}}) -- Malachite Pendant
S(32179, {{k="t", cost=100}}) -- Tigerseye Band
S(25283, {{k="t", cost=100}}) -- Inlaid Malachite Ring
S(26928, {{k="t", cost=100}}) -- Ornate Tigerseye Necklace
S(25278, {{k="t", cost=200}}) -- Bronze Setting
S(25280, {{k="t", cost=200}}) -- Elegant Silver Ring
S(25490, {{k="t", cost=300}}) -- Solid Bronze Ring
S(26927, {{k="t", cost=300}}) -- Thick Bronze Necklace
S(32801, {{k="t", cost=200}}) -- Coarse Stone Statue
S(25284, {{k="t", cost=400}}) -- Simple Pearl Ring
S(37818, {{k="t", cost=500}}) -- Bronze Band of Force
S(25287, {{k="t", cost=400}}) -- Gloom Band
S(36523, {{k="t", cost=600}}) -- Brilliant Necklace
S(25317, {{k="t", cost=600}}) -- Ring of Silver Might
S(38175, {{k="t", cost=650}}) -- Bronze Torc
S(25305, {{k="t", cost=1000}}) -- Heavy Silver Ring
S(25318, {{k="t", cost=800}}) -- Ring of Twilight Shadows
S(36524, {{k="t", cost=800}}) -- Heavy Jade Ring
S(25339, {{k="v", item=20854, cost=1800, npc=4229, name="Mythrin'dir", zone="Darnassus", limited=true, faction="Alliance"},
          {k="v", item=20854, cost=1440, npc=4561, name="Daniel Bartlett", zone="Undercity", limited=true, faction="Horde"},
          {k="v", item=20854, cost=1440, npc=16624, name="Gelanthis", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=20854, cost=1530, npc=17512, name="Arred", zone="The Exodar", limited=true, faction="Alliance"}}) -- Amulet of the Moon
S(25498, {{k="t", cost=600}}) -- Barbaric Iron Collar
S(32807, {{k="t", cost=600}}) -- Heavy Stone Statue
S(25321, {{k="t", cost=1500}}) -- Moonsoul Crown
S(25610, {{k="v", item=20970, cost=1500, npc=1448, name="Neal Allen", zone="Wetlands", limited=true, faction="Alliance"},
          {k="v", item=20970, cost=1500, npc=4877, name="Jandia", zone="Thousand Needles", limited=true, faction="Horde"}}) -- Pendant of the Agate Shield
S(25323, {{k="v", item=20855, cost=1200, npc=3954, name="Dalria", zone="Ashenvale", limited=true, faction="Alliance"},
          {k="v", item=20855, cost=1500, npc=3499, name="Ranik", zone="The Barrens", limited=true}}) -- Wicked Moonstone Ring
S(25612, {{k="v", item=20971, cost=1500, npc=2381, name="Micha Yance", zone="Hillsbrad Foothills", limited=true, faction="Alliance"},
          {k="v", item=20971, cost=1500, npc=2393, name="Christoph Jeffcoat", zone="Hillsbrad Foothills", limited=true, faction="Horde"}}) -- Heavy Iron Knuckles
S(25613, {{k="t", cost=1200}}) -- Golden Dragon Ring
S(25320, {{k="v", item=20856, cost=1500, npc=1286, name="Edna Mullby", zone="Stormwind City", faction="Alliance"},
          {k="v", item=20856, cost=1500, npc=17512, name="Arred", zone="The Exodar", faction="Alliance"},
          {k="v", item=20856, cost=1500, npc=3367, name="Felika", zone="Orgrimmar", limited=true, faction="Horde"},
          {k="v", item=20856, cost=1500, npc=16624, name="Gelanthis", zone="Silvermoon City", limited=true, faction="Horde"}}) -- Heavy Golden Necklace of Battle
S(25615, {{k="t", cost=1500}}) -- Mithril Filigree
S(25617, {{k="v", item=20973, cost=2000, npc=2381, name="Micha Yance", zone="Hillsbrad Foothills", limited=true, faction="Alliance"},
          {k="v", item=20973, cost=2000, npc=9636, name="Kireena", zone="Desolace", limited=true, faction="Horde"}}) -- Blazing Citrine Ring
S(25618, {{k="w", item=20974}}) -- Jade Pendant of Blasting
S(25619, {{k="v", item=20975, cost=2500, npc=5163, name="Burbik Gearspanner", zone="Wailing Caverns"},
          {k="v", item=20975, cost=2500, npc=17512, name="Arred", zone="The Exodar", faction="Alliance"},
          {k="v", item=20975, cost=2500, npc=4775, name="Felicia Doan", zone="Undercity", limited=true, faction="Horde"},
          {k="v", item=20975, cost=2500, npc=16624, name="Gelanthis", zone="Silvermoon City", limited=true, faction="Horde"}}) -- The Jade Eye
S(25620, {{k="t", cost=2000}}) -- Engraved Truesilver Ring
S(32808, {{k="t", cost=2000}}) -- Solid Stone Statue
S(25621, {{k="t", cost=2000}}) -- Citrine Ring of Rapid Healing
S(34955, {{k="t", cost=2500}}) -- Golden Ring of Power
S(25622, {{k="w", item=20976}}) -- Citrine Pendant of Golden Healing
S(26872, {{k="t", cost=2500}}) -- Figurine - Jade Owl
S(26873, {{k="w", item=21940}}) -- Figurine - Golden Hare
S(34959, {{k="t", cost=3000}}) -- Truesilver Commander's Ring
S(26874, {{k="t", cost=5000}}) -- Aquamarine Signet
S(26875, {{k="v", item=21941, cost=5000, npc=989, name="Banalash", zone="Swamp of Sorrows", limited=true, faction="Horde"},
          {k="v", item=21941, cost=5000, npc=4897, name="Helenia Olden", zone="Dustwallow Marsh", limited=true, faction="Alliance"}}) -- Figurine - Black Pearl Panther
S(26876, {{k="t", cost=3000}}) -- Aquamarine Pendant of the Warrior
S(26878, {{k="v", item=21942, cost=6000, npc=2810, name="Hammon Karwn", zone="Arathi Highlands", limited=true, faction="Alliance"},
          {k="v", item=21942, cost=6000, npc=2821, name="Keena", zone="Arathi Highlands", limited=true, faction="Horde"}}) -- Ruby Crown of Restoration
S(26880, {{k="t", cost=3500}}) -- Thorium Setting
S(26881, {{k="v", item=21943, cost=6000, npc=1148, name="Nerrist", zone="Stranglethorn Vale", limited=true, faction="Horde"},
          {k="v", item=21943, cost=6000, npc=4897, name="Helenia Olden", zone="Dustwallow Marsh", limited=true, faction="Alliance"}}) -- Figurine - Truesilver Crab
S(32809, {{k="t", cost=3500}}) -- Dense Stone Statue
S(36525, {{k="t", cost=4000}}) -- Red Ring of Destruction
S(26882, {{k="w", item=21944}}) -- Figurine - Truesilver Boar
S(26883, {{k="t", cost=4000}}) -- Ruby Pendant of Fire
S(26885, {{k="t", cost=5000}}) -- Truesilver Healing Ring
S(26887, {{k="w", item=21945}}) -- The Aquamarine Ward
S(26896, {{k="w", item=21947}}) -- Gem Studded Band
S(26897, {{k="v", item=21948, cost=7500, npc=5163, name="Burbik Gearspanner", zone="Wailing Caverns"},
          {k="v", item=21948, cost=7500, npc=17512, name="Arred", zone="The Exodar", faction="Alliance"},
          {k="v", item=21948, cost=7500, npc=8363, name="Shadi Mistrunner", zone="Thunder Bluff", limited=true, faction="Horde"},
          {k="v", item=21948, cost=7500, npc=16624, name="Gelanthis", zone="Silvermoon City", limited=true, faction="Horde"}}) -- Opal Necklace of Impact
S(26900, {{k="w", item=21949}}) -- Figurine - Ruby Serpent
S(26902, {{k="t", cost=10000}}) -- Simple Opal Ring
S(36526, {{k="t", cost=10000}}) -- Diamond Focus Ring
S(26903, {{k="t", cost=10000}}) -- Sapphire Signet
S(26906, {{k="v", item=21952, cost=10000, npc=15179, name="Mishta", zone="Silithus", limited=true}}) -- Emerald Crown of Destruction
S(26907, {{k="t", cost=10000}}) -- Onslaught Ring
S(26908, {{k="t", cost=12000}}) -- Sapphire Pendant of Winter Night
S(34960, {{k="t", cost=10000}}) -- Glowing Thorium Band
S(26909, {{k="w", item=21953}}) -- Figurine - Emerald Owl
S(26910, {{k="v", item=21954, cost=10000, npc=12941, name="Jase Farlane", zone="Eastern Plaguelands", limited=true}}) -- Ring of Bitter Shadows
S(26911, {{k="t", cost=15000}}) -- Living Emerald Pendant
S(34961, {{k="t", cost=10000}}) -- Emerald Lion Ring
S(26912, {{k="d", item=21955, npc=9736, name="Quartermaster Zigris", zone="Blackrock Spire"}}) -- Figurine - Black Diamond Crab
S(26914, {{k="d", item=21956, npc=8983, name="Golem Lord Argelmach", zone="Blackrock Depths"}}) -- Figurine - Dark Iron Scorpid
S(28903, {{k="v", item=23130, cost=40000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23130, cost=40000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Teardrop Blood Garnet
S(28910, {{k="v", item=23135, cost=40000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23135, cost=40000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Inscribed Flame Spessarite
S(28916, {{k="v", item=23140, cost=40000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23140, cost=40000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Radiant Deep Peridot
S(28925, {{k="v", item=23144, cost=40000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23144, cost=40000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Glowing Shadow Draenite
S(28938, {{k="v", item=23148, cost=40000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23148, cost=40000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Brilliant Golden Draenite
S(28950, {{k="v", item=23152, cost=40000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23152, cost=40000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Solid Azure Moonstone
S(26915, {{k="v", item=21957, cost=13500, npc=11189, name="Qia", zone="Winterspring", limited=true}}) -- Necklace of the Diamond Tower
S(28905, {{k="v", item=23131, cost=50000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23131, cost=50000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Bold Blood Garnet
S(28912, {{k="v", item=23136, cost=50000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=23136, cost=50000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Luminous Flame Spessarite
S(28917, {{k="v", item=23141, cost=50000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23141, cost=50000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Jagged Deep Peridot
S(28927, {{k="v", item=23145, cost=50000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Royal Shadow Draenite
S(28944, {{k="v", item=23149, cost=50000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Gleaming Golden Draenite
S(28953, {{k="v", item=23153, cost=50000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23153, cost=50000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Sparkling Azure Moonstone
S(34590, {{k="v", item=28596, cost=50000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=28596, cost=50000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Bright Blood Garnet
S(26916, {{k="t", cost=20000}}) -- Band of Natural Fire
S(31048, {{k="t", cost=20000}}) -- Fel Iron Blood Ring
S(31049, {{k="t", cost=20000}}) -- Golden Draenite Ring
S(26918, {{k="u"}}) -- Arcanite Sword Pendant
S(28906, {{k="v", item=23133, cost=60000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Runed Blood Garnet
S(28914, {{k="v", item=23137, cost=60000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23137, cost=60000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Glinting Flame Spessarite
S(28918, {{k="v", item=31359, cost=60000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23142, cost=60000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Enduring Deep Peridot
S(28933, {{k="v", item=23146, cost=60000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=23146, cost=60000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Shifting Shadow Draenite
S(28947, {{k="v", item=23150, cost=60000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=23150, cost=60000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Thick Golden Draenite
S(28955, {{k="w", item=23154}}) -- Stormy Azure Moonstone
S(31050, {{k="t", cost=25000}}) -- Azure Moonstone Ring
S(26920, {{k="u"}}) -- Blood Crown
S(28907, {{k="v", item=23134, cost=60000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=23134, cost=60000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Delicate Blood Garnet
S(28915, {{k="v", item=23138, cost=60000, npc=21655, name="Nakodu", zone="Shattrath City"}}) -- Potent Flame Spessarite
S(28924, {{k="v", item=23143, cost=60000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Dazzling Deep Peridot
S(28936, {{k="v", item=23147, cost=60000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23147, cost=60000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Sovereign Shadow Draenite
S(28948, {{k="v", item=23151, cost=60000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=23151, cost=60000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Rigid Golden Draenite
S(28957, {{k="v", item=23155, cost=60000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=23155, cost=60000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Lustrous Azure Moonstone
S(34069, {{k="v", item=28291, cost=60000, npc=18751, name="Kalaen", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=28291, cost=60000, npc=18774, name="Tatiana", zone="Hellfire Peninsula", faction="Alliance"}}) -- Smooth Golden Draenite
S(38068, {{k="t", cost=20000}}) -- Mercurial Adamantite
S(39451, {{k="d", item=31870, zone="Blade's Edge Mountains"}}) -- Great Golden Draenite
S(39455, {{k="d", item=31871, zone="Blade's Edge Mountains"}}) -- Balanced Shadow Draenite
S(39458, {{k="d", item=31872, zone="Blade's Edge Mountains"}}) -- Infused Shadow Draenite
S(39466, {{k="d", item=31873, zone="Blade's Edge Mountains"}}) -- Veiled Flame Spessarite
S(39467, {{k="d", item=31874, zone="Blade's Edge Mountains"}}) -- Wicked Flame Spessarite
S(41414, {{k="t", cost=10000}}) -- Brilliant Pearl Band
S(41420, {{k="t", cost=8500}}) -- Purified Jaggal Pearl
S(41415, {{k="t", cost=10000}}) -- The Black Pearl
S(31051, {{k="t", cost=30000}}) -- Thick Adamantite Necklace
S(31052, {{k="t", cost=30000}}) -- Heavy Adamantite Ring
S(40514, {{k="t", cost=8500}}) -- Necklace of the Deep
S(31058, {{k="w", item=24163}}) -- Heavy Felsteel Ring
S(31053, {{k="d", item=24158, npc=19826, name="Dark Conclave Shadowmancer", zone="Shadowmoon Valley"}}) -- Khorium Band of Shadows
S(31084, {{k="w", item=24193}}) -- Bold Living Ruby
S(31085, {{k="w", item=24194}}) -- Delicate Living Ruby
S(31087, {{k="w", item=24195}}) -- Teardrop Living Ruby
S(31088, {{k="w", item=24196},
          {k="d", item=35305, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Runed Living Ruby
S(31089, {{k="w", item=24192},
          {k="d", item=35306, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Bright Living Ruby
S(31090, {{k="w", item=24197}}) -- Subtle Living Ruby
S(31091, {{k="w", item=24198}}) -- Flashing Living Ruby
S(31092, {{k="w", item=24199},
          {k="d", item=35304, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Solid Star of Elune
S(31094, {{k="w", item=24201}}) -- Lustrous Star of Elune
S(31095, {{k="w", item=24202}}) -- Stormy Star of Elune
S(31096, {{k="w", item=24203}}) -- Brilliant Dawnstone
S(31097, {{k="w", item=24204}}) -- Smooth Dawnstone
S(31098, {{k="w", item=24205},
          {k="d", item=35307, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"}}) -- Rigid Dawnstone
S(31099, {{k="w", item=24206}}) -- Gleaming Dawnstone
S(31100, {{k="w", item=24207}}) -- Thick Dawnstone
S(31101, {{k="v", item=24208, cost=120000, npc=21474, name="Coreiel", zone="Nagrand", limited=true, faction="Horde"},
          {k="v", item=24208, cost=120000, npc=21485, name="Aldraan", zone="Nagrand", limited=true, faction="Alliance"}}) -- Mystic Dawnstone
S(31102, {{k="w", item=24209}}) -- Sovereign Nightseye
S(31103, {{k="w", item=24210}}) -- Shifting Nightseye
S(31104, {{k="w", item=24211}}) -- Glowing Nightseye
S(31105, {{k="w", item=24212}}) -- Royal Nightseye
S(31106, {{k="w", item=24213}}) -- Inscribed Noble Topaz
S(31107, {{k="w", item=24214}}) -- Potent Noble Topaz
S(31108, {{k="w", item=24215}}) -- Luminous Noble Topaz
S(31109, {{k="w", item=24216}}) -- Glinting Noble Topaz
S(31110, {{k="w", item=24217}}) -- Enduring Talasite
S(31111, {{k="w", item=24218}}) -- Radiant Talasite
S(31112, {{k="w", item=24219}}) -- Dazzling Talasite
S(31113, {{k="w", item=24220}}) -- Jagged Talasite
S(31149, {{k="w", item=24200}}) -- Sparkling Star of Elune
S(39452, {{k="w", item=31875}}) -- Great Dawnstone
S(39462, {{k="w", item=31877}}) -- Infused Nightseye
S(39463, {{k="w", item=31876}}) -- Balanced Nightseye
S(39470, {{k="w", item=31878}}) -- Veiled Noble Topaz
S(39471, {{k="w", item=31879}}) -- Wicked Noble Topaz
S(41429, {{k="t", cost=10000}}) -- Purified Shadow Pearl
S(43493, {{k="v", item=33783, npc=18821, name="Quartermaster Jaffrey Noreliqe", zone="Nagrand", faction="Horde"},
          {k="v", item=33783, npc=18822, name="Quartermaster Davian Vaclav", zone="Nagrand", faction="Alliance"}}) -- Steady Talasite
S(46403, {{k="v", item=35322, cost=108000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35322, cost=114000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Quick Dawnstone
S(46404, {{k="v", item=35323, cost=108000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35323, cost=114000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Reckless Noble Topaz
S(46405, {{k="v", item=35325, cost=108000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35325, cost=114000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Forceful Talasite
S(46803, {{k="v", item=35708, cost=120000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Regal Nightseye
S(47280, {{k="t", cost=30000}}) -- Brilliant Glass
S(31054, {{k="d", item=24159, npc=17722, name="Coilfang Sorceress", zone="The Steamvault"}}) -- Khorium Band of Frost
S(31055, {{k="d", item=24160, npc=18472, name="Darkweaver Syth", zone="Sethekk Halls"}}) -- Khorium Inferno Band
S(31060, {{k="w", item=24164}}) -- Delicate Eternium Ring
S(31067, {{k="w", item=24166}}) -- Thick Felsteel Necklace
S(31068, {{k="w", item=24167}}) -- Living Ruby Pendant
S(31056, {{k="d", item=24161, npc=19984, name="Vekh'nir Dreadhawk", zone="Blade's Edge Mountains"}}) -- Khorium Band of Leaves
S(31062, {{k="v", item=24174, cost=120000, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Pendant of Frozen Flame
S(31063, {{k="v", item=24175, cost=120000, npc=21655, name="Nakodu", zone="Shattrath City"}}) -- Pendant of Thawing
S(31064, {{k="v", item=24176, cost=120000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Pendant of Withering
S(31065, {{k="v", item=24177, cost=120000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Pendant of Shadow's End
S(31066, {{k="v", item=24178, cost=102000, npc=23007, name="Paulsta'ats", zone="Nagrand"},
          {k="v", item=24178, cost=96000, npc=20242, name="Karaaz", zone="Netherstorm"}}) -- Pendant of the Null Rune
S(31070, {{k="w", item=24168}}) -- Braided Eternium Chain
S(31071, {{k="w", item=24169}}) -- Eye of the Night
S(37855, {{k="v", item=30826, cost=120000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Ring of Arcane Shielding
S(42558, {{k="v", item=33305, cost=120000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=33305, cost=120000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Don Julio's Heart
S(42588, {{k="v", item=33155, cost=120000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Kailee's Rose
S(42589, {{k="v", item=33156, cost=120000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=33156, cost=120000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Crimson Sun
S(42590, {{k="v", item=33157, cost=120000, npc=21655, name="Nakodu", zone="Shattrath City"}}) -- Falling Star
S(42591, {{k="v", item=33158, cost=120000, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Stone of Blades
S(42592, {{k="v", item=33159, cost=120000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Blood of Amber
S(42593, {{k="v", item=33160, cost=120000, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Facet of Eternity
S(31057, {{k="d", item=24162, npc=18866, name="Mageslayer", zone="Netherstorm"}}) -- Arcane Khorium Band
S(31061, {{k="w", item=24165}}) -- Blazing Eternium Band
S(31072, {{k="w", item=24170}}) -- Embrace of the Dawn
S(31076, {{k="w", item=24171}}) -- Chain of the Twilight Owl
S(32866, {{k="v", item=25902, cost=120000, npc=17518, name="Ythyar", zone="Karazhan"}}) -- Powerful Earthstorm Diamond
S(32867, {{k="v", item=25903, cost=120000, npc=17518, name="Ythyar", zone="Karazhan"}}) -- Bracing Earthstorm Diamond
S(32868, {{k="w", item=25905}}) -- Tenacious Earthstorm Diamond
S(32869, {{k="w", item=25906}}) -- Brutal Earthstorm Diamond
S(32870, {{k="v", item=25904, cost=120000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Insightful Earthstorm Diamond
S(32871, {{k="w", item=25907}}) -- Destructive Skyfire Diamond
S(32872, {{k="w", item=25909}}) -- Mystical Skyfire Diamond
S(32873, {{k="v", item=25908, cost=120000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=25908, cost=120000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Swift Skyfire Diamond
S(32874, {{k="v", item=25910, cost=120000, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Enigmatic Skyfire Diamond
S(39961, {{k="v", item=32412, cost=120000, npc=20242, name="Karaaz", zone="Netherstorm"},
          {k="v", item=32412, cost=120000, npc=23007, name="Paulsta'ats", zone="Nagrand"}}) -- Relentless Earthstorm Diamond
S(39963, {{k="w", item=32411}}) -- Thundering Skyfire Diamond
S(41418, {{k="t", cost=30000}}) -- Crown of the Sea Witch
S(44794, {{k="d", item=34689, npc=19768, name="Coilskar Siren", zone="Shadowmoon Valley"}}) -- Chaotic Skyfire Diamond
S(46122, {{k="d", item=35198, zone="Sunwell Plateau"}}) -- Loop of Forged Power
S(46123, {{k="d", item=35199, zone="Sunwell Plateau"}}) -- Ring of Flowing Life
S(46124, {{k="d", item=35200, zone="Sunwell Plateau"}}) -- Hard Khorium Band
S(46125, {{k="d", item=35201, zone="Sunwell Plateau"}}) -- Pendant of Sunfire
S(46126, {{k="d", item=35202, zone="Sunwell Plateau"}}) -- Amulet of Flowing Life
S(46127, {{k="d", item=35203, zone="Sunwell Plateau"}}) -- Hard Khorium Choker
S(31077, {{k="d", item=24172, npc=18422, name="Sunseeker Botanist", zone="The Botanica"}}) -- Coronet of the Verdant Flame
S(31078, {{k="d", item=24173, npc=18096, name="Epoch Hunter", zone="Old Hillsbrad Foothills"}}) -- Circlet of Arcane Might
S(31079, {{k="v", item=24179, cost=102000, npc=21655, name="Nakodu", zone="Shattrath City"}}) -- Figurine - Felsteel Boar
S(31080, {{k="v", item=24180, cost=102000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"},
          {k="v", item=31358, cost=120000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"}}) -- Figurine - Dawnstone Crab
S(31081, {{k="v", item=24181, cost=102000, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Figurine - Living Ruby Serpent
S(31082, {{k="v", item=24182, cost=102000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Figurine - Talasite Owl
S(31083, {{k="v", item=24183, cost=96000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Figurine - Nightseye Panther
S(46597, {{k="v", item=35502, cost=150000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Eternal Earthstorm Diamond
S(46601, {{k="v", item=35505, cost=150000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Ember Skyfire Diamond
S(38503, {{k="v", item=31401, cost=120000, npc=18255, name="Apprentice Darius", zone="Deadwind Pass"}}) -- The Frozen Eye
S(38504, {{k="v", item=31402, cost=120000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- The Natural Ward
S(39705, {{k="v", item=32274, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35244, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Bold Crimson Spinel
S(39706, {{k="v", item=32277, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35246, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Delicate Crimson Spinel
S(39710, {{k="v", item=32281, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35250, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Teardrop Crimson Spinel
S(39711, {{k="v", item=32282, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35248, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Runed Crimson Spinel
S(39712, {{k="v", item=32283, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35245, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Bright Crimson Spinel
S(39713, {{k="v", item=32284, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35249, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Subtle Crimson Spinel
S(39714, {{k="v", item=35247, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="d", item=32285, zone="Hyjal Summit"}}) -- Flashing Crimson Spinel
S(39715, {{k="v", item=32286, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35263, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35263, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Solid Empyrean Sapphire
S(39716, {{k="v", item=32287, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35264, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35264, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Sparkling Empyrean Sapphire
S(39717, {{k="v", item=32288, cost=51000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35262, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35262, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Lustrous Empyrean Sapphire
S(39718, {{k="v", item=35265, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35265, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="d", item=32289, zone="Hyjal Summit"}}) -- Stormy Empyrean Sapphire
S(39719, {{k="v", item=32290, cost=51000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35255, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Brilliant Lionseye
S(39720, {{k="v", item=35260, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=32291, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35260, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Smooth Lionseye
S(39721, {{k="v", item=32292, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35259, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35259, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Rigid Lionseye
S(39722, {{k="v", item=32293, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35256, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35256, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Gleaming Lionseye
S(39723, {{k="v", item=32294, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35261, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35261, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"}}) -- Thick Lionseye
S(39724, {{k="v", item=35258, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35258, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="d", item=32295, zone="Hyjal Summit"}}) -- Mystic Lionseye
S(39725, {{k="v", item=35257, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35257, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="d", item=32296, zone="Hyjal Summit"}}) -- Great Lionseye
S(39727, {{k="v", item=35243, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="d", item=32297, zone="Hyjal Summit"}}) -- Sovereign Shadowsong Amethyst
S(39728, {{k="v", item=35242, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="d", item=32298, zone="Hyjal Summit"}}) -- Shifting Shadowsong Amethyst
S(39729, {{k="v", item=32299, cost=51000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35238, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Balanced Shadowsong Amethyst
S(39730, {{k="v", item=32300, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35240, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Infused Shadowsong Amethyst
S(39731, {{k="v", item=32301, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35239, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Glowing Shadowsong Amethyst
S(39732, {{k="v", item=32302, cost=48000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35241, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Royal Shadowsong Amethyst
S(39733, {{k="v", item=35267, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35267, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="d", item=32303, zone="Hyjal Summit"}}) -- Inscribed Pyrestone
S(39734, {{k="v", item=35269, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35269, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="v", item=32304, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"}}) -- Potent Pyrestone
S(39735, {{k="v", item=35268, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35268, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="v", item=32305, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"}}) -- Luminous Pyrestone
S(39736, {{k="v", item=35266, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35266, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="v", item=32306, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"}}) -- Glinting Pyrestone
S(39737, {{k="v", item=35270, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35270, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="d", item=32307, zone="Hyjal Summit"}}) -- Veiled Pyrestone
S(39738, {{k="v", item=35271, cost=450000, npc=27666, name="Ontuvo", zone="Shattrath City"},
          {k="v", item=35271, cost=475000, npc=25950, name="Shaani", zone="Isle of Quel'Danas"},
          {k="v", item=32308, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"}}) -- Wicked Pyrestone
S(39739, {{k="v", item=32309, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35252, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Enduring Seaspray Emerald
S(39740, {{k="v", item=32310, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35254, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Radiant Seaspray Emerald
S(39741, {{k="v", item=32311, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35251, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Dazzling Seaspray Emerald
S(39742, {{k="v", item=32312, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35253, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Jagged Seaspray Emerald
S(46775, {{k="v", item=35695, cost=250000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Figurine - Empyrean Tortoise
S(46776, {{k="v", item=35696, cost=250000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Figurine - Khorium Boar
S(46777, {{k="v", item=35697, cost=250000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Figurine - Crimson Serpent
S(46778, {{k="v", item=35698, cost=250000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Figurine - Shadowsong Panther
S(46779, {{k="v", item=35699, cost=250000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"}}) -- Figurine - Seaspray Albatross
S(47053, {{k="v", item=35765, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35769, cost=500000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"},
          {k="v", item=35769, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Forceful Seaspray Emerald
S(47054, {{k="v", item=35764, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35766, cost=500000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"},
          {k="v", item=35766, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Steady Seaspray Emerald
S(47055, {{k="v", item=35762, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35767, cost=500000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"},
          {k="v", item=35767, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Reckless Pyrestone
S(47056, {{k="v", item=35763, cost=60000, npc=23437, name="Indormi", zone="Hyjal Summit"},
          {k="v", item=35768, cost=500000, npc=25032, name="Eldara Dawnrunner", zone="Isle of Quel'Danas"},
          {k="v", item=35768, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Quick Lionseye
S(48789, {{k="v", item=37504, cost=500000, npc=27666, name="Ontuvo", zone="Shattrath City"}}) -- Purified Shadowsong Amethyst
-- DATA_END
