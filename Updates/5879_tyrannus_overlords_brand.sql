-- Requires the matching native spell_overlords_brand AuraScript.
-- Outgoing melee/ranged attacks, abilities, spells and periodic damage/healing.
-- Native proc hit/crit filtering excludes misses and zero-damage cast-end events.
INSERT IGNORE INTO spell_scripts (Id, ScriptName) VALUES
(69172, 'spell_overlords_brand');
INSERT IGNORE INTO spell_proc_event (entry, procFlags, procEx) VALUES
(69172, 0x00055554, 0x00000003);
