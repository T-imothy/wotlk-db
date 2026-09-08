-- Sindragosa native Ice Tomb chain and Ice Block LOS, with all payload difficulties.
INSERT IGNORE INTO spell_scripts (Id,ScriptName) VALUES
(69712,'spell_sindragosa_ice_tomb_selector'),
(69675,'spell_sindragosa_ice_tomb_selector'),
(70126,'spell_sindragosa_frost_beacon'),
(70157,'spell_sindragosa_ice_tomb_trap'),
(69845,'spell_sindragosa_ice_block_los'),
(71053,'spell_sindragosa_ice_block_los'),
(71054,'spell_sindragosa_ice_block_los'),
(71055,'spell_sindragosa_ice_block_los'),
(70127,'spell_sindragosa_ice_block_los'),
(72528,'spell_sindragosa_ice_block_los'),
(72529,'spell_sindragosa_ice_block_los'),
(72530,'spell_sindragosa_ice_block_los');
UPDATE creature_template SET AIName='', ScriptName='npc_sindragosa_ice_tomb' WHERE Entry=36980;
