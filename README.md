# ProfessionTips

**Keep, bank, or sell? Your reagent tooltips know.**

ProfessionTips adds a small section to the tooltip of every crafting
material, telling you at a glance whether it can still level your
professions — for WoW Classic Era / Anniversary / Hardcore.

```
Tailoring (137)
  Azure Silk Vest (not learned)      150-169 184 199
  Bolt of Silk Cloth                 125-134 139 144
First Aid (210)
  Silk Bandage                       150-179 209
```

## Features

- **One section per profession** that uses the item, with your current
  skill in the header.
- **Recipe lines colored like the trade-skill window** (orange / yellow /
  green / gray) at *your* current skill.
- **Color-coded breakpoint scale**: "1-44 64 84" = guaranteed skill point
  per craft through 44, declining chance until 64 (yellow) and 84 (green),
  nothing from 85. Perfect for deciding how many mats to buy when leveling.
- **"(not learned)" marker** when your character doesn't know the recipe.
- **"no skillups"** when every recipe using the item is gray — sell it.
- **Processed materials**: ore also counts its bar recipes, cloth its bolt
  recipes, hides their cured forms — marked "(via Copper Bar)".
- **Alt planning**: optionally show sections for professions this character
  doesn't have (as if at skill 0).
- Covers **all nine professions** (incl. First Aid and Smelting) with the
  complete Classic Era recipe catalogue, data taken from the game client
  itself and cross-checked against Wowhead.
- Works on **every client language** (all matching is by ID).
- Configurable in Settings -> Options -> AddOns -> ProfessionTips
  (or `/proftips`): per-profession toggles, lines per section (2-8),
  processed materials, missing professions.

## Notes

- Reagents that vendors sell in unlimited quantity (spices, vials, threads,
  dyes, ...) are deliberately not annotated — there is no keep-or-toss
  decision for them.
- Skill-up chances in the yellow/green range are approximate
  ((gray - skill) / (gray - yellow)); the breakpoints themselves are exact
  game data.
