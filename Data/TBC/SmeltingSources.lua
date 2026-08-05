local ADDON_NAME, ns = ...

-- Acquisition sources for TBC Smelting recipes: where each smelt is
-- obtained. Keyed by crafting spell ID (same as SmeltingData.lua).
-- Generated from Wowhead TBC (2.5.6) data 2026-08-05.
--
-- Notes: Smelt Copper is granted automatically when learning Apprentice
-- Mining (no separate training cost). Smelt Elementium is taught directly
-- by an NPC (Master Elemental Shaper Krixix in Blackwing Lair, via
-- mind-control gossip), recorded as k="t" with npc/name/zone. Study of
-- Advanced Smelting (Smelt Hardened Khorium) is Sunwell Plateau trash-mob
-- zone loot, so no single npc is recorded.

local S = ns.NewSourceDB("SMELTING")

-- DATA_START (generated; do not hand-edit between markers)
S(2657, {{k="t"}}) -- Smelt Copper
S(3304, {{k="t", cost=50}}) -- Smelt Tin
S(2659, {{k="t", cost=200}}) -- Smelt Bronze
S(2658, {{k="t", cost=200}}) -- Smelt Silver
S(3307, {{k="t", cost=500}}) -- Smelt Iron
S(3308, {{k="t", cost=2500}}) -- Smelt Gold
S(3569, {{k="t", cost=2500}}) -- Smelt Steel
S(10097, {{k="t", cost=5000}}) -- Smelt Mithril
S(10098, {{k="t", cost=10000}}) -- Smelt Truesilver
S(14891, {{k="q", quest=4083, name="The Spectral Chalice", zone="Blackrock Depths"}}) -- Smelt Dark Iron
S(16153, {{k="t", cost=20000}}) -- Smelt Thorium
S(29356, {{k="t", cost=40000}}) -- Smelt Fel Iron
S(22967, {{k="t", npc=14401, name="Master Elemental Shaper Krixix", zone="Blackwing Lair"}}) -- Smelt Elementium
S(29358, {{k="t", cost=40000}}) -- Smelt Adamantite
S(29359, {{k="t", cost=40000}}) -- Smelt Eternium
S(29360, {{k="t", cost=40000}}) -- Smelt Felsteel
S(29361, {{k="t", cost=100000}}) -- Smelt Khorium
S(29686, {{k="t", cost=100000}}) -- Smelt Hardened Adamantite
S(46353, {{k="d", item=35273, zone="Sunwell Plateau"}}) -- Smelt Hardened Khorium
-- DATA_END
