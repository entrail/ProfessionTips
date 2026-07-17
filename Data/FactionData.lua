local ADDON_NAME, ns = ...

-- Crafting spell IDs whose recipe is obtainable by only ONE faction (every
-- source - quest, vendor, drop - is faction-exclusive). Recipes not listed
-- are available to both factions. Characters of the other faction skip
-- listed recipes entirely (lines, accumulated ranges, "no skillups").

local FACTION = {}
ns.RECIPE_FACTION = FACTION

local function F(spellId, faction)
    FACTION[spellId] = faction
end

-- DATA_START (generated; do not hand-edit between markers)
F(2542, "Alliance") -- Goretusk Liver Pie (quest "Goretusk Liver Pie" Westfall + vendor Kendor Kabonka, Stormwind)
F(2543, "Alliance") -- Westfall Stew (quest "Westfall Stew" Westfall + vendor Kendor Kabonka, Stormwind)
F(2547, "Alliance") -- Redridge Goulash (quest "Redridge Goulash" Redridge + vendor Kendor Kabonka, Stormwind)
F(2549, "Alliance") -- Seasoned Wolf Kabob (quest "Seasoned Wolf Kabobs" Duskwood + vendor Kendor Kabonka, Stormwind)
F(2795, "Alliance") -- Beer Basted Boar Ribs (quest "Beer Basted Boar Ribs" Dun Morogh + vendor Kendor Kabonka; Wowhead side=1)
F(3370, "Alliance") -- Crocolisk Steak (quest "Crocolisk Hunting" Loch Modan + vendor Kendor Kabonka, Stormwind)
F(3371, "Alliance") -- Blood Sausage (quest "Thelsamar Blood Sausages" Loch Modan + vendor Kendor Kabonka, Stormwind)
F(3372, "Alliance") -- Murloc Fin Soup (quest "Selling Fish" Redridge [side=1 verified] + vendor Kendor Kabonka, Stormwind)
F(3373, "Alliance") -- Crocolisk Gumbo (quest "Apprentice's Duties" Wetlands + vendor Kendor Kabonka, Stormwind)
F(3376, "Alliance") -- Curiously Tasty Omelet (quest "Ormer's Revenge" Wetlands + vendor Kendor Kabonka, Stormwind)
F(3377, "Alliance") -- Gooey Spider Cake (quest "Dusky Crab Cakes" Duskwood + vendor Kendor Kabonka, Stormwind)
F(3399, "Alliance") -- Tasty Lion Steak (quest "Costly Menace" Southshore, quest-only)
F(4096, "Horde") -- Raptor Hide Harness [Leatherworking] (vendor Tunkk, Hammerfall, Arathi; Wowhead side=2)
F(4097, "Alliance") -- Raptor Hide Belt [Leatherworking] (vendor Androd Fadran, Refuge Pointe, Arathi; Wowhead side=1)
F(6412, "Alliance") -- Kaldorei Spider Kabob (quest "Recipe of the Kaldorei", side=1 verified, quest-only)
F(6413, "Horde") -- Scorpid Surprise (vendor Grimtak, Razor Hill, Durotar; Wowhead side=2)
F(6414, "Horde") -- Roasted Kodo Meat (vendor Wunna Darkmane, Bloodhoof Village, Mulgore; sole vendor, Horde-only react)
F(6415, "Alliance") -- Fillet of Frenzy (vendor Laird, Auberdine, Darkshore; sole vendor, Alliance-only react)
F(6417, "Horde") -- Dig Rat Stew (quest "Dig Rat Stew" Barrens, Horde quest-only)
F(6418, "Horde") -- Crispy Lizard Tail (vendor Tari'qa, Crossroads, Barrens; sole vendor, Horde-only react)
F(6501, "Alliance") -- Clam Chowder (vendors Kriggon Talsone Westfall + Heldan Galesong; both Alliance-only react)
F(7754, "Alliance") -- Loch Frenzy Delight (vendor Khara Deepwater, Loch Modan; sole vendor, Alliance-only react)
F(15935, "Horde") -- Crispy Bat Wing (vendor Abigail Shiel, Brill, Tirisfal; sole vendor, Horde-only react)
F(24418, "Horde") -- Heavy Crocolisk Stew (vendor Ogg'marr, Brackenwall Village, Dustwallow; sole vendor, Horde-only react)
-- DATA_END
