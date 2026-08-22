-- Icecrown Citadel Professor Putricide encounter and reward data.

START TRANSACTION;

UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide', `SpellList`=0 WHERE `Entry`=36678;
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze_icc' WHERE `Entry`=37697;
UPDATE `creature_template` SET `ScriptName`='npc_gas_cloud_icc' WHERE `Entry`=37562;
UPDATE `creature_template` SET `ScriptName`='npc_growing_ooze_puddle' WHERE `Entry`=37690;
UPDATE `creature_template` SET `ScriptName`='npc_choking_gas_bomb' WHERE `Entry`=38159;
UPDATE `creature_template` SET `ScriptName`='npc_puddle_stalker' WHERE `Entry`=37013;

DELETE FROM `creature_spell_list`
WHERE `Id` IN (3667801,3667802,3667803);
DELETE FROM `creature_spell_list_entry`
WHERE `Id` IN (3667801,3667802,3667803);

DELETE FROM `spell_scripts` WHERE `Id` IN (70351,72840,70360);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(70351,'spell_unstable_experiment'),
(72840,'spell_volatile_experiment'),
(70360,'spell_eat_ooze');

SET @PUTRICIDE_D1 := (SELECT `DifficultyEntry1` FROM `creature_template` WHERE `Entry`=36678);
SET @PUTRICIDE_D2 := (SELECT `DifficultyEntry2` FROM `creature_template` WHERE `Entry`=36678);
SET @PUTRICIDE_D3 := (SELECT `DifficultyEntry3` FROM `creature_template` WHERE `Entry`=36678);
UPDATE `creature_template`
SET `MinLootGold`=400000, `MaxLootGold`=500000
WHERE `Entry` IN (36678,@PUTRICIDE_D1,@PUTRICIDE_D2,@PUTRICIDE_D3);

COMMIT;
