local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla Cooking recipes: where each recipe is
-- obtained. Keyed by crafting spell ID (same as CookingData.lua).
-- Generated from Wowhead classic data 2026-08-06.

local S = ns.NewSourceDB("COOKING")

-- DATA_START (generated; do not hand-edit between markers)
S(2538, {{k="t"}}) -- Charred Wolf Meat (auto-learned with Apprentice Cooking)
S(2540, {{k="t"}}) -- Roasted Boar Meat (auto-learned with Apprentice Cooking)
S(7751, {{k="v", item=6325, cost=42, npc=5494, name="Catherine Leland", zone="Stormwind City", faction="Alliance"},
         {k="v", item=6325, cost=42, npc=4574, name="Lizbeth Cromwell", zone="Undercity", faction="Horde"},
         {k="v", item=6325, cost=40, npc=3029, name="Sewa Mistrunner", zone="Thunder Bluff", faction="Horde"},
         {k="v", item=6325, cost=40, npc=1684, name="Khara Deepwater", zone="Loch Modan", faction="Alliance"}}) -- Brilliant Smallfish
S(7752, {{k="v", item=6326, cost=40, npc=5162, name="Tansy Puddlefizz", zone="Ironforge", faction="Alliance"},
         {k="v", item=6326, cost=40, npc=5942, name="Zansoa", zone="Durotar", faction="Horde"},
         {k="v", item=6326, cost=35, npc=10118, name="Nessa Shadowsong", zone="Teldrassil", faction="Alliance"},
         {k="v", item=6326, cost=37, npc=3550, name="Martine Tramblay", zone="Tirisfal Glades", faction="Horde"}}) -- Slitherskin Mackerel
S(8604, {{k="t"}}) -- Herb Baked Egg (auto-learned with Apprentice Cooking)
S(15935, {{k="v", item=12226, cost=25, npc=2118, name="Abigail Shiel", zone="Tirisfal Glades", faction="Horde"}}) -- Crispy Bat Wing
S(21143, {{k="v", item=17200, cost=25, npc=13433, name="Wulmort Jinglepocket", zone="Ironforge", faction="Alliance"},
          {k="v", item=17200, cost=25, npc=13435, name="Khole Jinglepocket", zone="Stormwind City", faction="Alliance"},
          {k="v", item=17200, cost=25, npc=13420, name="Penney Copperpinch", zone="Orgrimmar", faction="Horde"},
          {k="v", item=17200, cost=25, npc=13429, name="Nardstrum Copperpinch", zone="Undercity", faction="Horde"}}) -- Gingerbread Cookie (Winter Veil only)
S(6412, {{k="q", item=5482, quest=4161, name="Recipe of the Kaldorei", zone="Teldrassil", faction="Alliance"}}) -- Kaldorei Spider Kabob
S(6413, {{k="v", item=5483, cost=147, npc=3881, name="Grimtak", zone="Durotar", faction="Horde"}}) -- Scorpid Surprise
S(2795, {{k="v", item=2889, cost=254, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=2889, quest=384, name="Beer Basted Boar Ribs", zone="Dun Morogh", faction="Alliance"}}) -- Beer Basted Boar Ribs
S(2539, {{k="t", cost=50}}) -- Spiced Wolf Meat
S(6414, {{k="v", item=5484, cost=252, npc=3081, name="Wunna Darkmane", zone="Mulgore", faction="Horde"}}) -- Roasted Kodo Meat
S(21144, {{k="v", item=17201, cost=240, npc=13433, name="Wulmort Jinglepocket", zone="Ironforge", faction="Alliance"},
          {k="v", item=17201, cost=240, npc=13435, name="Khole Jinglepocket", zone="Stormwind City", faction="Alliance"},
          {k="v", item=17201, cost=240, npc=13420, name="Penney Copperpinch", zone="Orgrimmar", faction="Horde"},
          {k="v", item=17201, cost=240, npc=13429, name="Nardstrum Copperpinch", zone="Undercity", faction="Horde"}}) -- Egg Nog (Winter Veil only)
S(8607, {{k="v", item=6892, cost=250, npc=1465, name="Drac Roughcut", zone="Loch Modan", faction="Alliance"},
         {k="v", item=6892, cost=250, npc=3556, name="Andrew Hilbert", zone="Silverpine Forest", faction="Horde"}}) -- Smoked Bear Meat
