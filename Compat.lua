local ADDON_NAME, ns = ...

-- Compat.lua: the one place that knows which client API we are on.
--
-- ProfessionTips runs on Classic Era 1.15, TBC Anniversary 2.5 and WoW
-- Forever 1.60. Forever is the Retail engine: GetSpellInfo, GetItemInfo,
-- IsPlayerSpell and the classic skill window list (GetNumSkillLines /
-- GetSkillLineInfo) are gone there and live on as C_Spell, C_Item,
-- C_SpellBook and C_SkillInfo. Feature files never call these directly.
-- Detection is by FEATURE (does the legacy global exist?), so a Classic
-- client that loses a global later degrades to the C_ path by itself.

-- Forever by its Interface band OR its project id - never by
-- WOW_PROJECT_MAINLINE (Forever stopped reporting it in build 70170).
-- GetBuildInfo has six returns: never wrap it in tonumber().
local tocVersion = select(4, GetBuildInfo()) or 0
ns.isForever = (tocVersion >= 16000 and tocVersion < 20000)
    or WOW_PROJECT_ID == (WOW_PROJECT_CAMELOT or 18)

local api = {}
ns.api = api

-- localized spell name (nil while the spell data is not cached yet)
local legacyGetSpellInfo = GetSpellInfo
if legacyGetSpellInfo then
    function api.GetSpellName(spellId) return (legacyGetSpellInfo(spellId)) end
else
    function api.GetSpellName(spellId) return C_Spell.GetSpellName(spellId) end
end

-- localized item name (nil until the item is cached; the call queues it)
local legacyGetItemInfo = GetItemInfo
if legacyGetItemInfo then
    function api.GetItemName(itemId) return (legacyGetItemInfo(itemId)) end
else
    function api.GetItemName(itemId) return (C_Item.GetItemInfo(itemId)) end
end

-- Has this character learned the crafting spell? Forever's recipes are
-- player-book spells (What's Training checks them the same way).
local PLAYER_BANK = Enum and Enum.SpellBookSpellBank and Enum.SpellBookSpellBank.Player
if IsPlayerSpell then
    function api.IsSpellKnown(spellId) return IsPlayerSpell(spellId) or false end
elseif C_SpellBook and C_SpellBook.IsSpellKnown and PLAYER_BANK then
    function api.IsSpellKnown(spellId) return C_SpellBook.IsSpellKnown(spellId, PLAYER_BANK) or false end
else
    function api.IsSpellKnown() return false end
end

-- spell icon (file id), nil while unknown
function api.GetSpellIcon(spellId)
    if GetSpellTexture then return GetSpellTexture(spellId) end
    return C_Spell and C_Spell.GetSpellTexture and C_Spell.GetSpellTexture(spellId)
end

-- chat link of a spell
function api.GetSpellLink(spellId)
    if GetSpellLink then return GetSpellLink(spellId) end
    return C_Spell and C_Spell.GetSpellLink and C_Spell.GetSpellLink(spellId)
end

-- item icon from local data (no server round trip)
function api.GetItemIcon(itemId)
    if GetItemIcon then return GetItemIcon(itemId) end
    if C_Item and C_Item.GetItemIconByID then return C_Item.GetItemIconByID(itemId) end
    local instant = GetItemInfoInstant or (C_Item and C_Item.GetItemInfoInstant)
    return instant and select(5, instant(itemId))
end

-- item chat link (nil until cached)
function api.GetItemLink(itemId)
    if legacyGetItemInfo then return (select(2, legacyGetItemInfo(itemId))) end
    return (select(2, C_Item.GetItemInfo(itemId)))
end

-- money as gold/silver/copper icons
function api.CoinString(copper)
    if GetCoinTextureString then return GetCoinTextureString(copper) end
    return C_CurrencyInfo.GetCoinTextureString(copper)
end

-- localized zone/area name for an AreaTable id
function api.GetAreaName(areaId)
    if not areaId or not (C_Map and C_Map.GetAreaInfo) then return nil end
    local name = C_Map.GetAreaInfo(areaId)
    if name and name ~= "" then return name end
end

-- localized quest title (nil until the client has it; the first call per
-- quest queues it - only once, so a quest that never answers cannot keep
-- the browser's QUEST_DATA_LOAD_RESULT refresh going)
local requestedQuests = {}
function api.GetQuestTitle(questId)
    if not (C_QuestLog and C_QuestLog.GetTitleForQuestID) then return nil end
    local title = C_QuestLog.GetTitleForQuestID(questId)
    if title and title ~= "" then return title end
    if C_QuestLog.RequestLoadQuestByID and not requestedQuests[questId] then
        requestedQuests[questId] = true
        pcall(C_QuestLog.RequestLoadQuestByID, questId)
    end
end

-- localized reputation faction name
function api.GetFactionName(factionId)
    if C_Reputation and C_Reputation.GetFactionDataByID then
        local data = C_Reputation.GetFactionDataByID(factionId)
        return data and data.name
    end
    if GetFactionInfoByID then return (GetFactionInfoByID(factionId)) end
end

-- Current rank of a profession, or nil when the character lacks it.
-- skillLine = SkillLine id (locale independent), skillName = the localized
-- profession name the classic skill list is matched against.
function api.GetProfessionRank(skillLine, skillName)
    if C_SkillInfo and C_SkillInfo.GetSkillLineInfoByID and not GetNumSkillLines then
        local info = C_SkillInfo.GetSkillLineInfoByID(skillLine)
        -- a learned profession starts at 1/75; anything emptier is static
        -- line data, not a skill of mine (same rule as WeaponTips)
        if info and (info.rank or 0) > 0 and (info.maxRank or 0) > 0 then return info.rank end
        return nil
    end
    if GetNumSkillLines and GetSkillLineInfo then
        for i = 1, GetNumSkillLines() do
            local name, isHeader, _, rank = GetSkillLineInfo(i)
            if not isHeader and name == skillName then return rank end
        end
        return nil
    end
    -- last resort: GetProfessions indexes (prof1, prof2, arch, fishing,
    -- cooking, first aid) for GetProfessionInfo
    if GetProfessions and GetProfessionInfo then
        local ids = { GetProfessions() }
        for i = 1, 6 do
            local id = ids[i]
            if id then
                local name, _, rank = GetProfessionInfo(id)
                if name == skillName then return rank end
            end
        end
    end
    return nil
end
