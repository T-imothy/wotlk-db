# Upstream synchronization — 2026-09-09

Merged CMaNGOS wotlk-db through `c96637faeb7e67216ef7aeed1fa658011bc50528`.
The two incoming commits update quest 11590 (Abduction), remove the superseded EventAI behavior, and add Captured Beryl Sorcerer handling.

## Coordinated release requirements

Use a Wrath core containing `2448954ee7611b2f580119f789bfd14116922250` or a descendant. Before enabling that binary, deploy the corresponding world-data changes as one maintenance release:

1. Apply `Updates/5873_q.11590.sql` using the usual database-update workflow. It updates creature_template_addon entry 25474, dbscripts_on_relay 20803 and condition 21099.
2. Synchronize the ACID rows for creatures 25316 and 25474 with this revision. Their scripts are in `ACID/acid_wotlk.sql`; importing only those creatures avoids replacing unrelated customized EventAI rows.
3. Synchronize core `sql/scriptdev2/spell.sql` bindings: add 45625 -> spell_arcane_chains_character_force_cast and 45626 -> spell_ac_summon_chained_mage_hunter, remove the retired 45630 -> spell_arcane_chains_channel_borean binding. Keep 45611 -> spell_arcane_chains_borean.
4. Apply the new core DBC override: `UPDATE spell_template SET AttributesEx5 = AttributesEx5 | 1 WHERE Id = 46607;` (Drake Harpoon).

The incoming upstream commits do not introduce character, login, or playerbots schema migrations. Existing custom items, vendors, training dummies and dual-specialization files are unchanged. The Git merge has not applied any SQL to production. Live quest testing and database execution remain pending.

The historical encounter restoration document refers to its restoration-time revision; this synchronization advances official upstream content without restoring archived custom boss mechanics.
