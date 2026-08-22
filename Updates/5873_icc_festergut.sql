-- Icecrown Citadel Festergut encounter data.

START TRANSACTION;

UPDATE `creature_template` SET `ScriptName`='boss_festergut', `SpellList`=0 WHERE `Entry`=36626;
UPDATE `creature_template` SET `ScriptName`='npc_orange_gas_stalker' WHERE `Entry`=36659;

DELETE FROM `creature_spell_list` WHERE `Id`=3662601;
DELETE FROM `creature_spell_list_entry` WHERE `Id`=3662601;

DELETE FROM `spell_scripts` WHERE `Id` IN
(69165,69290,71222,73033,73034,72219,72551,72552,72553);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(69165,'spell_inhale_blight'),
(69290,'spell_festergut_blighted_spores'),
(71222,'spell_festergut_blighted_spores'),
(73033,'spell_festergut_blighted_spores'),
(73034,'spell_festergut_blighted_spores'),
(72219,'spell_festergut_gastric_bloat'),
(72551,'spell_festergut_gastric_bloat'),
(72552,'spell_festergut_gastric_bloat'),
(72553,'spell_festergut_gastric_bloat');

COMMIT;
