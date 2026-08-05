local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla Tailoring recipes: where each recipe is
-- obtained. Keyed by crafting spell ID (same as TailoringData.lua).
-- Generated from Wowhead classic data 2026-08-05.

local S = ns.NewSourceDB("TAILORING")

-- DATA_START (generated; do not hand-edit between markers)
S(2387, {{k="t"}}) -- Linen Cloak
S(2393, {{k="t", cost=25}}) -- White Linen Shirt
S(2963, {{k="t"}}) -- Bolt of Linen Cloth
S(3915, {{k="t"}}) -- Brown Linen Shirt
S(12044, {{k="t"}}) -- Simple Linen Pants
S(2385, {{k="t", cost=50}}) -- Brown Linen Vest
S(8776, {{k="t", cost=50}}) -- Linen Belt
S(12045, {{k="t", cost=50}}) -- Simple Linen Boots
S(3914, {{k="t", cost=50}}) -- Brown Linen Pants
S(7623, {{k="t", cost=50}}) -- Brown Linen Robe
S(7624, {{k="t", cost=50}}) -- White Linen Robe
S(3840, {{k="t", cost=100}}) -- Heavy Linen Gloves
S(2389, {{k="w", item=2598}}) -- Red Linen Robe
S(2392, {{k="t", cost=50}}) -- Red Linen Shirt
S(2394, {{k="t", cost=50}}) -- Blue Linen Shirt
S(8465, {{k="t", cost=50}}) -- Simple Dress
S(3755, {{k="t", cost=100}}) -- Linen Bag
S(7629, {{k="w", item=6271}}) -- Red Linen Vest
S(7630, {{k="v", item=6270, cost=188, npc=3364, name="Borya", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=6270, cost=210, npc=3485, name="Wrahk", zone="The Barrens", limited=true, faction="Horde"},
         {k="v", item=6270, cost=211, npc=66, name="Tharynn Bouden", zone="Elwynn Forest", limited=true, faction="Alliance"},
         {k="v", item=6270, cost=210, npc=4189, name="Valdaron", zone="Darkshore", limited=true, faction="Alliance"}}) -- Blue Linen Vest
S(2397, {{k="t", cost=200}}) -- Reinforced Linen Cape
S(3841, {{k="t", cost=200}}) -- Green Linen Bracers
S(2386, {{k="t", cost=200}}) -- Linen Boots
S(2395, {{k="t", cost=300}}) -- Barbaric Linen Vest
S(2396, {{k="t", cost=200}}) -- Green Linen Shirt
S(3842, {{k="t", cost=300}}) -- Handstitched Linen Britches
S(6686, {{k="v", item=5771, cost=200, npc=843, name="Gina MacGregor", zone="Westfall", limited=true, faction="Alliance"},
         {k="v", item=5771, cost=210, npc=3005, name="Mahu", zone="Thunder Bluff", limited=true, faction="Horde"},
         {k="v", item=5771, cost=200, npc=4189, name="Valdaron", zone="Darkshore", limited=true, faction="Alliance"},
         {k="v", item=5771, cost=200, npc=3556, name="Andrew Hilbert", zone="Silverpine Forest", limited=true, faction="Horde"},
         {k="d", item=5771, npc=590, name="Defias Looter", zone="Westfall"},
         {k="d", item=5771, npc=3530, name="Pyrewood Tailor", zone="Silverpine Forest"},
         {k="d", item=5771, npc=3531, name="Moonrage Tailor", zone="Silverpine Forest"}}) -- Red Linen Bag
S(7633, {{k="v", item=6272, cost=300, npc=4168, name="Elynna", zone="Darnassus", limited=true, faction="Alliance"},
         {k="v", item=6272, cost=315, npc=3485, name="Wrahk", zone="The Barrens", limited=true, faction="Horde"},
         {k="v", item=6272, cost=300, npc=3499, name="Ranik", zone="The Barrens", limited=true},
         {k="v", item=6272, cost=315, npc=1250, name="Drake Lindgren", zone="Elwynn Forest", limited=true, faction="Alliance"}}) -- Blue Linen Robe