S(2542, {{k="v", item=2697, cost=423, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=2697, quest=22, name="Goretusk Liver Pie", zone="Westfall", faction="Alliance"}}) -- Goretusk Liver Pie
S(6415, {{k="v", item=5485, cost=400, npc=4200, name="Laird", zone="Darkshore", faction="Alliance"}}) -- Fillet of Frenzy
S(6416, {{k="v", item=5486, cost=391, npc=3482, name="Tari'qa", zone="The Barrens", faction="Horde"},
         {k="q", item=5486, quest=2178, name="Easy Strider Living", zone="Darkshore", faction="Alliance"}}) -- Strider Stew
S(6499, {{k="t", cost=100}}) -- Boiled Clams
S(7753, {{k="v", item=6328, cost=400, npc=5162, name="Tansy Puddlefizz", zone="Ironforge", faction="Alliance"},
         {k="v", item=6328, cost=400, npc=3027, name="Naal Mistrunner", zone="Thunder Bluff", faction="Horde"},
         {k="v", item=6328, cost=400, npc=1684, name="Khara Deepwater", zone="Loch Modan", faction="Alliance"},
         {k="v", item=6328, cost=421, npc=4574, name="Lizbeth Cromwell", zone="Undercity", faction="Horde"}}) -- Longjaw Mud Snapper
S(7754, {{k="v", item=6329, cost=400, npc=1684, name="Khara Deepwater", zone="Loch Modan", faction="Alliance"}}) -- Loch Frenzy Delight
S(7827, {{k="v", item=6368, cost=400, npc=3497, name="Kilxx", zone="The Barrens"},
         {k="v", item=6368, cost=421, npc=5494, name="Catherine Leland", zone="Stormwind City", faction="Alliance"},
         {k="v", item=6368, cost=355, npc=3333, name="Shankys", zone="Orgrimmar", faction="Horde"},
         {k="v", item=6368, cost=355, npc=10118, name="Nessa Shadowsong", zone="Teldrassil", faction="Alliance"}}) -- Rainbow Fin Albacore
S(3371, {{k="v", item=3679, cost=423, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=3679, quest=418, name="Thelsamar Blood Sausages", zone="Loch Modan", faction="Alliance"}}) -- Blood Sausage
S(2541, {{k="t", cost=100}}) -- Coyote Steak
S(2543, {{k="v", item=728, cost=211, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=728, quest=38, name="Westfall Stew", zone="Westfall", faction="Alliance"}}) -- Westfall Stew
S(2544, {{k="t", cost=200}}) -- Crab Cake
S(3370, {{k="v", item=3678, cost=423, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=3678, quest=385, name="Crocolisk Hunting", zone="Loch Modan", faction="Alliance"}}) -- Crocolisk Steak
S(25704, {{k="v", item=21099, cost=444, npc=5483, name="Erika Tate", zone="Stormwind City", faction="Alliance"},
          {k="v", item=21099, cost=444, npc=5160, name="Emrul Riknussun", zone="Ironforge", faction="Alliance"},
          {k="v", item=21099, cost=444, npc=3400, name="Xen'to", zone="Orgrimmar", faction="Horde"},
          {k="v", item=21099, cost=444, npc=4553, name="Ronald Burch", zone="Undercity", faction="Horde"}}) -- Smoked Sagefish
S(2545, {{k="v", item=2698, cost=423, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="w", item=2698}}) -- Cooked Crab Claw
S(8238, {{k="w", item=6661}}) -- Savory Deviate Delight
S(3372, {{k="v", item=3680, cost=1694, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=3680, quest=127, name="Selling Fish", zone="Redridge Mountains", faction="Alliance"}}) -- Murloc Fin Soup
S(6417, {{k="q", item=5487, quest=862, name="Dig Rat Stew", zone="The Barrens", faction="Horde"}}) -- Dig Rat Stew
S(6501, {{k="v", item=5528, cost=752, npc=4305, name="Kriggon Talsone", zone="Westfall", faction="Alliance"},
         {k="v", item=5528, cost=842, npc=4307, name="Heldan Galesong", zone="Darkshore", faction="Alliance"}}) -- Clam Chowder
