-- Icecrown Citadel Plagueworks reward correction.

START TRANSACTION;

-- Verified 3.3.5 Professor Putricide coin range for every difficulty row.
SET @PUTRICIDE_D1 := (SELECT `DifficultyEntry1` FROM `creature_template` WHERE `Entry`=36678);
SET @PUTRICIDE_D2 := (SELECT `DifficultyEntry2` FROM `creature_template` WHERE `Entry`=36678);
SET @PUTRICIDE_D3 := (SELECT `DifficultyEntry3` FROM `creature_template` WHERE `Entry`=36678);

UPDATE `creature_template`
SET `MinLootGold`=400000, `MaxLootGold`=500000
WHERE `Entry` IN (36678,@PUTRICIDE_D1,@PUTRICIDE_D2,@PUTRICIDE_D3);

COMMIT;