S(2402, {{k="t", cost=250}}) -- Woolen Cape
S(2964, {{k="t", cost=100}}) -- Bolt of Woolen Cloth
S(12046, {{k="t", cost=300}}) -- Simple Kilt
S(3757, {{k="t", cost=200}}) -- Woolen Bag
S(3845, {{k="t", cost=300}}) -- Soft-soled Linen Boots
S(2399, {{k="t", cost=300}}) -- Green Woolen Vest
S(3843, {{k="t", cost=400}}) -- Heavy Woolen Gloves
S(6521, {{k="t", cost=400}}) -- Pearl-clasped Cloak
S(2401, {{k="t", cost=300}}) -- Woolen Boots
S(3758, {{k="w", item=4292}}) -- Green Woolen Bag
S(3847, {{k="w", item=4345}}) -- Red Woolen Boots
S(2406, {{k="t", cost=200}}) -- Gray Woolen Shirt
S(3844, {{k="w", item=4346}}) -- Heavy Woolen Cloak
S(7639, {{k="v", item=6274, cost=400, npc=843, name="Gina MacGregor", zone="Westfall", limited=true, faction="Alliance"},
         {k="v", item=6274, cost=376, npc=3364, name="Borya", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=6274, cost=355, npc=1347, name="Alexandra Bolero", zone="Stormwind City", limited=true, faction="Alliance"},
         {k="v", item=6274, cost=421, npc=2394, name="Mallen Swain", zone="Hillsbrad Foothills", limited=true, faction="Horde"}}) -- Blue Overalls
S(2403, {{k="w", item=2601}}) -- Gray Woolen Robe
S(3848, {{k="t", cost=500}}) -- Double-stitched Woolen Shoulders
S(3850, {{k="t", cost=500}}) -- Heavy Woolen Pants
S(3866, {{k="t", cost=250}}) -- Stylish Red Shirt
S(8467, {{k="t", cost=250}}) -- White Woolen Dress
S(6688, {{k="v", item=5772, cost=500, npc=3537, name="Zixil", zone="Hillsbrad Foothills", limited=true},
         {k="v", item=5772, cost=526, npc=777, name="Amy Davenport", zone="Redridge Mountains", limited=true, faction="Alliance"},
         {k="v", item=5772, cost=470, npc=3364, name="Borya", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=5772, cost=526, npc=3485, name="Wrahk", zone="The Barrens", limited=true, faction="Horde"},
         {k="d", item=5772, npc=2264, name="Hillsbrad Tailor", zone="Hillsbrad Foothills"},
         {k="d", item=5772, npc=450, name="Defias Renegade Mage", zone="Westfall"}}) -- Red Woolen Bag
S(7643, {{k="v", item=6275, cost=842, npc=4168, name="Elynna", zone="Darnassus", limited=true, faction="Alliance"},
         {k="v", item=6275, cost=800, npc=3499, name="Ranik", zone="The Barrens", limited=true},
         {k="v", item=6275, cost=847, npc=2669, name="Sheri Zipstitch", zone="Duskwood", limited=true, faction="Alliance"},
         {k="v", item=6275, cost=842, npc=1454, name="Jennabink Powerseam", zone="Wetlands", limited=true, faction="Alliance"}}) -- Greater Adept's Robe
S(3849, {{k="w", item=4347}}) -- Reinforced Woolen Shoulders
S(7892, {{k="w", item=6390}}) -- Stylish Blue Shirt
S(7893, {{k="w", item=6391}}) -- Stylish Green Shirt
S(12047, {{k="w", item=10316}}) -- Colorful Kilt
S(3839, {{k="t", cost=500}}) -- Bolt of Silk Cloth
S(3851, {{k="w", item=4349}}) -- Phoenix Pants
S(3855, {{k="t", cost=750}}) -- Spidersilk Boots
S(3868, {{k="w", item=4348}}) -- Phoenix Gloves
S(3852, {{k="t", cost=750}}) -- Gloves of Meditation
S(3869, {{k="v", item=14627, cost=847, npc=2668, name="Danielle Zipstitch", zone="Duskwood", limited=true, faction="Alliance"}}) -- Bright Yellow Shirt
S(6690, {{k="t", cost=1000}}) -- Lesser Wizard's Robe
S(3856, {{k="w", item=4350}}) -- Spider Silk Slippers
S(8758, {{k="t", cost=600}}) -- Azure Silk Pants
S(3854, {{k="v", item=7114, cost=1052, npc=2679, name="Wenna Silkbeard", zone="Wetlands", limited=true, faction="Alliance"},
         {k="v", item=7114, cost=1000, npc=9636, name="Kireena", zone="Desolace", limited=true, faction="Horde"}}) -- Azure Silk Gloves
