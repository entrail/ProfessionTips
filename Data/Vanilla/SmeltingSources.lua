local ADDON_NAME, ns = ...

-- Acquisition sources for Vanilla Smelting recipes: where each smelt is
-- obtained. Keyed by crafting spell ID (same as SmeltingData.lua).
-- Generated from Wowhead classic data 2026-08-05.
--
-- Notes: Smelt Copper is granted automatically when learning Apprentice
-- Mining (no separate training cost). Smelt Elementium is taught directly
-- by an NPC (Master Elemental Shaper Krixix in Blackwing Lair, via
-- mind-control gossip), recorded as k="t" with npc/name/zone.

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
S(10098, {{k="t"}}) -- Smelt Truesilver
S(14891, {{k="q", quest=4083, name="The Spectral Chalice", zone="Blackrock Depths"}}) -- Smelt Dark Iron
S(16153, {{k="t", cost=20000}}) -- Smelt Thorium
S(22967, {{k="t", npc=14401, name="Master Elemental Shaper Krixix", zone="Blackwing Lair"}}) -- Smelt Elementium
-- DATA_END