S(2547, {{k="v", item=2699, cost=847, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=2699, quest=92, name="Redridge Goulash", zone="Redridge Mountains", faction="Alliance"}}) -- Redridge Goulash
S(2549, {{k="v", item=2701, cost=1694, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=2701, quest=90, name="Seasoned Wolf Kabobs", zone="Duskwood", faction="Alliance"}}) -- Seasoned Wolf Kabob
S(6418, {{k="v", item=5488, cost=355, npc=3482, name="Tari'qa", zone="The Barrens", faction="Horde"}}) -- Crispy Lizard Tail
S(7755, {{k="v", item=6330, cost=1200, npc=3497, name="Kilxx", zone="The Barrens"},
         {k="v", item=6330, cost=1263, npc=5494, name="Catherine Leland", zone="Stormwind City", faction="Alliance"},
         {k="v", item=6330, cost=1066, npc=4553, name="Ronald Burch", zone="Undercity", faction="Horde"},
         {k="v", item=6330, cost=1200, npc=3029, name="Sewa Mistrunner", zone="Thunder Bluff", faction="Horde"}}) -- Bristle Whisker Catfish
S(2546, {{k="t", cost=150}}) -- Dry Pork Ribs
S(2548, {{k="v", item=2700, cost=423, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="w", item=2700}}) -- Succulent Pork Ribs
S(3377, {{k="v", item=3683, cost=1694, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=3683, quest=93, name="Dusky Crab Cakes", zone="Duskwood", faction="Alliance"}}) -- Gooey Spider Cake
S(3397, {{k="v", item=3734, cost=1600, npc=3960, name="Ulthaan", zone="Ashenvale", faction="Alliance"},
         {k="v", item=3734, cost=1600, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="q", item=3734, quest=498, name="The Rescue", zone="Hillsbrad Foothills", faction="Horde"}}) -- Big Bear Steak
