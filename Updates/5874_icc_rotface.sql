-- Icecrown Citadel Rotface encounter data.

START TRANSACTION;

UPDATE `creature_template` SET `ScriptName`='boss_rotface', `SpellList`=0 WHERE `Entry`=36627;
UPDATE `creature_template` SET `ScriptName`='mob_little_ooze', `SpellList`=0 WHERE `Entry`=36897;
UPDATE `creature_template` SET `ScriptName`='mob_big_ooze', `SpellList`=0 WHERE `Entry`=36899;

DELETE FROM `creature_spell_list`
WHERE `Id` IN (3662701,3689701,3689901);
DELETE FROM `creature_spell_list_entry`
WHERE `Id` IN (3662701,3689701,3689901);

DELETE FROM `spell_scripts` WHERE `Id` IN (69558,69795,69782);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(69558,'spell_unstable_ooze_rotface'),
(69795,'spell_ooze_flood_trigger'),
(69782,'spell_ooze_flood');

COMMIT;
