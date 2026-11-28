-- Settings panel wiring (recording Settings mock): the "all professions"
-- masters lock every profession's sub-option row checked + greyed out,
-- without touching the profession's own stored value.
local T = _G.PT_TEST
local test, assertEqual, assertTrue, assertFalse =
    T.test, T.assertEqual, T.assertTrue, T.assertFalse

for _, sub in ipairs({ "OnlyLearned", "ShowGray" }) do
    test("options: master " .. sub .. " locks the profession rows", function()
        local B = T.boot("Vanilla")
        local m, db = B.m, B.ns.db
        local master = m.settings["ProfessionTips_all" .. sub]
        local rowVar = "ProfessionTips_tailoring" .. sub
        local row = m.settings[rowVar]
        assertTrue(master ~= nil and row ~= nil, "settings registered")

        -- own value works while the master is off
        assertTrue(m.CheckboxEnabled(rowVar), "row enabled")
        row:SetValue(true)
        assertEqual(db["tailoring" .. sub], true, "own value stored")
        row:SetValue(false)

        -- master on: the row reads checked, is disabled, gets refreshed
        local refreshed
        m.Settings.SetOnValueChangedCallback(rowVar, function(_, _, v) refreshed = v end)
        master:SetValue(true)
        assertEqual(refreshed, true, "row re-read when the master toggles")
        assertEqual(row:GetValue(), true, "row shows checked")
        assertFalse(m.CheckboxEnabled(rowVar), "row greyed out")
        assertEqual(db["tailoring" .. sub], false, "own value untouched")
        local init = m.checkboxes[rowVar]
        assertEqual(init.evalVars[1], "ProfessionTips_all" .. sub, "enabled state re-evaluated on master change")
        assertTrue(type(init.tooltip) == "function" and init.tooltip():find("all professions") ~= nil,
            "hint in the tooltip")

        master:SetValue(false)
        assertEqual(row:GetValue(), false, "own value back")
        assertTrue(m.CheckboxEnabled(rowVar), "row enabled again")
        assertTrue(init.tooltip():find("Turned on") == nil, "no hint while master off")

        db.tailoring = false -- profession off greys the row too
        assertFalse(m.CheckboxEnabled(rowVar), "profession parent predicate")
    end)
end

test("options: gray range option registered", function()
    local B = T.boot("Vanilla")
    assertTrue(B.m.settings["ProfessionTips_GrayScale"] ~= nil, "gray range option registered")
end)
