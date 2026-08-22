-- Icecrown Citadel: Lord Marrowgar normal-phase spell list.

START TRANSACTION;

UPDATE `creature_template`
SET `SpellList` = 3661201
WHERE `Entry` = 36612;

DELETE FROM `creature_spell_list`
WHERE `Id` = 3661201;

DELETE FROM `creature_spell_list_entry`
WHERE `Id` = 3661201;

INSERT INTO `creature_spell_list_entry`
    (`Id`, `Name`, `ChanceSupportAction`, `ChanceRangedAttack`)
VALUES
    (3661201, 'Icecrown Citadel - Lord Marrowgar - normal phase', 0, 0);

INSERT INTO `creature_spell_list`
    (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`,
     `ScriptId`, `Availability`, `Probability`, `InitialMin`, `InitialMax`,
     `RepeatMin`, `RepeatMax`, `Comments`)
VALUES
    (3661201, 0, 69055, 0, -1, 1, 0, 100, 1, 8000, 8000, 1000, 1000,
     'Lord Marrowgar - Bone Slice'),
    (3661201, 1, 69140, 0, -1, 2, 0, 100, 1, 5000, 5000, 5000, 5000,
     'Lord Marrowgar - Coldflame');

COMMIT;
