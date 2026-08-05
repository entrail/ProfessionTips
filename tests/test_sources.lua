-- Source data integrity: every <PREFIX>_SOURCES table must join cleanly
-- onto its recipe catalogue, and every entry must have a valid shape.
-- Coverage ("every recipe has a source") is asserted per profession as
-- soon as its Sources file carries ANY data; files still in the empty
-- placeholder state are reported as pending instead of failing, so the
-- suite stays green while the generated data lands profession by
-- profession.

local T = PT_TEST
local test, assertTrue, assertEqual = T.test, T.assertTrue, T.assertEqual

local VALID_KINDS = { t = true, v = true, d = true, w = true, q = true, u = true }

local function checkEntryShape(prefix, spellId, i, src)
    local where = prefix .. " " .. spellId .. " source #" .. i
    assertEqual(type(src), "table", where .. ": entry must be a table")
    assertTrue(VALID_KINDS[src.k], where .. ": invalid kind " .. tostring(src.k))
    if src.cost ~= nil then
        assertEqual(type(src.cost), "number", where .. ": cost must be copper number")
        assertTrue(src.cost >= 0, where .. ": negative cost")
    end
    for _, numField in ipairs({ "item", "npc", "quest" }) do
        if src[numField] ~= nil then
            assertEqual(type(src[numField]), "number", where .. ": " .. numField .. " must be a number")
        end
    end
    for _, strField in ipairs({ "name", "zone" }) do
        if src[strField] ~= nil then
            assertEqual(type(src[strField]), "string", where .. ": " .. strField .. " must be a string")
            assertTrue(src[strField] ~= "", where .. ": empty " .. strField)
        end
    end
    if src.limited ~= nil then
        assertEqual(type(src.limited), "boolean", where .. ": limited must be boolean")
    end
    if src.faction ~= nil then
        assertTrue(src.faction == "Alliance" or src.faction == "Horde",
            where .. ": faction must be Alliance/Horde, got " .. tostring(src.faction))
    end
    if src.k == "t" then
        assertTrue(src.item == nil, where .. ": trainer entries carry no teaching item")
    end
    if src.k == "v" or src.k == "d" or src.k == "w" then
        -- item-taught kinds should name the teaching item once data exists
        assertTrue(src.item ~= nil, where .. ": " .. src.k .. " entry without teaching item")
    end
end

local function sourcesSuite(flavor)
    local ctx = T.boot(flavor)
    local ns = ctx.ns
    local pending = {}
    for _, prof in ipairs(ns.ProfessionTips.PROFESSIONS) do
        local recipes = ns[prof.recipes]
        local sources = ns[prof.prefix .. "_SOURCES"]
        if recipes then
            assertTrue(sources ~= nil,
                flavor .. " " .. prof.prefix .. ": Sources file missing/not loaded")

            local sourceCount = 0
            for spellId, list in pairs(sources) do
                sourceCount = sourceCount + 1
                assertTrue(recipes[spellId] ~= nil,
                    flavor .. " " .. prof.prefix .. ": source for unknown recipe " .. spellId)
                assertTrue(#list > 0,
                    flavor .. " " .. prof.prefix .. " " .. spellId .. ": empty source list")
                for i, src in ipairs(list) do
                    checkEntryShape(flavor .. " " .. prof.prefix, spellId, i, src)
                end
            end

            if sourceCount == 0 then
                pending[#pending + 1] = prof.prefix
            else
                -- data landed: coverage must be complete
                local missing = {}
                for spellId in pairs(recipes) do
                    if not sources[spellId] then missing[#missing + 1] = spellId end
                end
                assertEqual(#missing, 0,
                    flavor .. " " .. prof.prefix .. ": " .. #missing
                    .. " recipes without source entry (e.g. " .. tostring(missing[1]) .. ")")
            end
        end
    end
    if #pending > 0 then
        print("  NOTE  [" .. flavor .. "] sources data still pending: "
            .. table.concat(pending, ", "))
    end
end

test("Vanilla: source entries valid + coverage where data landed", function()
    sourcesSuite("Vanilla")
end)

test("TBC: source entries valid + coverage where data landed", function()
    sourcesSuite("TBC")
end)
