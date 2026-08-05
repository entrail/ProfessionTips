local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla First Aid recipes: where each recipe is
-- obtained. Keyed by crafting spell ID (same as FirstAidData.lua).
-- Generated from Wowhead classic data 2026-08-05.
--
-- Notes: Linen/Heavy Linen Bandage are auto-learned from the profession
-- itself in the 1.15 client (no separate trainer entry, hence no cost).
-- Heavy Mageweave/Runecloth/Heavy Runecloth Bandage are taught only by the
-- Triage-quest doctors (Doctor Gustaf VanHowzen, Theramore / Doctor Gregory
-- Victor, Hammerfall) after completing the Triage quest; training costs are
-- not in the sniffed data, so they are omitted.

local S = ns.NewSourceDB("FIRSTAID")

-- DATA_START (generated; do not hand-edit between markers)
S(3275, {{k="t"}}) -- Linen Bandage
S(3276, {{k="t"}}) -- Heavy Linen Bandage
S(3277, {{k="t", cost=250}}) -- Wool Bandage
S(7934, {{k="t", cost=250}}) -- Anti-Venom
S(3278, {{k="t", cost=1000}}) -- Heavy Wool Bandage
S(7935, {{k="w", item=6454}}) -- Strong Anti-Venom
S(7928, {{k="t", cost=5000}}) -- Silk Bandage
S(7929, {
  {k="v", item=16112, cost=2200, npc=2805, name="Deneb Walker", zone="Arathi Highlands", faction="Alliance"},
  {k="v", item=16112, cost=2070, npc=13476, name="Balai Lok'Wein", zone="Dustwallow Marsh", faction="Horde"},
}) -- Heavy Silk Bandage
S(10840, {
  {k="v", item=16113, cost=5000, npc=2805, name="Deneb Walker", zone="Arathi Highlands", faction="Alliance"},
  {k="v", item=16113, cost=4705, npc=13476, name="Balai Lok'Wein", zone="Dustwallow Marsh", faction="Horde"},
}) -- Mageweave Bandage
S(10841, {{k="t"}}) -- Heavy Mageweave Bandage
S(18629, {{k="t"}}) -- Runecloth Bandage
S(18630, {{k="t"}}) -- Heavy Runecloth Bandage
S(23787, {
  {k="v", item=19442, cost=105263, npc=10856, name="Argent Quartermaster Hasana", zone="Tirisfal Glades"},
  {k="v", item=19442, cost=105263, npc=10857, name="Argent Quartermaster Lightspark", zone="Western Plaguelands"},
  {k="v", item=19442, cost=112500, npc=11536, name="Quartermaster Miranda Breechlock", zone="Eastern Plaguelands"},
}) -- Powerful Anti-Venom
-- DATA_END