S(8760, {{k="t", cost=600}}) -- Azure Silk Hood
S(8780, {{k="w", item=7092}}) -- Hands of Darkness
S(3813, {{k="t", cost=800}}) -- Small Silk Pack
S(3859, {{k="t", cost=750}}) -- Azure Silk Vest
S(6692, {{k="d", item=5773, npc=910, name="Defias Enchanter", zone="Duskwood"},
         {k="d", item=5773, npc=2337, name="Dark Strand Voidcaller", zone="Darkshore"}}) -- Robes of Arcana
S(8782, {{k="w", item=7091}}) -- Truefaith Gloves
S(3870, {{k="v", item=6401, cost=1100, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="v", item=6401, cost=1164, npc=2669, name="Sheri Zipstitch", zone="Duskwood", limited=true, faction="Alliance"},
         {k="v", item=6401, cost=1157, npc=2394, name="Mallen Swain", zone="Hillsbrad Foothills", limited=true, faction="Horde"}}) -- Dark Silk Shirt
S(8483, {{k="t", cost=450}}) -- White Swashbuckler's Shirt
S(8762, {{k="t", cost=675}}) -- Silk Headband
S(3857, {{k="v", item=14630, cost=1000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="v", item=14630, cost=1052, npc=2670, name="Xizk Goodstitch", zone="Stranglethorn Vale", limited=true}}) -- Enchanter's Cowl
S(8784, {{k="w", item=7090}}) -- Green Silk Armor
S(3858, {{k="w", item=4351}}) -- Shadow Hood
S(3871, {{k="t", cost=450}}) -- Formal White Shirt
S(8764, {{k="t", cost=810}}) -- Earthen Vest
S(3860, {{k="w", item=4352}}) -- Boots of the Enchanter
S(3865, {{k="t", cost=1000}}) -- Bolt of Mageweave
S(6693, {{k="w", item=5774}}) -- Green Silk Pack
S(8489, {{k="t", cost=675}}) -- Red Swashbuckler's Shirt
S(8766, {{k="t", cost=900}}) -- Azure Silk Belt
S(8772, {{k="t", cost=900}}) -- Crimson Silk Belt
S(8786, {{k="v", item=7089, cost=1333, npc=6574, name="Jun'ha", zone="Arathi Highlands", limited=true, faction="Horde"},
         {k="v", item=7089, cost=1500, npc=6576, name="Brienna Starglow", zone="Feralas", limited=true, faction="Alliance"}}) -- Azure Silk Cloak
S(3863, {{k="w", item=4353}}) -- Spider Belt
S(8774, {{k="t", cost=900}}) -- Green Silken Shoulders
S(8789, {{k="v", item=7087, cost=1200, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="v", item=7087, cost=1200, npc=2670, name="Xizk Goodstitch", zone="Stranglethorn Vale", limited=true}}) -- Crimson Silk Cloak
S(3861, {{k="t", cost=900}}) -- Long Silken Cloak
S(3872, {{k="w", item=4354}}) -- Rich Purple Silk Shirt
S(6695, {{k="d", item=5775, npc=2242, name="Syndicate Spy", zone="Alterac Mountains"},
         {k="d", item=5775, npc=4834, name="Theramore Infiltrator", zone="Dustwallow Marsh"},
         {k="d", item=5775, npc=2434, name="Shadowy Assassin", zone="Hillsbrad Foothills"}}) -- Black Silk Pack
