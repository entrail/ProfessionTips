# Changelog

## v1.8.0 (2026-11-28)

- **Show gray recipes** (new per-profession option, off by default):
  recipes that no longer give skill points are listed in gray in the
  lines left free after the ones that still do; any that do not fit are
  counted as "+N more gray recipes". When every recipe of an item is
  gray (e.g. at max skill), the section lists them instead of the single
  "no skillups" line. Gray lines skip the skill range to stay short; the
  new "Skill range on gray recipes" option brings it back (useful when
  collecting materials for an alt).
- **"All professions" switches** for "Only learned recipes" and "Show
  gray recipes" at the top of the profession list: while one is on, it
  applies everywhere and the per-profession boxes are shown checked and
  locked (your individual choices come back when you turn it off).
- "Recipes listed per profession" now goes up to the most recipes a
  single material is used in on your client (79 on Classic Era, 106 on
  TBC, 144 on WoW Forever) instead of 35.

## v1.7.0 (2026-11-26)

- **WoW: Forever support** (client 1.60.1): reagent tooltips now work on
  Forever with its own recipe data, read from the Forever client data -
  2,150 recipes, including the ~930 recipes Forever added (new gear,
  potions, camp crafts and more) and the recipes it moved between
  professions (healing potions and poultices in First Aid, Wildthorn
  Mail and the Timbermaw belts in Leatherworking).
- Skill-up colors use Forever's own breakpoints - many recipes turn
  yellow, green and gray at different skill levels than on Classic Era,
  and many trainer recipes can be learned earlier.
- **Recipe browser on Forever**: a new side tab under the profession tabs
  of Forever's profession window lists every recipe of the open
  profession - available now, coming up and known - with where to get
  it: trainer cost, vendors with their zone, Merchant's Favor and
  reputation requirements, quests and drops. Same filters as on Classic
  (source kinds, faction, known recipes, search).
- Forever recipe sources are based on What's Training's Forever recipe
  data (MIT License, see LICENSE.md).
- Fixed (all versions): **Tin Ore / Tin Bar** showed no Blacksmithing or
  Engineering recipes - Tin Bar is only used to smelt Bronze. Tin and
  **Copper** now also list the recipes reachable via their **Bronze Bar**.

## v1.6.0 (2026-08-16)

- New: reagent tooltips follow **branching** processing chains — one
  material can feed several professions' intermediates. Stones now show
  the Engineering recipes reachable via their **Blasting Powder** in
  addition to the Blacksmithing ones via their Grinding Stone; in TBC,
  Motes of Fire/Earth also lead to Elemental Blasting Powder recipes.
- Fixed: **Solid Stone** showed no processed-material recipes at all
  (wrong item id in the conversion table), and a stray dead entry from
  the same mix-up was removed. Dense Stone had only worked by accident.

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
