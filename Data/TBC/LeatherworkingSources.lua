local ADDON_NAME, ns = ...

-- Acquisition sources for TBC Leatherworking recipes: where each recipe
-- is obtained. Keyed by crafting spell ID (same as LeatherworkingData.lua).
-- Generated from Wowhead TBC data (trainer costs, source kinds)
-- cross-checked with tbcdb.com 2.4.3 / wotlkdb.com (vendor prices/stock,
-- drop tables, zones); old-world entries reuse the validated Vanilla
-- data where the TBC sources are unchanged. 2026-08-06.

local S = ns.NewSourceDB("LEATHERWORKING")

-- DATA_START (generated; do not hand-edit between markers)
S(2149, {{k="t"}}) -- Handstitched Leather Boots
S(2152, {{k="t"}}) -- Light Armor Kit
S(2881, {{k="t"}}) -- Light Leather
S(7126, {{k="t"}}) -- Handstitched Leather Vest
S(9058, {{k="t"}}) -- Handstitched Leather Cloak
S(9059, {{k="t"}}) -- Handstitched Leather Bracers
S(2153, {{k="t", cost=50}}) -- Handstitched Leather Pants
S(3753, {{k="t", cost=75}}) -- Handstitched Leather Belt
S(9060, {{k="t", cost=100}}) -- Light Leather Quiver
S(9062, {{k="t", cost=100}}) -- Small Leather Ammo Pouch
S(3816, {{k="t", cost=50}}) -- Cured Light Hide
S(9064, {{k="w", item=7288}}) -- Rugged Leather Pants
S(2160, {{k="t", cost=100}}) -- Embossed Leather Vest
S(5244, {{k="q", item=5083, quest=769, name="Kodo Hide Bag", zone="Thunder Bluff", faction="Horde"}}) -- Kodo Hide Bag
S(2161, {{k="t", cost=100}}) -- Embossed Leather Boots
S(3756, {{k="t", cost=150}}) -- Embossed Leather Gloves
S(2162, {{k="t", cost=100}}) -- Embossed Leather Cloak
S(2163, {{k="w", item=2407}}) -- White Leather Jerkin
S(9065, {{k="t", cost=150}}) -- Light Leather Bracers
S(2164, {{k="w", item=2408}}) -- Fine Leather Gloves
S(3759, {{k="t", cost=200}}) -- Embossed Leather Pants
S(3763, {{k="t", cost=300}}) -- Fine Leather Belt
S(2159, {{k="t", cost=250}}) -- Fine Leather Cloak
S(3761, {{k="t", cost=350}}) -- Fine Leather Tunic
S(2158, {{k="w", item=2406}}) -- Fine Leather Boots
S(6702, {{k="v", item=5786, cost=550, npc=4186, name="Mavralyn", zone="Darkshore", faction="Alliance"},
         {k="v", item=5786, cost=550, npc=843, name="Gina MacGregor", zone="Westfall", faction="Alliance"},
         {k="v", item=5786, cost=550, npc=3556, name="Andrew Hilbert", zone="Silverpine Forest", limited=true, faction="Horde"},
         {k="d", item=5786, npc=3385, name="Theramore Marine", zone="The Barrens"},
         {k="d", item=5786, npc=1732, name="Defias Squallshaper", zone="The Deadmines"}}) -- Murloc Scale Belt
S(7953, {{k="v", item=6474, cost=550, npc=5783, name="Kalldan Felmoon", zone="Wailing Caverns", limited=true}}) -- Deviate Scale Cloak
S(8322, {{k="q", item=6710, quest=1582, name="Moonglow Vest", zone="Darnassus", faction="Alliance"}}) -- Moonglow Vest
S(6703, {{k="v", item=5787, cost=600, npc=4186, name="Mavralyn", zone="Darkshore", faction="Alliance"},
         {k="v", item=5787, cost=600, npc=843, name="Gina MacGregor", zone="Westfall", faction="Alliance"},
         {k="v", item=5787, cost=600, npc=3556, name="Andrew Hilbert", zone="Silverpine Forest", limited=true, faction="Horde"},
         {k="d", item=5787, npc=657, name="Defias Pirate", zone="The Deadmines"},
         {k="d", item=5787, npc=3386, name="Theramore Preserver", zone="The Barrens"}}) -- Murloc Scale Breastplate
