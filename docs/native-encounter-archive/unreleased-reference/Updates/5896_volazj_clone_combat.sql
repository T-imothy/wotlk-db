-- Requires native Volazj clone profiles, grouped phase completion and wipe recovery.
INSERT IGNORE INTO spell_scripts (Id,ScriptName) VALUES (57496,'spell_volazj_insanity');
UPDATE creature_template SET AIName='',ScriptName='npc_volazj_visage'
WHERE Entry IN (30621,30622,30623,30624,30625);
