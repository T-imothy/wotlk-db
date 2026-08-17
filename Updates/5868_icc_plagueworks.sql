-- Icecrown Citadel Plagueworks encounter and progression data.
-- Companion update for the Plagueworks ScriptDev2 implementation.

START TRANSACTION;

-- Festergut and Rotface.
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE `Entry`=36626;
UPDATE `creature_template` SET `ScriptName`='npc_orange_gas_stalker' WHERE `Entry`=36659;
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `Entry`=36627;
UPDATE `creature_template` SET `ScriptName`='mob_little_ooze' WHERE `Entry`=36897;
UPDATE `creature_template` SET `ScriptName`='mob_big_ooze' WHERE `Entry`=36899;

-- Professor Putricide and encounter summons.
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE `Entry`=36678;
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze_icc' WHERE `Entry`=37697;
UPDATE `creature_template` SET `ScriptName`='npc_gas_cloud_icc' WHERE `Entry`=37562;
UPDATE `creature_template` SET `ScriptName`='npc_growing_ooze_puddle' WHERE `Entry`=37690;
UPDATE `creature_template` SET `ScriptName`='npc_choking_gas_bomb' WHERE `Entry`=38159;
UPDATE `creature_template` SET `ScriptName`='npc_puddle_stalker' WHERE `Entry`=37013;

-- Plagueworks corridor and trap event.
UPDATE `creature_template` SET `ScriptName`='npc_icc_vengeful_fleshreaper' WHERE `Entry`=37038;
UPDATE `creature_template` SET `ScriptName`='npc_putricides_trap' WHERE `Entry`=38879;

DELETE FROM `scripted_areatrigger` WHERE `entry`=5647;
INSERT INTO `scripted_areatrigger` (`entry`,`ScriptName`)
VALUES (5647,'at_putricides_trap');

DELETE FROM `scripted_event_id` WHERE `id` IN (23426,23438);
INSERT INTO `scripted_event_id` (`id`,`ScriptName`) VALUES
(23426,'event_gameobject_citadel_valve'),
(23438,'event_gameobject_citadel_valve');

-- Spell hooks used by the matching encounter scripts.
DELETE FROM `spell_scripts` WHERE `Id` IN
(69165,69290,71222,73033,73034,72219,72551,72552,72553,
 69558,69795,70351,72840,70360,69782);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(69165,'spell_inhale_blight'),
(69290,'spell_festergut_blighted_spores'),
(71222,'spell_festergut_blighted_spores'),
(73033,'spell_festergut_blighted_spores'),
(73034,'spell_festergut_blighted_spores'),
(72219,'spell_festergut_gastric_bloat'),
(72551,'spell_festergut_gastric_bloat'),
(72552,'spell_festergut_gastric_bloat'),
(72553,'spell_festergut_gastric_bloat'),
(69558,'spell_unstable_ooze_rotface'),
(69795,'spell_ooze_flood_trigger'),
(70351,'spell_unstable_experiment'),
(72840,'spell_volatile_experiment'),
(70360,'spell_eat_ooze'),
(69782,'spell_ooze_flood');

COMMIT;