S(9068, {{k="t", cost=400}}) -- Light Leather Pants
S(2165, {{k="t", cost=250}}) -- Medium Armor Kit
S(2167, {{k="t", cost=350}}) -- Dark Leather Boots
S(2169, {{k="w", item=2409}}) -- Dark Leather Tunic
S(3762, {{k="w", item=4293}}) -- Hillman's Leather Vest
S(3817, {{k="t", cost=200}}) -- Cured Medium Hide
S(9070, {{k="v", item=7289, cost=650, npc=2697, name="Clyde Ranthal", zone="Redridge Mountains", faction="Alliance"}}) -- Black Whelp Cloak
S(20648, {{k="t", cost=500}}) -- Medium Leather
S(24940, {{k="v", item=20576, cost=1400, npc=777, name="Amy Davenport", zone="Redridge Mountains", faction="Alliance"}}) -- Black Whelp Tunic
S(7133, {{k="w", item=5972}}) -- Fine Leather Pants
S(7954, {{k="v", item=6475, cost=1500, npc=5783, name="Kalldan Felmoon", zone="Wailing Caverns", limited=true}}) -- Deviate Scale Gloves
S(2168, {{k="t", cost=350}}) -- Dark Leather Cloak
S(7135, {{k="t", cost=400}}) -- Dark Leather Pants
S(7955, {{k="q", item=6476, quest=1487, name="Deviate Eradication", zone="Wailing Caverns"}}) -- Deviate Scale Belt
S(2166, {{k="t", cost=450}}) -- Toughened Leather Armor
S(3765, {{k="w", item=7360}}) -- Dark Leather Gloves
S(3767, {{k="w", item=4294}}) -- Hillman's Belt
S(9072, {{k="v", item=7290, cost=1600, npc=2679, name="Wenna Silkbeard", zone="Wetlands", faction="Alliance"}}) -- Red Whelp Gloves
S(9074, {{k="t", cost=500}}) -- Nimble Leather Gloves
S(3766, {{k="t", cost=400}}) -- Dark Leather Belt
S(9145, {{k="t", cost=500}}) -- Fletcher's Gloves
S(3768, {{k="t", cost=500}}) -- Hillman's Shoulders
S(3770, {{k="t", cost=500}}) -- Toughened Leather Gloves
S(9146, {{k="v", item=7361, cost=1800, npc=6731, name="Harlown Darkweave", zone="Ashenvale", faction="Alliance"}}) -- Herbalist's Gloves
S(9147, {{k="v", item=7362, cost=2000, npc=3537, name="Zixil", zone="Hillsbrad Foothills", limited=true}}) -- Earthen Leather Shoulders
S(3769, {{k="w", item=4296}}) -- Dark Leather Shoulders
S(9148, {{k="w", item=7363}}) -- Pilferer's Gloves
S(3764, {{k="t", cost=500}}) -- Hillman's Leather Gloves
S(9149, {{k="w", item=7364}}) -- Heavy Earthen Gloves
S(3760, {{k="t", cost=600}}) -- Hillman's Cloak
S(3771, {{k="w", item=4297}}) -- Barbaric Gloves
S(3780, {{k="t", cost=750}}) -- Heavy Armor Kit
S(3818, {{k="t", cost=500}}) -- Cured Heavy Hide
S(9193, {{k="t", cost=500}}) -- Heavy Quiver
S(9194, {{k="t", cost=500}}) -- Heavy Leather Ammo Pouch
S(20649, {{k="t", cost=1000}}) -- Heavy Leather
S(23190, {{k="v", item=18731, cost=2000, npc=5128, name="Bombus Finespindle", zone="Ironforge", faction="Alliance"},
          {k="v", item=18731, cost=2000, npc=3366, name="Tamar", zone="Orgrimmar", limited=true, faction="Horde"}}) -- Heavy Leather Ball
S(3772, {{k="v", item=7613, cost=2000, npc=2679, name="Wenna Silkbeard", zone="Wetlands", faction="Alliance"},
         {k="v", item=7613, cost=2000, npc=2698, name="George Candarte", zone="Hillsbrad Foothills", faction="Horde"}}) -- Green Leather Armor
S(23399, {{k="v", item=18949, cost=2000, npc=4225, name="Saenorion", zone="Darnassus", limited=true, faction="Alliance"},
          {k="v", item=18949, cost=2000, npc=4589, name="Joseph Moore", zone="Undercity", limited=true, faction="Horde"}}) -- Barbaric Bracers
S(3774, {{k="t", cost=1000}}) -- Green Leather Belt
S(7147, {{k="t", cost=1000}}) -- Guardian Pants
S(4096, {{k="v", item=13287, cost=2500, npc=2819, name="Tunkk", zone="Arathi Highlands", limited=true, faction="Horde"}}) -- Raptor Hide Harness
S(4097, {{k="v", item=13288, cost=2500, npc=2816, name="Androd Fadran", zone="Arathi Highlands", faction="Alliance"}}) -- Raptor Hide Belt
S(9195, {{k="w", item=7449}}) -- Dusky Leather Leggings
S(3775, {{k="w", item=4298}}) -- Guardian Belt
S(6704, {{k="v", item=5788, cost=650, npc=2381, name="Micha Yance", zone="Hillsbrad Foothills", limited=true, faction="Alliance"},
         {k="v", item=5788, cost=650, npc=2393, name="Christoph Jeffcoat", zone="Hillsbrad Foothills", limited=true, faction="Horde"},
         {k="v", item=5788, cost=650, npc=2846, name="Blixrez Goodstitch", zone="Stranglethorn Vale", limited=true},
         {k="d", item=5788, npc=938, name="Kurzen Commando", zone="Stranglethorn Vale"}}) -- Thick Murloc Armor
S(7149, {{k="v", item=5973, cost=650, npc=3958, name="Lardan", zone="Ashenvale", faction="Alliance"},
         {k="v", item=5973, cost=650, npc=2810, name="Hammon Karwn", zone="Arathi Highlands", faction="Alliance"},
         {k="v", item=5973, cost=650, npc=4877, name="Jandia", zone="Thousand Needles", limited=true, faction="Horde"}}) -- Barbaric Leggings
S(3773, {{k="w", item=4299}}) -- Guardian Armor
S(7151, {{k="t", cost=1200}}) -- Barbaric Shoulders
S(9196, {{k="t", cost=1500}}) -- Dusky Leather Armor
S(9197, {{k="w", item=7450}}) -- Green Whelp Armor
S(3776, {{k="t", cost=1200}}) -- Green Leather Bracers
S(9198, {{k="t", cost=2000}}) -- Frost Leather Cloak
S(3778, {{k="v", item=14635, cost=3000, npc=2699, name="Rikqiz", zone="Stranglethorn Vale", limited=true}}) -- Gem-studded Leather Belt
S(7153, {{k="w", item=5974}}) -- Guardian Cloak
S(9201, {{k="t", cost=2000}}) -- Dusky Bracers
S(6661, {{k="t", cost=2000}}) -- Barbaric Harness
S(6705, {{k="v", item=5789, cost=2800, npc=4897, name="Helenia Olden", zone="Dustwallow Marsh", limited=true, faction="Alliance"},
         {k="v", item=5789, cost=2800, npc=2846, name="Blixrez Goodstitch", zone="Stranglethorn Vale", limited=true},
         {k="d", item=5789, npc=1561, name="Bloodsail Raider", zone="Stranglethorn Vale"},
         {k="d", item=5789, npc=2636, name="Blackwater Deckhand", zone="Arathi Highlands"}}) -- Murloc Scale Bracers
