# Changelog

## v1.5.0 (2026-08-16)

- New: **Russian (ruRU)** translation. Every piece of the addon's own
  text is localized — reagent tooltips, the recipe browser (filter bar,
  section headers, source labels and hover tooltips) and the settings
  page — using the official in-game Russian profession terminology.
- Internal: the test suite now checks every locale file for leftover
  English and for format placeholders that no longer match their
  English original.

## v1.4.0 (2026-08-08)

- New: **recipe browser** — a side tab on the profession windows
  (including the Enchanting window) listing every recipe of the open
  profession: available now, coming up and already known, sorted by
  required skill and colored by difficulty.
- Every recipe shows **where to get it** — trainer / vendor / drop /
  quest / world drop — with costs, vendor/mob names and zones. Complete
  acquisition data for all 1,230 Era and 2,119 TBC recipes; a handful of
  genuinely unobtainable recipes are marked "source unknown".
- Rich hover tooltip (requirement + skill-up scale, all sources with
  prices, reagents); hold Shift for the crafted item's own tooltip.
- Wide profession windows (e.g. Leatrix Plus) get a two-pane layout:
  recipe list left, full details for the selected recipe right.
- Recipes display the crafted item's icon; hovering the icon shows the
  crafted item's own tooltip.
- Filter bar: one toggle per source kind (Trainer / Vendor / Drop /
  World drop / Quest), a faction filter and the "Known" toggle, plus a
  search box. The filter bar wraps to fit narrow windows and your
  settings are remembered account-wide.
- Faction-locked recipes are marked with their faction crest and say
  whether the other faction can still buy the teaching item on the
  neutral auction house or cannot get the recipe at all. The faction
  filter is a checkbox dropdown (Alliance / Horde / none) and defaults
  to your own faction.
- Right-click hides a recipe into a collapsible "Dismissed" section at
  the end of the list; right-click it there to bring it back.
- Skill-up scales read correctly for recipes that start yellow
  ("65-89 114") and for smelts that never turn trivial ("250+"), which
  also fixes the "no skillups" line those ores wrongly showed in the
  reagent tooltips.
- Fully localized (deDE, frFR, esES, ptBR).

## v1.3.3 (2026-07-24)

- Re-release of 1.3.2 (the 1.3.2 package never got built). No in-game
  changes.

## v1.3.2 (2026-07-24)

- Maintenance release: release notes now come from a curated changelog
  instead of raw commit output. No in-game changes.

## v1.3.1 (2026-07-22)

- Bumped Interface to 11509 for Classic Era 1.15.9.
- Internal: headless test suite (14 tests, Vanilla + TBC).

## v1.3.0 (2026-07-20)

- UI translations for deDE, frFR, esES/esMX and ptBR.

## v1.2.0 (2026-07-17)

- TBC Anniversary support: recipe data for all 10 professions
  (2,119 recipes).
- Hardened client compatibility: dual tooltip hooks, skill API fallback.
- Fixed slash commands on the 2.5.x anniversary client.

## v1.1.2 (2026-07-16)

- Other-faction-only reagents now show a faction tag instead of
  "no skillups".
- Real reagents are never silently skipped; "only learned" only trims
  lines.

## v1.1.1 (2026-07-16)

- Accumulated skill-up ranges, display modes, and smarter recipe
  selection.
- Faction data: 24 faction-locked recipes.
- Restructured the settings page into sections; recipe lines cap raised
  to 35.
- Profession header rows now use the tooltip header font.

## v1.0.0 (2026-07-16)

- Initial release: profession skill-up hints on reagent tooltips for
  Classic Era.
