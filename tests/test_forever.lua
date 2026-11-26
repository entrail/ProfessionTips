-- WoW Forever: the addon booted through the Forever API shape (mock
-- ApplyForever: no GetSpellInfo / GetItemInfo / IsPlayerSpell / skill
-- window list, C_* instead, CRAFT_* registration throws, category.ID
-- guarded) on both toc paths, the generated Forever catalogue, the
-- tooltip end to end, the Forever source data, the recipe browser docked
-- into a mock ProfessionsFrame and the detection rule.
-- Anchors (generated Forever data, build 1.60.1.71037):
--   First Aid 129: 3275 Linen Bandage (1/30/45/60, Linen Cloth 2589),
--                  1244431 Minor Healing Potion (new on Forever, Peacebloom
--                  2447 + Mild Spices 2678 + Empty Vial 3371 - both vendor)
--   Leatherworking 165: 16650 Wildthorn Mail (moved over from Blacksmithing)
local T = _G.PT_TEST
local test, assertEqual, assertTrue, assertFalse =
    T.test, T.assertEqual, T.assertTrue, T.assertFalse

local COUNTS = {
    ALCHEMY = 177, BLACKSMITHING = 431, COOKING = 124, ENCHANTING = 215,
    ENGINEERING = 240, FIRSTAID = 30, LEATHERWORKING = 510,
    SMELTING = 17, TAILORING = 406, -- total 2150
}

local function checkCatalogue(ns, label)
    local total = 0
    for prefix, want in pairs(COUNTS) do
        local recipes = ns[prefix .. "_RECIPES"]
        assertTrue(recipes and ns[prefix .. "_BY_REAGENT"], label .. " " .. prefix .. " tables missing")
        local count = 0
        for spellId, r in pairs(recipes) do
            count = count + 1
            assertTrue(r.orange >= 1, prefix .. " " .. spellId .. " orange >= 1")
            if r.gray > 1 then
                assertTrue(r.orange <= r.gray, prefix .. " " .. spellId .. " orange <= gray")
            end
            assertTrue(r.yellow <= r.green and r.green <= r.gray, prefix .. " " .. spellId .. " breakpoint order")
            assertTrue(next(r.reagents) ~= nil, prefix .. " " .. spellId .. " has no reagents")
        end
        assertEqual(count, want, label .. " " .. prefix .. " recipe count")
        total = total + count
    end
    assertEqual(total, 2150, label .. " total recipes")
    assertEqual(ns.JEWELCRAFTING_RECIPES, nil, label .. ": no Jewelcrafting on Forever")
end

test("forever: flavor toc boots and loads the Forever catalogue", function()
    local B = T.boot("Forever")
    assertTrue(B.ns.isForever, "isForever")
    checkCatalogue(B.ns, "Forever toc")
end)

test("forever: plain toc loads Vanilla then the Forever data on top", function()
    local F = T.boot("Forever", nil, true)
    assertTrue(F.ns.isForever, "plain toc on Forever")
    checkCatalogue(F.ns, "plain toc on Forever")

    local V = T.boot("Vanilla", nil, true)
    assertFalse(V.ns.isForever, "plain toc on Era is not Forever")
    local n = 0
    for _ in pairs(V.ns.ALCHEMY_RECIPES) do n = n + 1 end
    assertEqual(n, 112, "Era keeps its Vanilla alchemy (Forever files no-op)")
end)

test("forever: recipes moved between professions, new ones, vendor reagents", function()
    local ns = T.boot("Forever").ns
    assertTrue(ns.LEATHERWORKING_RECIPES[16650], "Wildthorn Mail is Leatherworking on Forever")
    assertEqual(ns.BLACKSMITHING_RECIPES[16650], nil, "and no longer Blacksmithing")
    local potion = ns.FIRSTAID_RECIPES[1244431]
    assertTrue(potion and potion.reagents[2447], "First Aid brews Minor Healing Potion from Peacebloom")
    assertEqual(ns.FIRSTAID_BY_REAGENT[3371], nil, "Empty Vial (vendor) stays out of the index")
    local found = false
    for _, id in ipairs(ns.FIRSTAID_BY_REAGENT[2447] or {}) do found = found or id == 1244431 end
    assertTrue(found, "Peacebloom tooltip reaches the First Aid potion")
end)