S(7156, {{k="t", cost=2400}}) -- Guardian Gloves
S(9202, {{k="v", item=7451, cost=2800, npc=7852, name="Pratt McGrubben", zone="Feralas", faction="Alliance"},
         {k="v", item=7451, cost=2800, npc=4225, name="Saenorion", zone="Darnassus", limited=true, faction="Alliance"},
         {k="v", item=7451, cost=2800, npc=7854, name="Jangdor Swiftstrider", zone="Feralas", limited=true, faction="Horde"}}) -- Green Whelp Bracers
S(21943, {{k="d", item=17722, npc=7856, name="Southsea Freebooter", zone="Tanaris"}}) -- Gloves of the Greatfather
S(3777, {{k="w", item=4300}}) -- Guardian Leather Bracers
S(9206, {{k="t", cost=2500}}) -- Dusky Belt
S(3779, {{k="w", item=4301}}) -- Barbaric Belt
S(9207, {{k="w", item=7452}}) -- Dusky Boots
S(9208, {{k="w", item=7453}}) -- Swift Boots
S(10482, {{k="t", cost=2000}}) -- Cured Thick Hide
S(10487, {{k="t", cost=2000}}) -- Thick Armor Kit
S(10490, {{k="w", item=8384}}) -- Comfortable Leather Hat
S(20650, {{k="t", cost=4000}}) -- Thick Leather
S(22711, {{k="v", item=18239, cost=3500, npc=2699, name="Rikqiz", zone="Stranglethorn Vale", limited=true}}) -- Shadowskin Gloves
S(10499, {{k="t", cost=3000}}) -- Nightscape Tunic
S(10507, {{k="t", cost=3000}}) -- Nightscape Headband
S(10509, {{k="v", item=8385, cost=3500, npc=7852, name="Pratt McGrubben", zone="Feralas", faction="Alliance"},
          {k="v", item=8385, cost=3500, npc=7854, name="Jangdor Swiftstrider", zone="Feralas", limited=true, faction="Horde"},
          {k="w", item=8385}}) -- Turtle Scale Gloves
S(10511, {{k="t", cost=3000}}) -- Turtle Scale Breastplate
S(10516, {{k="v", item=8409, cost=4000, npc=8160, name="Nioma", zone="The Hinterlands", faction="Alliance"},
          {k="v", item=8409, cost=4000, npc=7854, name="Jangdor Swiftstrider", zone="Feralas", limited=true, faction="Horde"}}) -- Nightscape Shoulders
S(10518, {{k="t", cost=3500}}) -- Turtle Scale Bracers
S(10520, {{k="w", item=8386}}) -- Big Voodoo Robe
S(10525, {{k="d", item=8395, npc=5618, name="Wastewander Bandit", zone="Tanaris"}}) -- Tough Scorpid Breastplate
S(10529, {{k="q", item=8403, quest=2848, name="Wild Leather Shoulders", zone="Feralas", faction="Alliance"},
          {k="q", item=8403, quest=2855, name="Wild Leather Shoulders", zone="Feralas", faction="Horde"}}) -- Wild Leather Shoulders
S(10531, {{k="w", item=8387}}) -- Big Voodoo Mask
S(10533, {{k="d", item=8397, npc=5617, name="Wastewander Shadow Mage", zone="Tanaris"}}) -- Tough Scorpid Bracers
S(10542, {{k="d", item=8398, npc=5616, name="Wastewander Thief", zone="Tanaris"}}) -- Tough Scorpid Gloves
S(10544, {{k="q", item=8404, quest=2849, name="Wild Leather Vest", zone="Feralas", faction="Alliance"},
          {k="q", item=8404, quest=2856, name="Wild Leather Vest", zone="Feralas", faction="Horde"}}) -- Wild Leather Vest
S(10546, {{k="q", item=8405, quest=2850, name="Wild Leather Helmet", zone="Feralas", faction="Alliance"},
          {k="q", item=8405, quest=2857, name="Wild Leather Helmet", zone="Feralas", faction="Horde"}}) -- Wild Leather Helmet
S(10619, {{k="t", cost=10000}}) -- Dragonscale Gauntlets
S(10621, {{k="t", cost=10000}}) -- Wolfshead Helm
S(14930, {{k="t", cost=3600}}) -- Quickdraw Quiver
S(14932, {{k="t", cost=3600}}) -- Thick Leather Ammo Pouch
S(10548, {{k="t", cost=4000}}) -- Nightscape Pants
S(10552, {{k="t", cost=4000}}) -- Turtle Scale Helm
S(10630, {{k="t", cost=10000}}) -- Gauntlets of the Sea
S(10554, {{k="d", item=8399, npc=5615, name="Wastewander Rogue", zone="Tanaris"}}) -- Tough Scorpid Boots
S(10556, {{k="t", cost=4500}}) -- Turtle Scale Leggings
S(10558, {{k="t", cost=4500}}) -- Nightscape Boots
S(10560, {{k="w", item=8389}}) -- Big Voodoo Pants
S(10562, {{k="w", item=8390}}) -- Big Voodoo Cloak
S(10564, {{k="d", item=8400, zone="Tanaris"}}) -- Tough Scorpid Shoulders
S(10566, {{k="q", item=8406, quest=2851, name="Wild Leather Boots", zone="Feralas", faction="Alliance"},
          {k="q", item=8406, quest=2858, name="Wild Leather Boots", zone="Feralas", faction="Horde"}}) -- Wild Leather Boots
S(10568, {{k="d", item=8401, npc=5615, name="Wastewander Rogue", zone="Tanaris"}}) -- Tough Scorpid Leggings
S(10570, {{k="d", item=8402, zone="Tanaris"}}) -- Tough Scorpid Helm
S(10572, {{k="q", item=8407, quest=2852, name="Wild Leather Leggings", zone="Feralas", faction="Alliance"},
          {k="q", item=8407, quest=2859, name="Wild Leather Leggings", zone="Feralas", faction="Horde"}}) -- Wild Leather Leggings
S(10574, {{k="q", item=8408, quest=2853, name="Master of the Wild Leather", zone="Feralas", faction="Alliance"},
          {k="q", item=8408, quest=2860, name="Master of the Wild Leather", zone="Feralas", faction="Horde"}}) -- Wild Leather Cloak