S(8791, {{k="t", cost=2250}}) -- Crimson Silk Vest
S(8770, {{k="t", cost=900}}) -- Robe of Power
S(8793, {{k="w", item=7084}}) -- Crimson Silk Shoulders
S(8795, {{k="w", item=7085}}) -- Azure Shoulders
S(21945, {{k="w", item=17724}}) -- Green Holiday Shirt
S(8797, {{k="w", item=7086}}) -- Earthen Silk Belt
S(8799, {{k="t", cost=2700}}) -- Crimson Silk Pantaloons
S(3862, {{k="v", item=4355, cost=1578, npc=2381, name="Micha Yance", zone="Hillsbrad Foothills", limited=true, faction="Alliance"},
         {k="v", item=4355, cost=1578, npc=6567, name="Ghok'kah", zone="Dustwallow Marsh", limited=true, faction="Horde"}}) -- Icy Cloak
S(3864, {{k="w", item=4356}}) -- Star Belt
S(3873, {{k="v", item=10728, cost=1578, npc=2663, name="Narkk", zone="Stranglethorn Vale", limited=true}}) -- Black Swashbuckler's Shirt
S(8802, {{k="v", item=7088, cost=5263, npc=6568, name="Vizzklick", zone="Tanaris", limited=true}}) -- Crimson Silk Robe
S(12048, {{k="t", cost=3600}}) -- Black Mageweave Vest
S(12049, {{k="t", cost=3600}}) -- Black Mageweave Leggings
S(8804, {{k="t", cost=4500}}) -- Crimson Silk Gloves
S(12050, {{k="t", cost=3600}}) -- Black Mageweave Robe
S(12052, {{k="t", cost=4500}}) -- Shadoweave Pants
S(12053, {{k="t", cost=4500}}) -- Black Mageweave Gloves
S(12055, {{k="t", cost=4950}}) -- Shadoweave Robe
S(12056, {{k="w", item=10300}}) -- Red Mageweave Vest
S(12059, {{k="w", item=10301}}) -- White Bandit Mask
S(12060, {{k="w", item=10302}}) -- Red Mageweave Pants
S(12061, {{k="t", cost=2250}}) -- Orange Mageweave Shirt
S(12064, {{k="v", item=10311, cost=3000, npc=4168, name="Elynna", zone="Darnassus", limited=true, faction="Alliance"},
         {k="v", item=10311, cost=3157, npc=3005, name="Mahu", zone="Thunder Bluff", limited=true, faction="Horde"}}) -- Orange Martial Shirt
S(12065, {{k="t", cost=4500}}) -- Mageweave Bag
S(12066, {{k="w", item=10312}}) -- Red Mageweave Gloves
S(12067, {{k="t", cost=4500}}) -- Dreamweave Gloves
S(12069, {{k="t", cost=4500}}) -- Cindercloth Robe
S(12070, {{k="t", cost=4500}}) -- Dreamweave Vest
S(12071, {{k="t", cost=5400}}) -- Shadoweave Gloves
S(27658, {{k="v", item=22307, cost=6750, npc=15419, name="Kania", zone="Silithus"},
         {k="v", item=22307, cost=6000, npc=4228, name="Vaean", zone="Darnassus", faction="Alliance"},
         {k="v", item=22307, cost=5333, npc=1318, name="Jessara Cordell", zone="Stormwind City", faction="Alliance"},
         {k="v", item=22307, cost=6000, npc=5757, name="Lilly", zone="Silverpine Forest", faction="Horde"}}) -- Enchanted Mageweave Pouch
S(12072, {{k="t", cost=6000}}) -- Black Mageweave Headband
S(12073, {{k="t", cost=6000}}) -- Black Mageweave Boots
S(12074, {{k="t", cost=6000}}) -- Black Mageweave Shoulders
S(12075, {{k="v", item=10314, cost=3764, npc=3364, name="Borya", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=10314, cost=4210, npc=8681, name="Outfitter Eric", zone="Ironforge", limited=true, faction="Alliance"}}) -- Lavender Mageweave Shirt
S(12076, {{k="t", cost=5850}}) -- Shadoweave Shoulders
S(12077, {{k="t", cost=5000}}) -- Simple Black Dress
S(12078, {{k="w", item=10315}}) -- Red Mageweave Shoulders
S(12079, {{k="t", cost=6500}}) -- Red Mageweave Bag
S(12080, {{k="v", item=10317, cost=3764, npc=3364, name="Borya", zone="Orgrimmar", limited=true, faction="Horde"},
         {k="v", item=10317, cost=4210, npc=8681, name="Outfitter Eric", zone="Ironforge", limited=true, faction="Alliance"}}) -- Pink Mageweave Shirt