S(6419, {{k="v", item=5489, cost=1263, npc=3960, name="Ulthaan", zone="Ashenvale", faction="Alliance"},
         {k="v", item=5489, cost=1200, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Lean Venison
S(3373, {{k="v", item=3681, cost=1694, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=3681, quest=471, name="Apprentice's Duties", zone="Wetlands", faction="Alliance"}}) -- Crocolisk Gumbo
S(3398, {{k="v", item=3735, cost=1800, npc=3489, name="Zargh", zone="The Barrens", faction="Horde"},
         {k="v", item=3735, cost=1800, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true},
         {k="q", item=3735, quest=501, name="Elixir of Pain", zone="Hillsbrad Foothills", faction="Horde"}}) -- Hot Lion Chops
S(6500, {{k="t", cost=300}}) -- Goblin Deviled Clams
S(15853, {{k="v", item=12227, cost=1600, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true}}) -- Lean Wolf Steak
S(3376, {{k="v", item=3682, cost=1694, npc=340, name="Kendor Kabonka", zone="Stormwind City", faction="Alliance"},
         {k="q", item=3682, quest=296, name="Ormer's Revenge", zone="Wetlands", faction="Alliance"}}) -- Curiously Tasty Omelet
S(3399, {{k="q", item=3736, quest=564, name="Costly Menace", zone="Hillsbrad Foothills", faction="Alliance"}}) -- Tasty Lion Steak
S(24418, {{k="v", item=20075, cost=1882, npc=4879, name="Ogg'marr", zone="Dustwallow Marsh", faction="Horde"}}) -- Heavy Crocolisk Stew
S(3400, {{k="q", item=3737, quest=555, name="Soothing Turtle Bisque", zone="Hillsbrad Foothills", faction="Alliance"},
         {k="q", item=3737, quest=7321, name="Soothing Turtle Bisque", zone="Hillsbrad Foothills", faction="Horde"}}) -- Soothing Turtle Bisque
S(4094, {{k="v", item=4609, cost=1052, npc=2814, name="Narj Deepslice", zone="Arathi Highlands", faction="Alliance"},
         {k="v", item=4609, cost=1000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true},
         {k="q", item=4609, quest=703, name="Barbecued Buzzard Wings", zone="Badlands"}}) -- Barbecued Buzzard Wing
S(7213, {{k="v", item=6039, cost=5000, npc=2664, name="Kelsey Yance", zone="Stranglethorn Vale"}}) -- Giant Clam Scorcho
S(7828, {{k="v", item=6369, cost=2315, npc=2664, name="Kelsey Yance", zone="Stranglethorn Vale"},
         {k="v", item=6369, cost=2200, npc=5162, name="Tansy Puddlefizz", zone="Ironforge", faction="Alliance"},
         {k="v", item=6369, cost=1955, npc=3333, name="Shankys", zone="Orgrimmar", faction="Horde"},
         {k="v", item=6369, cost=2315, npc=4574, name="Lizbeth Cromwell", zone="Undercity", faction="Horde"}}) -- Rockscale Cod
S(13028, {{k="v", item=16072, cost=10000, npc=3955, name="Shandrina", zone="Ashenvale", faction="Alliance"},
          {k="v", item=16072, cost=10526, npc=12033, name="Wulan", zone="Desolace", faction="Horde"}}) -- Goldthorn Tea (auto-learned with Expert Cooking; item = Expert Cookbook)
S(15855, {{k="v", item=12228, cost=4444, npc=1148, name="Nerrist", zone="Stranglethorn Vale", faction="Horde"},
          {k="v", item=12228, cost=5263, npc=734, name="Corporal Bluth", zone="Stranglethorn Vale", faction="Alliance"},
          {k="v", item=12228, cost=4705, npc=4879, name="Ogg'marr", zone="Dustwallow Marsh", faction="Horde"},
          {k="v", item=12228, cost=5000, npc=4897, name="Helenia Olden", zone="Dustwallow Marsh", faction="Alliance"}}) -- Roast Raptor
S(15856, {{k="v", item=12229, cost=5000, npc=7947, name="Vivianna", zone="Feralas", faction="Alliance"},
          {k="v", item=12229, cost=5263, npc=8145, name="Sheendra Tallgrass", zone="Feralas", faction="Horde"},
          {k="v", item=12229, cost=5000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true}}) -- Hot Wolf Ribs
S(15861, {{k="v", item=12231, cost=3000, npc=734, name="Corporal Bluth", zone="Stranglethorn Vale", faction="Alliance"},
          {k="v", item=12231, cost=2666, npc=1148, name="Nerrist", zone="Stranglethorn Vale", faction="Horde"},
          {k="v", item=12231, cost=3000, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Jungle Stew
S(15863, {{k="v", item=12232, cost=4444, npc=989, name="Banalash", zone="Swamp of Sorrows", faction="Horde"},
          {k="v", item=12232, cost=4705, npc=4879, name="Ogg'marr", zone="Dustwallow Marsh", faction="Horde"},
          {k="v", item=12232, cost=5000, npc=9636, name="Kireena", zone="Desolace", faction="Horde"},
          {k="v", item=12232, cost=5000, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Carrion Surprise
S(15865, {{k="v", item=12233, cost=3000, npc=4897, name="Helenia Olden", zone="Dustwallow Marsh", faction="Alliance"},
          {k="v", item=12233, cost=3000, npc=8150, name="Janet Hommers", zone="Desolace", faction="Alliance"},
          {k="v", item=12233, cost=3000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true}}) -- Mystery Stew
S(20916, {{k="v", item=17062, cost=2200, npc=2664, name="Kelsey Yance", zone="Stranglethorn Vale"},
          {k="v", item=17062, cost=1955, npc=3333, name="Shankys", zone="Orgrimmar", faction="Horde"},
          {k="v", item=17062, cost=2200, npc=5162, name="Tansy Puddlefizz", zone="Ironforge", faction="Alliance"},
          {k="v", item=17062, cost=2200, npc=2383, name="Lindea Rabonne", zone="Hillsbrad Foothills", faction="Alliance"}}) -- Mithril Headed Trout
S(25954, {{k="v", item=21219, cost=4444, npc=5483, name="Erika Tate", zone="Stormwind City", faction="Alliance"},
          {k="v", item=21219, cost=4444, npc=5160, name="Emrul Riknussun", zone="Ironforge", faction="Alliance"},
          {k="v", item=21219, cost=4444, npc=3400, name="Xen'to", zone="Orgrimmar", faction="Horde"},
          {k="v", item=21219, cost=4444, npc=4553, name="Ronald Burch", zone="Undercity", faction="Horde"}}) -- Sagefish Delight
S(15906, {{k="v", item=12239, cost=6588, npc=4879, name="Ogg'marr", zone="Dustwallow Marsh", faction="Horde"},
          {k="v", item=12239, cost=7000, npc=4897, name="Helenia Olden", zone="Dustwallow Marsh", faction="Alliance"},
          {k="v", item=12239, cost=7000, npc=12246, name="Super-Seller 680", zone="Desolace", limited=true}}) -- Dragonbreath Chili
S(15910, {{k="v", item=12240, cost=7000, npc=8150, name="Janet Hommers", zone="Desolace", faction="Alliance"},
          {k="v", item=12240, cost=7000, npc=9636, name="Kireena", zone="Desolace", faction="Horde"},
          {k="v", item=12240, cost=7000, npc=12245, name="Vendor-Tron 1000", zone="Desolace", limited=true}}) -- Heavy Kodo Stew
S(21175, {{k="t", cost=4000}}) -- Spider Sausage
S(15915, {{k="v", item=16111, cost=10666, npc=989, name="Banalash", zone="Swamp of Sorrows", faction="Horde"},
          {k="v", item=16111, cost=12000, npc=1149, name="Uthok", zone="Stranglethorn Vale", faction="Horde"},
          {k="v", item=16111, cost=11294, npc=4305, name="Kriggon Talsone", zone="Westfall", faction="Alliance"}}) -- Spiced Chili Crab
S(15933, {{k="v", item=16110, cost=10666, npc=2803, name="Malygen", zone="Felwood", faction="Alliance"},
          {k="v", item=16110, cost=12000, npc=2806, name="Bale", zone="Felwood", faction="Horde"},
          {k="v", item=16110, cost=12631, npc=11187, name="Himmik", zone="Winterspring"}}) -- Monster Omelet
S(18238, {{k="v", item=13939, cost=16842, npc=8137, name="Gikkix", zone="Tanaris"}}) -- Spotted Yellowtail
S(18239, {{k="v", item=13940, cost=16000, npc=2664, name="Kelsey Yance", zone="Stranglethorn Vale"}}) -- Cooked Glossy Mightfish
S(18241, {{k="v", item=13941, cost=16000, npc=2664, name="Kelsey Yance", zone="Stranglethorn Vale"}}) -- Filet of Redgill
S(20626, {{k="v", item=16767, cost=3157, npc=8139, name="Jabbey", zone="Tanaris", limited=true}}) -- Undermine Clam Chowder
S(22480, {{k="v", item=18046, cost=12631, npc=8125, name="Dirge Quikcleave", zone="Tanaris"},
          {k="v", item=18046, cost=12631, npc=7733, name="Innkeeper Fizzgrimble", zone="Tanaris"},
          {k="v", item=18046, cost=12000, npc=4782, name="Truk Wildbeard", zone="The Hinterlands", faction="Alliance"}}) -- Tender Wolf Steak
S(18240, {{k="v", item=13942, cost=16842, npc=8137, name="Gikkix", zone="Tanaris"}}) -- Grilled Squid
S(18242, {{k="v", item=13943, cost=16000, npc=2664, name="Kelsey Yance", zone="Stranglethorn Vale"}}) -- Hot Smoked Bass
S(18243, {{k="v", item=13945, cost=21052, npc=8137, name="Gikkix", zone="Tanaris"}}) -- Nightfin Soup
S(18244, {{k="v", item=13946, cost=21052, npc=8137, name="Gikkix", zone="Tanaris"}}) -- Poached Sunscale Salmon
S(18245, {{k="v", item=13947, cost=20000, npc=7947, name="Vivianna", zone="Feralas", faction="Alliance"},
          {k="v", item=13947, cost=21052, npc=8145, name="Sheendra Tallgrass", zone="Feralas", faction="Horde"}}) -- Lobster Stew
S(18246, {{k="v", item=13948, cost=20000, npc=7947, name="Vivianna", zone="Feralas", faction="Alliance"},
          {k="v", item=13948, cost=21052, npc=8145, name="Sheendra Tallgrass", zone="Feralas", faction="Horde"}}) -- Mightfish Steak
S(18247, {{k="v", item=13949, cost=20000, npc=7947, name="Vivianna", zone="Feralas", faction="Alliance"},
          {k="v", item=13949, cost=21052, npc=8145, name="Sheendra Tallgrass", zone="Feralas", faction="Horde"}}) -- Baked Salmon
S(22761, {{k="d", item=18267, npc=14354, name="Pusillin", zone="Dire Maul"}}) -- Runn Tum Tuber Surprise
S(24801, {{k="q", quest=8307, name="Desert Recipe", zone="Silithus"}}) -- Smoked Desert Dumplings
S(25659, {{k="q", item=21025, quest=8586, name="Dirge's Kickin' Chimaerok Chops", zone="Tanaris"}}) -- Dirge's Kickin' Chimaerok Chops
-- DATA_END