S(10632, {{k="t", cost=10000}}) -- Helm of Fire
S(10647, {{k="t", cost=10000}}) -- Feathered Breastplate
S(19047, {{k="t", cost=5000}}) -- Cured Rugged Hide
S(19058, {{k="t", cost=5000}}) -- Rugged Armor Kit
S(22331, {{k="t", cost=5000}}) -- Rugged Leather
S(10650, {{k="t", cost=10000}}) -- Dragonscale Breastplate
S(19048, {{k="v", item=15724, cost=12000, npc=12956, name="Zannok Hidepiercer", zone="Silithus", limited=true}}) -- Heavy Scorpid Bracers
S(19049, {{k="v", item=15725, cost=12000, npc=12942, name="Leonard Porter", zone="Western Plaguelands", faction="Alliance"},
          {k="v", item=15725, cost=12000, npc=12943, name="Werg Thickblade", zone="Tirisfal Glades", limited=true, faction="Horde"}}) -- Wicked Leather Gauntlets
S(19050, {{k="v", item=15726, cost=12000, npc=11874, name="Masat T'andr", zone="Swamp of Sorrows", limited=true}}) -- Green Dragonscale Breastplate
S(36074, {{k="t", cost=10000}}) -- Blackstorm Leggings
S(36075, {{k="t", cost=10000}}) -- Wildfeather Leggings
S(36076, {{k="t", cost=10000}}) -- Dragonstrike Leggings
S(19051, {{k="d", item=15727, npc=5981, name="Portal Seeker", zone="Blasted Lands"}}) -- Heavy Scorpid Vest
S(19052, {{k="t", cost=10000},
          {k="d", item=15728, npc=6201, name="Legashi Rogue", zone="Azshara"}}) -- Wicked Leather Bracers
S(19053, {{k="v", item=15729, cost=12000, npc=12957, name="Blimo Gadgetspring", zone="Azshara", limited=true}}) -- Chimeric Gloves
S(19055, {{k="t", cost=10000},
          {k="w", item=15731}}) -- Runic Leather Gauntlets
S(19059, {{k="d", item=15732, npc=7035, name="Firegut Brute", zone="Burning Steppes"}}) -- Volcanic Leggings
S(19060, {{k="d", item=15733, npc=5226, name="Murk Worm", zone="The Temple of Atal'Hakkar"}}) -- Green Dragonscale Leggings
S(19061, {{k="v", item=15734, cost=14000, npc=7852, name="Pratt McGrubben", zone="Feralas", faction="Alliance"},
          {k="v", item=15734, cost=14000, npc=7854, name="Jangdor Swiftstrider", zone="Feralas", limited=true, faction="Horde"}}) -- Living Shoulders
S(19062, {{k="v", item=15735, cost=14000, npc=12958, name="Gigget Zipcoil", zone="The Hinterlands", limited=true}}) -- Ironfeather Shoulders
S(19063, {{k="w", item=15737}}) -- Chimeric Boots
S(19064, {{k="d", item=15738, npc=7025, name="Blackrock Soldier", zone="Burning Steppes"}}) -- Heavy Scorpid Gauntlets
S(19065, {{k="t", cost=10000},
          {k="d", item=15739, npc=7112, name="Jaedenar Cultist", zone="Felwood"}}) -- Runic Leather Bracers
S(19066, {{k="v", item=15740, cost=16000, npc=11189, name="Qia", zone="Winterspring", limited=true}}) -- Frostsaber Boots
S(19067, {{k="v", item=15741, cost=16000, npc=12942, name="Leonard Porter", zone="Western Plaguelands", faction="Alliance"},
          {k="v", item=15741, cost=16000, npc=12943, name="Werg Thickblade", zone="Tirisfal Glades", limited=true, faction="Horde"}}) -- Stormshroud Pants
S(19068, {{k="v", item=20253, cost=16000, npc=11557, name="Meilosh", zone="Felwood"},
          {k="w", item=15742}}) -- Warbear Harness
S(19070, {{k="w", item=15743}}) -- Heavy Scorpid Belt
S(19071, {{k="t", cost=10000},
          {k="d", item=15744, npc=7107, name="Jadefire Trickster", zone="Felwood"}}) -- Wicked Leather Headband
S(19072, {{k="t", cost=10000},
          {k="w", item=15745}}) -- Runic Leather Belt