S(12081, {{k="v", item=10318, cost=7000, npc=2672, name="Cowardly Crosby", zone="Stranglethorn Vale", limited=true}}) -- Admiral's Hat
S(12082, {{k="t", cost=6300}}) -- Shadoweave Boots
S(12084, {{k="w", item=10320}}) -- Red Mageweave Headband
S(12085, {{k="v", item=10321, cost=4736, npc=8681, name="Outfitter Eric", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=10321, cost=4500, npc=4577, name="Millie Gregorian", zone="Undercity", limited=true, faction="Horde"}}) -- Tuxedo Shirt
S(12086, {{k="q", item=10463, quest=3402, name="The Undermarket"}}) -- Shadoweave Mask
S(12088, {{k="t", cost=7500}}) -- Cindercloth Boots
S(12089, {{k="v", item=10323, cost=4736, npc=8681, name="Outfitter Eric", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=10323, cost=4500, npc=4577, name="Millie Gregorian", zone="Undercity", limited=true, faction="Horde"}}) -- Tuxedo Pants
S(12091, {{k="v", item=10325, cost=8888, npc=1347, name="Alexandra Bolero", zone="Stormwind City", limited=true, faction="Alliance"},
         {k="v", item=10325, cost=10526, npc=3005, name="Mahu", zone="Thunder Bluff", limited=true, faction="Horde"}}) -- White Wedding Dress
S(12092, {{k="t", cost=7500}}) -- Dreamweave Circlet
S(12093, {{k="v", item=10326, cost=5263, npc=8681, name="Outfitter Eric", zone="Ironforge", limited=true, faction="Alliance"},
         {k="v", item=10326, cost=5000, npc=4577, name="Millie Gregorian", zone="Undercity", limited=true, faction="Horde"}}) -- Tuxedo Jacket
S(18401, {{k="t", cost=10000}}) -- Bolt of Runecloth
S(18560, {{k="v", item=14526, cost=21052, npc=11189, name="Qia", zone="Winterspring"}}) -- Mooncloth
S(26403, {{k="q", item=21722, quest=8878, name="Festive Recipes"}}) -- Festive Red Dress
S(26407, {{k="q", item=21723, quest=8878, name="Festive Recipes"}}) -- Festive Red Pant Suit
S(18402, {{k="t", cost=10000}}) -- Runecloth Belt
S(18403, {{k="w", item=14466}}) -- Frostweave Tunic
S(18404, {{k="w", item=14467}}) -- Frostweave Robe
S(18405, {{k="v", item=14468, cost=12000, npc=11189, name="Qia", zone="Winterspring", limited=true}}) -- Runecloth Bag
S(18406, {{k="v", item=14469, cost=12000, npc=7940, name="Darnall", zone="Moonglade", limited=true}}) -- Runecloth Robe
S(18407, {{k="w", item=14470}}) -- Runecloth Tunic
S(18408, {{k="d", item=14471, npc=5861, name="Twilight Fire Guard", zone="Searing Gorge"}}) -- Cindercloth Vest
S(26085, {{k="v", item=21358, cost=12631, npc=6568, name="Vizzklick", zone="Tanaris"}}) -- Soul Pouch
S(18409, {{k="v", item=14472, cost=12000, npc=7940, name="Darnall", zone="Moonglade", limited=true}}) -- Runecloth Cloak
S(18410, {{k="d", item=14473, npc=7864, name="Lingering Highborne", zone="Azshara"}}) -- Ghostweave Belt
S(18411, {{k="w", item=14474}}) -- Frostweave Gloves
S(18412, {{k="d", item=14476, npc=5861, name="Twilight Fire Guard", zone="Searing Gorge"}}) -- Cindercloth Gloves
S(18413, {{k="d", item=14477, npc=7864, name="Lingering Highborne", zone="Azshara"},
         {k="d", item=14477, npc=8538, name="Unseen Servant", zone="Eastern Plaguelands"}}) -- Ghostweave Gloves
