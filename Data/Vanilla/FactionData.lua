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
-- DATA_END
