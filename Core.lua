local ADDON_NAME, ns = ...

-- Client API differences live here so feature modules do not need to know
-- which game flavor is running. Wrath uses the global addon/tooltip/spell
-- APIs; current Classic clients expose namespaced or callback-based variants.
ns.Compat = {}
local Compat = ns.Compat

function Compat.GetAddOnMetadata(addonName, field)
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        return C_AddOns.GetAddOnMetadata(addonName, field)
    end
    return GetAddOnMetadata(addonName, field)
end

function Compat.IsPlayerSpell(spellId)
    if IsPlayerSpell then return IsPlayerSpell(spellId) end
    if IsSpellKnown then return IsSpellKnown(spellId) end
    return false
end

function Compat.RegisterItemTooltipCallback(callback)
    if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall
        and Enum and Enum.TooltipDataType and Enum.TooltipDataType.Item then
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, callback)
    end

    -- Required by Wrath and retained as a fallback for Classic clients that
    -- still dispatch item tooltips through the legacy script.
    if GameTooltip then
        pcall(GameTooltip.HookScript, GameTooltip, "OnTooltipSetItem", callback)
    end
    if ItemRefTooltip then
        pcall(ItemRefTooltip.HookScript, ItemRefTooltip, "OnTooltipSetItem", callback)
    end
end

ns.version = Compat.GetAddOnMetadata(ADDON_NAME, "Version")

-- Localization: all user-facing text goes through ns.L["English text"].
-- English is the key and the fallback; locale files can override entries.
ns.L = setmetatable({}, { __index = function(_, key) return key end })

-- All settings are account-wide: the tooltip behavior should be identical
-- on every character (what differs per character - skill, known recipes -
-- is read live from the game).
local defaults = {
    alchemy = true,
    blacksmithing = true,
    cooking = true,
    enchanting = true,
    engineering = true,
    firstAid = true,
    jewelcrafting = true, -- TBC; inert while no data file is loaded
    leatherworking = true,
    mining = true,        -- smelting
    tailoring = true,
    maxLines = 6,         -- recipe lines per profession section (0 = headers only, else 2-35)
    showMissing = false,  -- also annotate professions this character lacks
    includeProcessed = true, -- follow cloth->bolt / ore->bar conversions
    modifier = "NONE",    -- only show while holding NONE/SHIFT/CTRL/ALT
    -- per profession: consider only recipes the character has learned
    alchemyOnlyLearned = false,
    blacksmithingOnlyLearned = false,
    cookingOnlyLearned = false,
    enchantingOnlyLearned = false,
    engineeringOnlyLearned = false,
    firstAidOnlyLearned = false,
    jewelcraftingOnlyLearned = false,
    leatherworkingOnlyLearned = false,
    miningOnlyLearned = false,
    tailoringOnlyLearned = false,
}

local function CopyDefaults(src, dst)
    for k, v in pairs(src) do
        if type(v) == "table" then
            if type(dst[k]) ~= "table" then dst[k] = {} end
            CopyDefaults(v, dst[k])
        elseif dst[k] == nil then
            dst[k] = v
        end
    end
end

-- Factory for the recipe data files (Data/<flavor>/<Profession>Data.lua).
-- Creates ns.<PREFIX>_RECIPES (spellId -> breakpoints + reagents) and
-- ns.<PREFIX>_BY_REAGENT (reagent itemId -> spellId list) and returns the
-- add() function the generated data lines call. Reagents in vendorReagents
-- (unlimited vendor stock) are kept in the recipe but left out of the
-- reagent index, so their tooltips stay clean.
function ns.NewRecipeDB(prefix, vendorReagents)
    local recipes, byReagent = {}, {}
    ns[prefix .. "_RECIPES"] = recipes
    ns[prefix .. "_BY_REAGENT"] = byReagent
    return function(spellId, orange, yellow, green, gray, reagents)
        recipes[spellId] = {
            orange = orange, yellow = yellow, green = green, gray = gray,
            reagents = reagents,
        }
        for itemId in pairs(reagents) do
            if not (vendorReagents and vendorReagents[itemId]) then
                local list = byReagent[itemId]
                if not list then list = {}; byReagent[itemId] = list end
                list[#list + 1] = spellId
            end
        end
    end
end

-- ns.OnInit(fn) -> runs at ADDON_LOADED, after ns.db is ready.
local initCallbacks = {}
function ns.OnInit(fn) table.insert(initCallbacks, fn) end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 ~= ADDON_NAME then return end
    self:UnregisterEvent("ADDON_LOADED")
    ProfessionTipsDB = ProfessionTipsDB or {}
    CopyDefaults(defaults, ProfessionTipsDB)
    ns.db = ProfessionTipsDB
    for _, fn in ipairs(initCallbacks) do fn() end
end)