S(18414, {{k="w", item=14478}}) -- Brightcloth Robe
S(18415, {{k="w", item=14479}}) -- Brightcloth Gloves
S(18416, {{k="d", item=14480, npc=8538, name="Unseen Servant", zone="Eastern Plaguelands"}}) -- Ghostweave Vest
S(18417, {{k="v", item=14481, cost=16842, npc=11189, name="Qia", zone="Winterspring", limited=true}}) -- Runecloth Gloves
S(18418, {{k="d", item=14482, npc=7037, name="Thaurissan Firewalker", zone="Burning Steppes"}}) -- Cindercloth Cloak
S(18419, {{k="v", item=14483, cost=16000, npc=12022, name="Lorelae Wintersong", zone="Moonglade", limited=true}}) -- Felcloth Pants
S(18420, {{k="w", item=14484}}) -- Brightcloth Cloak
S(18421, {{k="d", item=14485, npc=8551, name="Dark Summoner", zone="Eastern Plaguelands"}}) -- Wizardweave Leggings
S(18422, {{k="d", item=14486, npc=9026, name="Overmaster Pyron"}}) -- Cloak of Fire
S(27659, {{k="v", item=22308, cost=22500, npc=15419, name="Kania", zone="Silithus"},
         {k="v", item=22308, cost=22500, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Enchanted Runecloth Bag
S(27724, {{k="v", item=22310, cost=22500, npc=15179, name="Mishta", zone="Silithus"}}) -- Cenarion Herb Bag
S(18423, {{k="v", item=14488, cost=20000, npc=7940, name="Darnall", zone="Moonglade", limited=true}}) -- Runecloth Boots
S(18424, {{k="w", item=14489}}) -- Frostweave Pants
S(18434, {{k="d", item=14490, npc=7037, name="Thaurissan Firewalker", zone="Burning Steppes"}}) -- Cindercloth Pants
S(18436, {{k="d", item=14493, npc=7437, name="Cobalt Mageweaver", zone="Winterspring"}}) -- Robe of Winter Night
S(18437, {{k="w", item=14492}}) -- Felcloth Boots
S(18438, {{k="w", item=14491}}) -- Runecloth Pants
S(22813, {{k="q", quest=5519, name="The Gordok Ogre Suit", zone="Dire Maul"}}) -- Gordok Ogre Suit
S(26086, {{k="u"}}) -- Felcloth Bag
S(18439, {{k="w", item=14494}}) -- Brightcloth Pants
S(18440, {{k="w", item=14497}}) -- Mooncloth Leggings
S(18441, {{k="d", item=14495, npc=10384, name="Spectral Citizen", zone="Stratholme"}}) -- Ghostweave Pants
S(18442, {{k="w", item=14496}}) -- Felcloth Hood
S(19435, {{k="q", quest=6032, name="Sacred Cloth", zone="Felwood"}}) -- Mooncloth Boots
S(23662, {{k="v", item=19215, cost=23157, npc=11557, name="Meilosh", zone="Felwood"}}) -- Wisdom of the Timbermaw
S(23664, {{k="v", item=19216, cost=23157, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
         {k="v", item=19216, cost=23157, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"},
         {k="v", item=19216, cost=23157, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades"}}) -- Argent Boots
S(18444, {{k="w", item=14498}}) -- Runecloth Headband
S(18445, {{k="w", item=14499}}) -- Mooncloth Bag
S(18446, {{k="d", item=14500, npc=8526, name="Dark Caster", zone="Eastern Plaguelands"}}) -- Wizardweave Robe
S(18447, {{k="w", item=14501}}) -- Mooncloth Vest
S(18448, {{k="w", item=14507}}) -- Mooncloth Shoulders
S(18449, {{k="w", item=14504}}) -- Runecloth Shoulders
S(18450, {{k="d", item=14505, npc=8526, name="Dark Caster", zone="Eastern Plaguelands"}}) -- Wizardweave Turban
S(18451, {{k="w", item=14506}}) -- Felcloth Robe
S(18452, {{k="w", item=14509}}) -- Mooncloth Circlet
S(18453, {{k="w", item=14508}}) -- Felcloth Shoulders
S(18454, {{k="w", item=14511}}) -- Gloves of Spell Mastery
S(18455, {{k="w", item=14510}}) -- Bottomless Bag
S(18456, {{k="d", item=14512, npc=10812, name="Grand Crusader Dathrohan", zone="Stratholme"}}) -- Truefaith Vestments
S(18457, {{k="d", item=14513, npc=9264, name="Firebrand Pyromancer", zone="Blackrock Spire"}}) -- Robe of the Archmage
S(18458, {{k="d", item=14514, npc=1853, name="Darkmaster Gandling", zone="Scholomance"}}) -- Robe of the Void
S(20848, {{k="v", item=17017, cost=190588, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Flarecore Mantle
S(20849, {{k="v", item=17018, cost=84705, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Flarecore Gloves
S(22759, {{k="d", item=18265, zone="Molten Core"}}) -- Flarecore Wraps
S(22866, {{k="d", item=18414, zone="Dire Maul"}}) -- Belt of the Archmage
S(22867, {{k="d", item=18415, zone="Dire Maul"}}) -- Felcloth Gloves
S(22868, {{k="d", item=18416, zone="Dire Maul"}}) -- Inferno Gloves
S(22869, {{k="d", item=18417, zone="Dire Maul"}}) -- Mooncloth Gloves
S(22870, {{k="d", item=18418, zone="Dire Maul"}}) -- Cloak of Warding
S(22902, {{k="v", item=18487, cost=40000, npc=14371, name="Shen'dralar Provisioner", zone="Dire Maul", limited=true}}) -- Mooncloth Robe
S(23663, {{k="v", item=19218, cost=42105, npc=11557, name="Meilosh", zone="Felwood"}}) -- Mantle of the Timbermaw
S(23665, {{k="v", item=19217, cost=42105, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
         {k="v", item=19217, cost=45000, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"},
         {k="v", item=19217, cost=42105, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades"}}) -- Argent Shoulders
S(23666, {{k="v", item=19219, cost=63529, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths", limited=true}}) -- Flarecore Robe
S(23667, {{k="v", item=19220, cost=95294, npc=12944, name="Lokhtos Darkbargainer", zone="Blackrock Depths"}}) -- Flarecore Leggings
S(24091, {{k="v", item=19764, cost=52941, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodvine Vest
S(24092, {{k="v", item=19765, cost=52941, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodvine Leggings
S(24093, {{k="v", item=19766, cost=56250, npc=14921, name="Rin'wosho the Trader", zone="Stranglethorn Vale"}}) -- Bloodvine Boots
S(24901, {{k="d", item=20546, zone="Silithus"}}) -- Runed Stygian Leggings
S(24902, {{k="d", item=20548, zone="Silithus"}}) -- Runed Stygian Belt
S(24903, {{k="d", item=20547, zone="Silithus"}}) -- Runed Stygian Boots
S(26087, {{k="d", item=21371, zone="Molten Core"}}) -- Core Felcloth Bag
S(27660, {{k="d", item=22309, npc=11487, name="Magister Kalendris", zone="Dire Maul"}}) -- Big Bag of Enchantment
S(27725, {{k="v", item=22312, cost=56250, npc=15179, name="Mishta", zone="Silithus"}}) -- Satchel of Cenarius
S(28205, {{k="u"}}) -- Glacial Gloves
S(28207, {{k="u"}}) -- Glacial Vest
S(28208, {{k="u"}}) -- Glacial Cloak
S(28209, {{k="u"}}) -- Glacial Wrists
S(28210, {{k="v", item=22683, cost=95294, npc=15179, name="Mishta", zone="Silithus"}}) -- Gaea's Embrace
S(28480, {{k="v", item=22774, cost=52941, npc=15179, name="Mishta", zone="Silithus"}}) -- Sylvan Vest
S(28481, {{k="v", item=22773, cost=52941, npc=15179, name="Mishta", zone="Silithus"}}) -- Sylvan Crown
S(28482, {{k="v", item=22772, cost=52941, npc=15179, name="Mishta", zone="Silithus"}}) -- Sylvan Shoulders
-- DATA_END