S(19073, {{k="w", item=15746}}) -- Chimeric Leggings
S(24655, {{k="t", cost=30000}}) -- Green Dragonscale Gauntlets
S(19074, {{k="d", item=15747, npc=7440, name="Winterfall Den Watcher", zone="Winterspring"}}) -- Frostsaber Leggings
S(19075, {{k="d", item=15748, npc=7027, name="Blackrock Slayer", zone="Burning Steppes"}}) -- Heavy Scorpid Leggings
S(19076, {{k="d", item=15749, npc=9259, name="Firebrand Grunt", zone="Blackrock Spire"}}) -- Volcanic Breastplate
S(19077, {{k="v", item=15751, cost=20000, npc=12957, name="Blimo Gadgetspring", zone="Azshara", limited=true}}) -- Blue Dragonscale Breastplate
S(19078, {{k="d", item=15752, npc=7158, name="Deadwood Shaman", zone="Felwood"}}) -- Living Leggings
S(19079, {{k="d", item=15753, npc=6138, name="Arkkoran Oracle", zone="Azshara"}}) -- Stormshroud Armor
S(19080, {{k="v", item=20254, cost=20000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Warbear Woolies
S(22815, {{k="q", quest=5518, name="The Gordok Ogre Suit", zone="Dire Maul"}}) -- Gordok Ogre Suit
S(44953, {{k="v", item=34262, cost=5000, npc=13433, name="Wulmort Jinglepocket", zone="Ironforge"},
          {k="v", item=34262, cost=5000, npc=13420, name="Penney Copperpinch", zone="Orgrimmar"}}) -- Winter Boots
S(19081, {{k="w", item=15755}}) -- Chimeric Vest
S(19082, {{k="t", cost=15000},
          {k="v", item=15756, npc=12941, name="Jase Farlane", zone="Eastern Plaguelands"}}) -- Runic Leather Headband
S(19083, {{k="t", cost=15000},
          {k="w", item=15757}}) -- Wicked Leather Pants
S(19084, {{k="v", item=15758, cost=22000, npc=12959, name="Nergal", zone="Un'Goro Crater", limited=true}}) -- Devilsaur Gauntlets
S(19085, {{k="v", item=15759, cost=22000, npc=9499, name="Plugger Spazzring", zone="Blackrock Depths", limited=true}}) -- Black Dragonscale Breastplate
S(19086, {{k="d", item=15760, npc=2644, name="Vilebranch Hideskinner", zone="The Hinterlands"}}) -- Ironfeather Breastplate
S(23703, {{k="v", item=19326, cost=22000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Might of the Timbermaw
S(23705, {{k="v", item=19328, cost=22000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"},
          {k="v", item=19328, cost=22000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
          {k="v", item=19328, cost=22000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades"}}) -- Dawn Treaders
S(19087, {{k="d", item=15761, npc=7441, name="Winterfall Totemic", zone="Winterspring"}}) -- Frostsaber Gloves
S(19088, {{k="v", item=15762, cost=25000, npc=12956, name="Zannok Hidepiercer", zone="Silithus", limited=true}}) -- Heavy Scorpid Helm
S(19089, {{k="d", item=15763, npc=6146, name="Cliff Breaker", zone="Azshara"}}) -- Blue Dragonscale Shoulders
S(19090, {{k="d", item=15764, npc=6144, name="Son of Arkkoroc", zone="Azshara"}}) -- Stormshroud Shoulders
S(20853, {{k="v", item=17022, cost=150000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Corehound Boots
S(19054, {{k="d", item=15730, npc=10363, name="General Drakkisath", zone="Blackrock Spire"}}) -- Red Dragonscale Breastplate
S(19091, {{k="t", cost=15000},
          {k="w", item=15765}}) -- Runic Leather Pants
S(19092, {{k="t", cost=15000},
          {k="d", item=15768, npc=10406, name="Ghoul Ravener", zone="Stratholme"}}) -- Wicked Leather Belt
S(19093, {{k="q", quest=7497, name="The Journey Has Just Begun", zone="Stormwind City", faction="Alliance"},
          {k="q", quest=7493, name="The Journey Has Just Begun", zone="Orgrimmar", faction="Horde"}}) -- Onyxia Scale Cloak
S(19094, {{k="d", item=15770, npc=8898, name="Anvilrage Marshal", zone="Blackrock Depths"}}) -- Black Dragonscale Shoulders
S(19095, {{k="d", item=15771, npc=1813, name="Decaying Horror", zone="Western Plaguelands"}}) -- Living Breastplate
S(19097, {{k="d", item=15772, zone="Un'Goro Crater"}}) -- Devilsaur Leggings
S(19098, {{k="t", cost=15000},
          {k="d", item=15773, npc=10499, name="Spectral Researcher", zone="Scholomance"}}) -- Wicked Leather Armor
S(19100, {{k="d", item=15774, npc=7029, name="Blackrock Battlemaster", zone="Burning Steppes"}}) -- Heavy Scorpid Shoulders
S(19101, {{k="d", item=15775, npc=9260, name="Firebrand Legionnaire", zone="Blackrock Spire"}}) -- Volcanic Shoulders
S(19102, {{k="t", cost=15000},
          {k="d", item=15776, npc=11582, name="Scholomance Dark Summoner", zone="Scholomance"}}) -- Runic Leather Armor
S(19103, {{k="t", cost=15000},
          {k="d", item=15777, npc=10425, name="Crimson Battle Mage", zone="Stratholme"}}) -- Runic Leather Shoulders
S(19104, {{k="d", item=15779, npc=7438, name="Winterfall Ursa", zone="Winterspring"}}) -- Frostsaber Tunic
S(19107, {{k="d", item=15781, npc=8903, name="Anvilrage Captain", zone="Blackrock Depths"}}) -- Black Dragonscale Leggings
S(20854, {{k="v", item=17023, cost=160000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Molten Helm
S(20855, {{k="v", item=17025, cost=160000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Black Dragonscale Boots
S(22727, {{k="d", item=18252, zone="Molten Core"}}) -- Core Armor Kit
S(22921, {{k="d", item=18514, zone="Dire Maul"}}) -- Girdle of Insight
S(22922, {{k="d", item=18515, zone="Dire Maul"}}) -- Mongoose Boots
S(22923, {{k="d", item=18516, zone="Dire Maul"}}) -- Swift Flight Bracers
S(22926, {{k="d", item=18517, zone="Dire Maul"}}) -- Chromatic Cloak
S(22927, {{k="d", item=18518, zone="Dire Maul"}}) -- Hide of the Wild
S(22928, {{k="d", item=18519, zone="Dire Maul"}}) -- Shifting Cloak
S(23704, {{k="v", item=19327, cost=40000, npc=11557, name="Meilosh", zone="Felwood"}}) -- Timbermaw Brawlers
S(23706, {{k="v", item=19329, cost=40000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"},
          {k="v", item=19329, cost=40000, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
          {k="v", item=19329, cost=40000, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades"}}) -- Golden Mantle of the Dawn
S(23707, {{k="v", item=19330, cost=60000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Lava Belt
S(23708, {{k="v", item=19331, cost=90000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Chromatic Gauntlets
S(23709, {{k="v", item=19332, cost=90000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Corehound Belt
S(23710, {{k="v", item=19333, cost=90000, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Molten Belt
S(24121, {{k="v", item=19769, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Primal Batskin Jerkin
S(24122, {{k="v", item=19770, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Primal Batskin Gloves
S(24123, {{k="v", item=19771, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Primal Batskin Bracers
S(24124, {{k="v", item=19772, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Blood Tiger Breastplate
S(24125, {{k="v", item=19773, cost=50000, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Blood Tiger Shoulders
S(24654, {{k="t", cost=50000}}) -- Blue Dragonscale Leggings
S(24703, {{k="v", item=20382, cost=60000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Dreamscale Breastplate
S(24846, {{k="v", item=20506, cost=40000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Spitfire Bracers
S(24847, {{k="v", item=20507, cost=40000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Spitfire Gauntlets
S(24848, {{k="v", item=20508, cost=40000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Spitfire Breastplate
S(24849, {{k="v", item=20509, cost=40000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Sandstalker Bracers
S(24850, {{k="v", item=20510, cost=40000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Sandstalker Gauntlets
S(24851, {{k="v", item=20511, cost=40000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Sandstalker Breastplate
S(26279, {{k="d", item=21548, npc=14454, name="The Windreaver", zone="Silithus"},
          {k="d", item=21548, npc=14457, name="Princess Tempestria", zone="Winterspring"}}) -- Stormshroud Gloves
S(28219, {{k="u"}}) -- Polar Tunic
S(28220, {{k="u"}}) -- Polar Gloves
S(28221, {{k="u"}}) -- Polar Bracers
S(28222, {{k="u"}}) -- Icy Scale Breastplate
S(28223, {{k="u"}}) -- Icy Scale Gauntlets
S(28224, {{k="u"}}) -- Icy Scale Bracers
S(28472, {{k="v", item=22771, cost=50000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Bramblewood Helm
S(28473, {{k="v", item=22770, cost=50000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Bramblewood Boots
S(28474, {{k="v", item=22769, cost=50000, npc=15293, name="Aendel Windspear", zone="Silithus", limited=true}}) -- Bramblewood Belt
S(32454, {{k="t", cost=10000}}) -- Knothide Leather
S(32456, {{k="t", cost=15000}}) -- Knothide Armor Kit
S(32462, {{k="t", cost=15000}}) -- Felscale Gloves
S(32466, {{k="t", cost=15000}}) -- Scaled Draenic Pants
S(32470, {{k="t", cost=15000}}) -- Thick Draenic Gloves
S(32478, {{k="t", cost=15000}}) -- Wild Draenish Boots
S(32482, {{k="v", item=25726, cost=10000, npc=16689, name="Zaralda", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=25726, cost=10000, npc=16748, name="Haferet", zone="The Exodar", limited=true, faction="Alliance"}}) -- Comfortable Insoles
S(45100, {{k="t", cost=15000}}) -- Leatherworker's Satchel
S(32463, {{k="t", cost=18000}}) -- Felscale Boots
S(32467, {{k="t", cost=18000}}) -- Scaled Draenic Gloves
S(32479, {{k="t", cost=18000}}) -- Wild Draenish Gloves
S(32471, {{k="t", cost=18000}}) -- Thick Draenic Pants
S(44343, {{k="t", cost=18000}}) -- Knothide Ammo Pouch
S(44344, {{k="t", cost=18000}}) -- Knothide Quiver
S(32464, {{k="t", cost=20000}}) -- Felscale Pants
S(32472, {{k="t", cost=20000}}) -- Thick Draenic Boots
S(32480, {{k="t", cost=20000}}) -- Wild Draenish Leggings
S(32455, {{k="v", item=25720, cost=50000, npc=16689, name="Zaralda", zone="Silvermoon City", limited=true, faction="Horde"},
          {k="v", item=25720, cost=50000, npc=16748, name="Haferet", zone="The Exodar", limited=true, faction="Alliance"},
          {k="v", item=25720, cost=50000, npc=19196, name="Cro Threadstrong", zone="Shattrath City", limited=true}}) -- Heavy Knothide Leather
S(32457, {{k="v", item=25721, cost=50000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Vindicator's Armor Kit
S(32458, {{k="v", item=25722, cost=50000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Magister's Armor Kit
S(32468, {{k="t", cost=20000}}) -- Scaled Draenic Vest
S(35530, {{k="v", item=29664, cost=50000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
          {k="v", item=30444, cost=50000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Reinforced Mining Bag
S(32473, {{k="t", cost=25000}}) -- Thick Draenic Vest
S(32481, {{k="t", cost=25000}}) -- Wild Draenish Vest
S(36077, {{k="t", cost=20000}}) -- Primalstorm Breastplate
S(36078, {{k="t", cost=20000}}) -- Living Crystal Breastplate
S(36079, {{k="t", cost=40000}}) -- Golden Dragonstrike Breastplate
S(32465, {{k="t", cost=25000}}) -- Felscale Breastplate
S(32469, {{k="t", cost=25000}}) -- Scaled Draenic Boots
S(35549, {{k="v", item=29719, cost=60000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"},
          {k="v", item=31361, cost=60000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"}}) -- Cobrahide Leg Armor
S(35555, {{k="v", item=29720, cost=60000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Clefthide Leg Armor
S(32490, {{k="v", item=25732, cost=120000, npc=23007, name="Paulsta'ats", zone="Nagrand"},
          {k="v", item=25732, cost=120000, npc=20242, name="Karaaz", zone="Netherstorm"}}) -- Fel Leather Gloves
S(32501, {{k="v", item=25741, cost=120000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
          {k="v", item=29217, cost=120000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Netherfury Belt
S(32502, {{k="v", item=25742, cost=120000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
          {k="v", item=29219, cost=120000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Netherfury Leggings
S(35520, {{k="d", item=29669, npc=18320, name="Time-Lost Shadowmage", zone="Sethekk Halls"}}) -- Shadow Armor Kit
S(35521, {{k="d", item=29672, npc=20898, name="Gargantuan Abyssal", zone="The Arcatraz"}}) -- Flame Armor Kit
S(35522, {{k="d", item=29673, npc=17797, name="Hydromancer Thespia", zone="The Steamvault"}}) -- Frost Armor Kit
S(35523, {{k="d", item=29674, npc=17941, name="Mennu the Betrayer", zone="The Slave Pens"}}) -- Nature Armor Kit
S(35524, {{k="d", item=29675, npc=17879, name="Chrono Lord Deja", zone="The Black Morass"}}) -- Arcane Armor Kit
S(35540, {{k="t", cost=20000}}) -- Drums of War
S(351766, {{k="t", cost=20000}}) -- Greater Drums of War
S(35544, {{k="v", item=34172, cost=160000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
          {k="v", item=34173, cost=160000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Drums of Speed
S(351768, {{k="v", item=185923, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
           {k="v", item=187049, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Greater Drums of Speed
S(32461, {{k="v", item=25725, cost=50000, npc=18672, name="Thomas Yance", zone="Old Hillsbrad Foothills"}}) -- Riding Crop
S(32485, {{k="d", item=25728, npc=18667, name="Blackheart the Inciter", zone="Shadow Labyrinth"}}) -- Stylin' Purple Hat
S(32487, {{k="d", item=25729, npc=17820, name="Durnholde Rifleman", zone="Old Hillsbrad Foothills"}}) -- Stylin' Adventure Hat
S(32488, {{k="d", item=25731, npc=18322, name="Sethekk Ravenguard", zone="Sethekk Halls"}}) -- Stylin' Crimson Hat
S(32489, {{k="d", item=25730, zone="The Black Morass"}}) -- Stylin' Jungle Hat
S(32493, {{k="v", item=25733, cost=140000, npc=23007, name="Paulsta'ats", zone="Nagrand"},
          {k="v", item=25733, cost=140000, npc=20242, name="Karaaz", zone="Netherstorm"}}) -- Fel Leather Boots
S(32494, {{k="v", item=25734, cost=140000, npc=23007, name="Paulsta'ats", zone="Nagrand"},
          {k="v", item=25734, cost=140000, npc=20242, name="Karaaz", zone="Netherstorm"}}) -- Fel Leather Leggings
S(32498, {{k="v", item=25738, cost=120000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=29213, cost=120000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Felstalker Belt
S(32503, {{k="v", item=25743, cost=120000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
          {k="v", item=29218, cost=120000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Netherfury Boots
S(35525, {{k="v", item=29677, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Felscale Leggings
S(35526, {{k="v", item=29682, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Felscale Gloves
S(35527, {{k="v", item=29684, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Felscale Boots
S(35528, {{k="v", item=29691, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamescale Boots
S(35529, {{k="v", item=29689, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamescale Leggings
S(35531, {{k="v", item=29693, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Flamescale Belt
S(35532, {{k="v", item=29698, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Clefthoof Leggings
S(35533, {{k="v", item=29700, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Clefthoof Gloves
S(35534, {{k="v", item=29701, cost=80000, npc=19331, name="Quartermaster Enuril", zone="Shattrath City"}}) -- Enchanted Clefthoof Boots
S(35535, {{k="v", item=29702, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Blastguard Pants
S(35536, {{k="v", item=29703, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Blastguard Boots
S(35537, {{k="v", item=29704, cost=80000, npc=19321, name="Quartermaster Endarin", zone="Shattrath City"}}) -- Blastguard Belt
S(35539, {{k="v", item=34174, cost=160000, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
          {k="v", item=34175, cost=160000, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Drums of Restoration
S(44359, {{k="v", item=34200, cost=160000, npc=21655, name="Nakodu", zone="Shattrath City"}}) -- Quiver of a Thousand Feathers
S(44768, {{k="v", item=34201, cost=160000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=34218, cost=160000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Netherscale Ammo Pouch
S(44770, {{k="t", cost=50000}}) -- Glove Reinforcements
S(44970, {{k="t", cost=50000}}) -- Heavy Knothide Armor Kit
S(351769, {{k="v", item=185924, npc=20241, name="Provisioner Nasela", zone="Nagrand", faction="Horde"},
           {k="v", item=187048, npc=20240, name="Trader Narasu", zone="Nagrand", faction="Alliance"}}) -- Greater Drums of Restoration
S(32496, {{k="v", item=25736, cost=140000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Heavy Clefthoof Leggings
S(32497, {{k="v", item=25737, cost=140000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Heavy Clefthoof Boots
S(32495, {{k="v", item=25735, cost=160000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Heavy Clefthoof Vest
S(32499, {{k="v", item=25739, cost=160000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=29214, cost=160000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Felstalker Bracer
S(32500, {{k="v", item=25740, cost=160000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"},
          {k="v", item=29215, cost=160000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"}}) -- Felstalker Breastplate
S(42546, {{k="v", item=33124, cost=50000, npc=18255, name="Apprentice Darius", zone="Deadwind Pass"}}) -- Cloak of Darkness
S(45117, {{k="d", item=34491, zone="Terokkar Forest"}}) -- Bag of Many Hides
S(35543, {{k="v", item=29717, cost=120000, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Drums of Battle
S(35554, {{k="v", item=29722, cost=120000, npc=17657, name="Logistics Officer Ulrike", zone="Hellfire Peninsula", faction="Alliance"},
          {k="v", item=31362, cost=120000, npc=17585, name="Quartermaster Urgronn", zone="Hellfire Peninsula", faction="Horde"}}) -- Nethercobra Leg Armor
S(35557, {{k="v", item=29721, cost=120000, npc=17904, name="Fedryen Swiftspear", zone="Zangarmarsh"}}) -- Nethercleft Leg Armor
S(35558, {{k="w", item=29723}}) -- Cobrascale Hood
S(35559, {{k="d", item=35302, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"},
          {k="w", item=29724}}) -- Cobrascale Gloves
S(35560, {{k="w", item=29725}}) -- Windscale Hood
S(35561, {{k="w", item=29726}}) -- Hood of Primal Life
S(35562, {{k="d", item=35303, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"},
          {k="w", item=29727}}) -- Gloves of the Living Touch
S(35563, {{k="w", item=29728}}) -- Windslayer Wraps
S(35564, {{k="w", item=29729}}) -- Living Dragonscale Helm
S(35567, {{k="w", item=29730}}) -- Earthen Netherscale Boots
S(35568, {{k="d", item=35300, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"},
          {k="w", item=29731}}) -- Windstrike Gloves
S(35572, {{k="w", item=29732}}) -- Netherdrake Helm
S(35573, {{k="d", item=35301, npc=24664, name="Kael'thas Sunstrider", zone="Magisters' Terrace"},
          {k="w", item=29733}}) -- Netherdrake Gloves
S(35574, {{k="w", item=29734}}) -- Thick Netherscale Breastplate
S(42731, {{k="v", item=33205, cost=240000, npc=18255, name="Apprentice Darius", zone="Deadwind Pass"}}) -- Shadowprowler's Chestguard
S(46132, {{k="d", item=35212, zone="Sunwell Plateau"}}) -- Leather Gauntlets of the Sun
S(46133, {{k="d", item=35213, zone="Sunwell Plateau"}}) -- Fletcher's Gloves of the Phoenix
S(46134, {{k="d", item=35214, zone="Sunwell Plateau"}}) -- Gloves of Immortal Dusk
S(46135, {{k="d", item=35215, zone="Sunwell Plateau"}}) -- Sun-Drenched Scale Gloves
S(46136, {{k="d", item=35216, zone="Sunwell Plateau"}}) -- Leather Chestguard of the Sun
S(46137, {{k="d", item=35217, zone="Sunwell Plateau"}}) -- Embrace of the Phoenix
S(46138, {{k="d", item=35218, zone="Sunwell Plateau"}}) -- Carapace of Sun and Shadow
S(46139, {{k="d", item=35219, zone="Sunwell Plateau"}}) -- Sun-Drenched Scale Chestguard
S(351771, {{k="v", item=185926, npc=21432, name="Almaador", zone="Shattrath City"}}) -- Greater Drums of Battle
S(35538, {{k="v", item=29713, cost=120000, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Drums of Panic
S(351770, {{k="v", item=185925, npc=21643, name="Alurmi", zone="Tanaris"}}) -- Greater Drums of Panic
S(35575, {{k="t", cost=100000}}) -- Ebon Netherscale Breastplate
S(35576, {{k="t", cost=100000}}) -- Ebon Netherscale Belt
S(35577, {{k="t", cost=100000}}) -- Ebon Netherscale Bracers
S(35580, {{k="t", cost=100000}}) -- Netherstrike Breastplate
S(35582, {{k="t", cost=100000}}) -- Netherstrike Belt
S(35584, {{k="t", cost=100000}}) -- Netherstrike Bracers
S(35585, {{k="t", cost=100000}}) -- Windhawk Hauberk
S(35587, {{k="t", cost=100000}}) -- Windhawk Belt
S(35588, {{k="t", cost=100000}}) -- Windhawk Bracers
S(35589, {{k="t", cost=100000}}) -- Primalstrike Vest
S(35590, {{k="t", cost=100000}}) -- Primalstrike Belt
S(35591, {{k="t", cost=100000}}) -- Primalstrike Bracers
S(36349, {{k="d", item=30301, zone="Serpentshrine Cavern"},
          {k="d", item=30301, zone="Tempest Keep"}}) -- Belt of Natural Power
S(36351, {{k="d", item=30302, zone="Serpentshrine Cavern"},
          {k="d", item=30302, zone="Tempest Keep"}}) -- Belt of Deep Shadow
S(36352, {{k="d", item=30303, zone="Serpentshrine Cavern"},
          {k="d", item=30303, zone="Tempest Keep"}}) -- Belt of the Black Eagle
S(36353, {{k="d", item=30304, zone="Serpentshrine Cavern"},
          {k="d", item=30304, zone="Tempest Keep"}}) -- Monsoon Belt
S(36355, {{k="d", item=30305, zone="Serpentshrine Cavern"},
          {k="d", item=30305, zone="Tempest Keep"}}) -- Boots of Natural Grace
S(36357, {{k="d", item=30306, zone="Serpentshrine Cavern"},
          {k="d", item=30306, zone="Tempest Keep"}}) -- Boots of Utter Darkness
S(36358, {{k="d", item=30307, zone="Serpentshrine Cavern"},
          {k="d", item=30307, zone="Tempest Keep"}}) -- Boots of the Crimson Hawk
S(36359, {{k="d", item=30308, zone="Serpentshrine Cavern"},
          {k="d", item=30308, zone="Tempest Keep"}}) -- Hurricane Boots
S(39997, {{k="v", item=32429, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Boots of Shackled Souls
S(40000, {{k="v", item=32430, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Bracers of Shackled Souls
S(40001, {{k="v", item=32431, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Greaves of Shackled Souls
S(40002, {{k="v", item=32432, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Waistguard of Shackled Souls
S(40003, {{k="v", item=32433, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Redeemed Soul Moccasins
S(40004, {{k="v", item=32434, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Redeemed Soul Wristguards
S(40005, {{k="v", item=32435, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Redeemed Soul Legguards
S(40006, {{k="v", item=32436, cost=80000, npc=23159, name="Okuno", zone="Black Temple"}}) -- Redeemed Soul Cinch
S(41156, {{k="d", item=32744, zone="Black Temple"}}) -- Bracers of Renewed Life
S(41157, {{k="d", item=32745, zone="Black Temple"}}) -- Shoulderpads of Renewed Life
S(41158, {{k="d", item=32746, zone="Black Temple"}}) -- Swiftstrike Bracers
S(41160, {{k="d", item=32747, zone="Black Temple"}}) -- Swiftstrike Shoulders
S(41161, {{k="d", item=32748, zone="Black Temple"}}) -- Bindings of Lightning Reflexes
S(41162, {{k="d", item=32749, zone="Black Temple"}}) -- Shoulders of Lightning Reflexes
S(41163, {{k="d", item=32750, zone="Black Temple"}}) -- Living Earth Bindings
S(41164, {{k="d", item=32751, zone="Black Temple"}}) -- Living Earth Shoulders
-- DATA_END