test("forever: tooltip reads the skill by line id and known recipes from the book", function()
    local B = T.boot("Forever", function(m) m.state.skillById[129] = 35 end) -- First Aid 35
    B.m.HoverItem(2589)
    local text = B.m.TooltipText()
    assertTrue(text:find("Spell3273 %(35%)") ~= nil, "header with skill: " .. text)
    assertTrue(text:find("|cffffff00Spell3275|r") ~= nil, "Linen Bandage yellow at 35: " .. text)
    assertTrue(text:find("not learned") ~= nil, "unlearned marker")

    B.m.state.knownSpells[3275] = true
    B.m.state.knownSpells[3276] = true
    B.m.HoverItem(2589)
    assertTrue(B.m.TooltipText():find("not learned") == nil, "known via C_SpellBook: " .. B.m.TooltipText())
end)

test("forever: a profession the character lacks stays silent", function()
    local B = T.boot("Forever") -- C_SkillInfo answers with empty static data
    assertEqual(#B.m.HoverItem(2589), 0, "no First Aid -> no section")
end)

-- A ProfessionsFrame shaped like Forever's Blizzard_Professions: right-edge
-- tab column (overview + profession tabs), crafting page, book page.
local function buildProfessionsFrame(m, line)
    local book = m.CreateFrame(nil, "ProfessionsFrame")
    book.CraftingPage = m.CreateFrame(nil, nil, book)
    book.BookPage = m.CreateFrame(nil, nil, book)
    book.BookPage:Hide()
    book.ProfessionsOverviewTab = m.CreateFrame(nil, nil, book)
    book.rightProfessionTabs = { m.CreateFrame(nil, nil, book), m.CreateFrame(nil, nil, book) }
    book.rightProfessionTabs[2]:Hide()
    m.state.tradeSkillLine = line
    m.Professions = { GetEffectiveSkillLineID = function() return m.state.tradeSkillLine end }
    return book
end

local function openForeverBrowser(line, setup)
    local B = T.boot("Forever", function(m)
        m.state.skillById[171] = 60 -- Alchemy 60
        if setup then setup(m) end
    end)
    local book = buildProfessionsFrame(B.m, line)
    B.m.Fire("ADDON_LOADED", "Blizzard_Professions")
    B.m.RunTimers()
    B.m.TriggerCallback("ProfessionsFrame.Show")
    B.m.RunTimers()
    return B, book, B.env.ProfessionTipsProfessionsTab
end

test("forever: source data - vendors with area ids, Merchant's Favor, products", function()
    local ns = T.boot("Forever").ns
    local list = ns.ALCHEMY_SOURCES[1250794] -- Elixir of Lesser Spirit
    assertTrue(list and #list == 2, "two Merchant's Favor vendors")
    for _, src in ipairs(list) do
        assertEqual(src.k, "v", "vendor kind")
        assertEqual(src.favor, 45, "favor cost")
        assertTrue(src.area and src.npc and src.faction, "area, npc and faction")
    end
    -- an Era recipe keeps the Era vendor details (price, name, limited)
    local rage = ns.ALCHEMY_SOURCES[6617]
    assertEqual(rage[1].name, "Defias Profiteer", "Era vendor name carried over")
    assertEqual(rage[1].cost, 100, "Era vendor price carried over")
    assertEqual(rage[1].area, 40, "Westfall area id added")
    -- crafted items of new Forever recipes extend the shared product table
    assertEqual(ns.CRAFT_PRODUCT[1250794], 250345, "new recipe's product icon")
    assertTrue(ns.CRAFT_PRODUCT[2149] ~= nil, "shipped products untouched")
    -- What's Training rows without a source fall back to the Era sources
    -- (generator bug fixed 2026-11-24: ~150 recipes had no source line)
    assertEqual(ns.TAILORING_SOURCES[2963][1].k, "t", "Bolt of Linen Cloth: trainer (Era)")
    -- a vendor WT names no NPC for still carries its reputation
    assertEqual(ns.LEATHERWORKING_SOURCES[1297131][1].rep[1][1], 609, "Hivethrasher's Boots: Cenarion Circle")
    local missing = 0
    for _, prefix in ipairs({ "ALCHEMY", "BLACKSMITHING", "COOKING", "ENCHANTING", "ENGINEERING",
        "FIRSTAID", "LEATHERWORKING", "SMELTING", "TAILORING" }) do
        for spell in pairs(ns[prefix .. "_RECIPES"]) do
            if not ns[prefix .. "_SOURCES"][spell] then missing = missing + 1 end
        end
    end
    assertTrue(missing <= 10, "recipes without any source: " .. missing)
    -- every recipe in a source file belongs to the catalogue
    for _, prefix in ipairs({ "ALCHEMY", "BLACKSMITHING", "COOKING", "ENCHANTING", "ENGINEERING",
        "FIRSTAID", "LEATHERWORKING", "SMELTING", "TAILORING" }) do
        for spell in pairs(ns[prefix .. "_SOURCES"]) do
            assertTrue(ns[prefix .. "_RECIPES"][spell] ~= nil, prefix .. " source without recipe " .. spell)
        end
    end
end)

test("forever: source lines localize zones, show favor and reputation", function()
    local B = T.boot("Forever")
    local ns = B.ns
    local line = ns.BrowserSourceLine({ k = "v", npc = 1, name = "Vendorname", area = 17, favor = 45,
        rep = { { 2586, 5 }, { 2587, 5 } }, faction = "Horde" })
    assertTrue(line:find("Vendorname (Area17)", 1, true) ~= nil, "zone from area id: " .. line)
    assertTrue(line:find("45 |T1:0|t Merchant's Favor", 1, true) ~= nil, "favor: " .. line)
    assertTrue(line:find("Requires Faction2586 / Faction2587 - Friendly", 1, true) ~= nil, "rep: " .. line)
    -- quests by id: title from the client, "#id" until it arrives
    local q = ns.BrowserSourceLine({ k = "q", quest = 96045, area = 1537 })
    assertTrue(q:find("#96045 (Area1537)", 1, true) ~= nil, "quest placeholder: " .. q)
    B.m.state.questTitles[96045] = "Some Quest"
    assertTrue(ns.BrowserSourceLine({ k = "q", quest = 96045 }):find("Some Quest", 1, true) ~= nil, "quest title")
    assertTrue(ns.BrowserSourceLine({ k = "t", auto = true }):find("learned with the profession", 1, true) ~= nil,
        "auto-learned")
end)

test("forever: no classic browser hooks (no trade skill / craft events)", function()
    local B = T.boot("Forever") -- would throw on CRAFT_* registration
    for _, f in ipairs(B.m.__frames) do
        assertFalse(f.__events.TRADE_SKILL_SHOW, "classic watcher registered on Forever")
    end
end)

test("forever: profession window resolves the profession by skill line", function()
    local B = T.boot("Forever", function(m) m.state.skillById[171] = 60 end)
    buildProfessionsFrame(B.m, 2937) -- Retail-style child line of Alchemy
    local prof, rank, maxRank = B.ns.BrowserForeverResolve()
    assertEqual(prof and prof.prefix, "ALCHEMY", "child line 2937 -> Alchemy")
    assertEqual(rank, 60, "rank from C_SkillInfo")
    assertEqual(maxRank, 300, "max rank")
    B.m.state.tradeSkillLine = 186
    assertEqual(B.ns.BrowserForeverResolve().prefix, "SMELTING", "Mining window = smelting recipes")
    B.m.state.tradeSkillLine = 182 -- Herbalism: no recipes of ours
    assertEqual(B.ns.BrowserForeverResolve(), nil, "unsupported profession")
end)

test("forever: side tab opens the browser over the crafting page", function()
    local B, book, tab = openForeverBrowser(171)
    assertTrue(tab ~= nil, "tab created on ProfessionsFrame")
    assertTrue(tab:IsShown(), "tab shown for Alchemy")
    local overlay = B.env.ProfessionTipsBrowser
    assertTrue(overlay == nil or not overlay:IsShown(), "browser closed until clicked")

    tab.customMouseUpHandler(tab, "LeftButton", true)
    overlay = B.env.ProfessionTipsBrowser
    assertTrue(overlay and overlay:IsShown(), "browser open: " .. table.concat(B.m.__prints, " | "))
    assertTrue(tab:GetChecked(), "tab checked")
    assertEqual(overlay:GetParent(), book, "docked into ProfessionsFrame")
    assertTrue(#B.m.__prints == 0, "no browser error: " .. table.concat(B.m.__prints, " | "))

    -- a native profession tab returns to Blizzard's view
    B.m.FireHooks(book.rightProfessionTabs[1], "OnMouseUp", book.rightProfessionTabs[1], "LeftButton")
    assertFalse(overlay:IsShown(), "native tab closes the browser")
    assertFalse(tab:GetChecked(), "tab unchecked")

    -- reopen, then the overview book page shows: browser and tab go away
    tab.customMouseUpHandler(tab, "LeftButton", true)
    assertTrue(overlay:IsShown(), "reopened")
    book.BookPage:Show()
    book.CraftingPage:Hide()
    B.m.FireHooks(book.BookPage, "OnShow")
    B.m.RunTimers()
    assertFalse(overlay:IsShown(), "overview closes the browser")
    assertFalse(tab:IsShown(), "no tab on the overview")
end)

test("forever: browser lists the profession's recipes with Forever sources", function()
    local B, _, tab = openForeverBrowser(171)
    tab.customMouseUpHandler(tab, "LeftButton", true)
    local prof
    for _, p in ipairs(B.ns.ProfessionTips.PROFESSIONS) do
        if p.prefix == "ALCHEMY" then prof = p end
    end
    local list = B.ns.BrowserBuildList(prof, 60)
    local found
    for _, item in ipairs(list) do
        if item.entry and item.entry.spell == 1250794 then found = item.entry end
    end
    assertTrue(found ~= nil, "Elixir of Lesser Spirit (new on Forever) listed")
    assertEqual(found.sources[1].favor, 45, "with its Forever vendor source")
    assertTrue(B.ns.BrowserSourceTag(found.sources):find("Vendor") ~= nil, "vendor tag")
end)

test("forever: unsupported profession hides the tab", function()
    local _, _, tab = openForeverBrowser(182) -- Herbalism
    assertFalse(tab:IsShown(), "no tab for a profession without recipes")
end)

test("forever: detection rule (Interface band OR project id 18, never MAINLINE)", function()
    local function isForever(toc, project)
        return T.boot("Vanilla", function(m)
            m.state.toc = toc
            m.WOW_PROJECT_ID = project
            m.WOW_PROJECT_MAINLINE = 1
        end).ns.isForever and true or false
    end
    assertTrue(isForever(16001, 18), "Forever 70170+")
    assertTrue(isForever(16001, 1), "Forever before 70170 (reported MAINLINE)")
    assertTrue(isForever(11509, 18), "project id alone")
    assertFalse(isForever(11509, 2), "Classic Era")
    assertFalse(isForever(20506, 5), "TBC Anniversary")
    assertFalse(isForever(120105, 1), "Retail")
end)
