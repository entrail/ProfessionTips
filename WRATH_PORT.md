# Wrath 3.3.5a compatibility port

## Scope

The addon now has a Wrath manifest, `ProfessionTips_Wrath.toc`, with
`## Interface: 30300`. The existing Classic Era and TBC manifests and their
file selections are unchanged.

Wrath currently loads the TBC profession datasets. This provides recipe and
material tooltip coverage for the existing professions through required skill
375. It does **not** add Wrath recipes, Northrend materials, Inscription, or
profession progression from 375 to 450. Those claims must wait for dedicated
Wrath data files.

## Compatibility changes

### Shared API helpers (`Core.lua`)

Client differences are centralized in `ns.Compat`:

- `GetAddOnMetadata` uses `C_AddOns.GetAddOnMetadata` when available and the
  Wrath global `GetAddOnMetadata` otherwise.
- `IsPlayerSpell` uses the modern `IsPlayerSpell` when available and Wrath's
  `IsSpellKnown` otherwise.
- Item-tooltip callback registration uses `TooltipDataProcessor` on clients
  that provide it and also safely hooks the legacy
  `GameTooltip:HookScript("OnTooltipSetItem", ...)` and ItemRefTooltip path.
  The existing once-per-tooltip guard prevents duplicate output when both
  mechanisms fire.

`ProfessionTips.lua` now calls these helpers instead of testing client APIs at
each use site. The tooltip content, filtering, skill lookup, conversion chains,
faction filtering, and modifier refresh behavior are otherwise unchanged.

### Wrath options (`Options_Wrath.lua`)

Wrath does not load `Options.lua` or `Templates.xml`, because they require the
modern `Settings` API and `SettingsListSectionHeaderTemplate`.

The separate Wrath options implementation:

- registers a legacy category with `InterfaceOptions_AddCategory`;
- opens it with `InterfaceOptionsFrame_OpenToCategory`;
- exposes the same profession toggles, per-profession "only learned" toggles,
  recipe-line limit, modifier selection, processed-material toggle, and
  missing-profession toggle;
- writes directly to the same account-wide `ProfessionTipsDB` settings used by
  the modern clients; and
- registers the existing `/professiontips` and `/proftips` commands.

Era and TBC continue to load the existing modern `Options.lua` and
`Templates.xml` implementation.

### Wrath manifest (`ProfessionTips_Wrath.toc`)

The Wrath TOC loads:

1. the shared core and compatibility helpers;
2. the existing TBC profession data and shared faction data;
3. `Options_Wrath.lua`; and
4. the shared tooltip implementation.

It intentionally does not list the modern settings XML/Lua files or any
nonexistent Wrath data files.

## Pre-port audit

Every `.lua`, `.xml`, and `.toc` file in the repository was inspected before
editing. The incompatible references were confined to `Core.lua`,
`Options.lua`, `Templates.xml`, and `ProfessionTips.lua`. All Vanilla/TBC data
files use the shared `NewRecipeDB` format and require no client-specific API.
`Data/FactionData.lua` is likewise client-neutral.

## Validation checklist

- Load with `ProfessionTips_Wrath.toc` on a 3.3.5a client without Lua errors.
- Confirm `/professiontips` and `/proftips` open the legacy options category.
- Toggle every option and confirm it persists after `/reload`.
- Hover Vanilla and Outland reagents in GameTooltip and ItemRefTooltip.
- Verify known/unlearned recipe labels, profession skill ranges, faction-only
  rows, processed-material paths, and modifier-key refreshes.
- Re-test the existing Era and TBC packages to ensure their modern Settings
  pages and tooltip callbacks remain unchanged.
