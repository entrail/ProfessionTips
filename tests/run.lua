-- Headless test runner for ProfessionTips. Needs Lua 5.1 / LuaJIT.
-- Run from anywhere:  luajit tests/run.lua      (paths self-locate)
-- Boots load the REAL addon files in .toc order (Templates.xml is UI-only
-- XML and skipped) into an isolated environment and fire ADDON_LOADED -
-- one boot per game flavor, since Vanilla and TBC ship different data.

local base = (arg[0] or ""):match("^(.-)tests[/\\]run%.lua$") or ""

local Loader = dofile(base .. "tests/loader.lua")
local buildMocks = dofile(base .. "tests/wow_mock.lua")

local COMMON_HEAD = {
    "Core.lua",
    "Compat.lua",
    "Locales/deDE.lua",
    "Locales/frFR.lua",
    "Locales/esES.lua",
    "Locales/ptBR.lua",
    "Locales/ruRU.lua",
}
local COMMON_TAIL = {
    "Data/ProductData.lua",
    "Data/FactionData.lua",
    -- Data/Forever/*Sources.lua go here (they extend ns.CRAFT_PRODUCT)
    "Options.lua",
    "ProfessionTips.lua",
    "RecipeBrowser.lua",
}
local DATA = {
    Vanilla = {
        "Data/Vanilla/AlchemyData.lua", "Data/Vanilla/BlacksmithingData.lua",
        "Data/Vanilla/CookingData.lua", "Data/Vanilla/EnchantingData.lua",
        "Data/Vanilla/EngineeringData.lua", "Data/Vanilla/FirstAidData.lua",
        "Data/Vanilla/LeatherworkingData.lua", "Data/Vanilla/SmeltingData.lua",
        "Data/Vanilla/TailoringData.lua",
        "Data/Vanilla/AlchemySources.lua", "Data/Vanilla/BlacksmithingSources.lua",
        "Data/Vanilla/CookingSources.lua", "Data/Vanilla/EnchantingSources.lua",
        "Data/Vanilla/EngineeringSources.lua", "Data/Vanilla/FirstAidSources.lua",
        "Data/Vanilla/LeatherworkingSources.lua", "Data/Vanilla/SmeltingSources.lua",
        "Data/Vanilla/TailoringSources.lua",
    },
    TBC = {
        "Data/TBC/AlchemyData.lua", "Data/TBC/BlacksmithingData.lua",
        "Data/TBC/CookingData.lua", "Data/TBC/EnchantingData.lua",
        "Data/TBC/EngineeringData.lua", "Data/TBC/FirstAidData.lua",
        "Data/TBC/JewelcraftingData.lua", "Data/TBC/LeatherworkingData.lua",
        "Data/TBC/SmeltingData.lua", "Data/TBC/TailoringData.lua",
        "Data/TBC/AlchemySources.lua", "Data/TBC/BlacksmithingSources.lua",
        "Data/TBC/CookingSources.lua", "Data/TBC/EnchantingSources.lua",
        "Data/TBC/EngineeringSources.lua", "Data/TBC/FirstAidSources.lua",
        "Data/TBC/JewelcraftingSources.lua", "Data/TBC/LeatherworkingSources.lua",
        "Data/TBC/SmeltingSources.lua", "Data/TBC/TailoringSources.lua",
    },
    Forever = {
        "Data/Forever/AlchemyData.lua", "Data/Forever/BlacksmithingData.lua",
        "Data/Forever/CookingData.lua", "Data/Forever/EnchantingData.lua",
        "Data/Forever/EngineeringData.lua", "Data/Forever/FirstAidData.lua",
        "Data/Forever/LeatherworkingData.lua", "Data/Forever/SmeltingData.lua",
        "Data/Forever/TailoringData.lua",
    },
}
-- after ProductData/FactionData, like in both Forever-capable tocs
local LATE = {
    Forever = {
        "Data/Forever/AlchemySources.lua", "Data/Forever/BlacksmithingSources.lua",
        "Data/Forever/CookingSources.lua", "Data/Forever/EnchantingSources.lua",
        "Data/Forever/EngineeringSources.lua", "Data/Forever/FirstAidSources.lua",
        "Data/Forever/LeatherworkingSources.lua", "Data/Forever/SmeltingSources.lua",
        "Data/Forever/TailoringSources.lua",
    },
}
-- plain ProfessionTips.toc (read by a client without a matching flavor
-- toc): the Vanilla data, then the self-guarding Forever data on top
local PLAIN = {}
for _, f in ipairs(DATA.Vanilla) do PLAIN[#PLAIN + 1] = f end
for _, f in ipairs(DATA.Forever) do PLAIN[#PLAIN + 1] = f end

-- boot("Vanilla"|"TBC"|"Forever", setup?, plainToc?) -> { ns, m, env };
-- setup(m) runs before the files load, so tests can shape pre-login state.
-- "Forever" reshapes the mock into the Forever client API first; plainToc
-- loads the plain ProfessionTips.toc file list instead of the flavor toc.
local function boot(flavor, setup, plainToc)
    local m = buildMocks()
    local ns = {}
    local env = Loader.newEnv(m)
    if flavor == "Forever" then m.ApplyForever() end
    if setup then setup(m) end
    local files = {}
    for _, f in ipairs(COMMON_HEAD) do files[#files + 1] = f end
    for _, f in ipairs(plainToc and PLAIN or DATA[flavor or "Vanilla"]) do files[#files + 1] = f end
    local late = (plainToc or flavor == "Forever") and LATE.Forever or {}
    for _, f in ipairs(COMMON_TAIL) do
        if f == "Options.lua" then
            for _, l in ipairs(late) do files[#files + 1] = l end
        end
        files[#files + 1] = f
    end
    Loader.loadAll(base, files, ns, env)
    m.Fire("ADDON_LOADED", "ProfessionTips")
    return { ns = ns, m = m, env = env }
end

-- --- tiny test framework ---
local tests, currentSuite = {}, nil
local function test(name, fn) tests[#tests + 1] = { name = name, fn = fn, suite = currentSuite } end
local function fail(msg) error(msg, 3) end
local function assertEqual(got, want, msg)
    if got ~= want then
        fail((msg or "assertEqual") .. string.format(" (expected %s, got %s)", tostring(want), tostring(got)))
    end
end
local function assertTrue(c, msg) if not c then fail(msg or "assertTrue failed") end end
local function assertFalse(c, msg) if c then fail(msg or "assertFalse failed") end end

_G.PT_TEST = {
    boot = boot, test = test,
    assertEqual = assertEqual, assertTrue = assertTrue, assertFalse = assertFalse,
}

local SUITE_FILES = {
    "test_data.lua",
    "test_faction.lua",
    "test_tooltip.lua",
    "test_options.lua",
    "test_sources.lua",
    "test_browser.lua",
    "test_locales.lua",
    "test_forever.lua",
}
for _, s in ipairs(SUITE_FILES) do
    currentSuite = s
    dofile(base .. "tests/" .. s)
end
currentSuite = nil

-- --- run ---
local passed, failed = 0, 0
for _, t in ipairs(tests) do
    local ok, err = pcall(t.fn)
    if ok then
        passed = passed + 1
    else
        failed = failed + 1
        print("  FAIL  [" .. t.suite .. "] " .. t.name .. "\n          " .. tostring(err))
    end
end
print(string.format("%d passed, %d failed, %d total", passed, failed, passed + failed))
os.exit(failed == 0 and 0 or 1)
