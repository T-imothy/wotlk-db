-- Icecrown Citadel lower-spire trash and Light's Hammer progression.

START TRANSACTION;

-- Nerub'ar Broodkeeper: restore Dark Mending.
UPDATE `creature_ai_scripts`
SET `action1_param1` = 71020,
    `comment` = 'Nerub''ar Broodkeeper - Cast Dark Mending on Friendly Missing HP'
WHERE `id` = 3672503
  AND `creature_id` = 36725;

-- The instance script owns the two-kill Light's Hammer prologue.
DELETE FROM `creature_ai_scripts`
WHERE `id` = 3701104
  AND `creature_id` = 37011;

-- Non-combat forward gate at Light's Hammer.
UPDATE `gameobject_template`
SET `data0` = 1,
    `data2` = 0
WHERE `entry` = 201583
  AND `type` = 0;

-- Spire Frostwyrm: movement and the low-health enrage remain encounter logic;
-- the normal combat rotation belongs to the creature spell-list system.
UPDATE `creature_template`
SET `ScriptName` = 'npc_spire_frostwyrm_icc',
    `SpellList` = 3723001
WHERE `Entry` = 37230;

DELETE FROM `creature_ai_scripts`
WHERE `creature_id` = 37230;

DELETE FROM `creature_spell_list`
WHERE `Id` = 3723001;
DELETE FROM `creature_spell_list_entry`
WHERE `Id` = 3723001;

INSERT INTO `creature_spell_list_entry`
    (`Id`, `Name`, `ChanceSupportAction`, `ChanceRangedAttack`)
VALUES
    (3723001, 'ICC - Spire Frostwyrm', 0, 0);

INSERT INTO `creature_spell_list`
    (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`, `ScriptId`,
     `Availability`, `Probability`, `InitialMin`, `InitialMax`, `RepeatMin`, `RepeatMax`, `Comments`)
VALUES
    (3723001, 0, 70362, 0, -1, 100, 0, 100, 1, 10000, 13000, 13000, 16000, 'Spire Frostwyrm - Blizzard'),
    (3723001, 1, 70361, 0, -1,   1, 0, 100, 1,  8000, 10000,  3000,  6000, 'Spire Frostwyrm - Cleave'),
    (3723001, 2, 70116, 0, -1,   1, 0, 100, 1, 13000, 15000,  6000,  9000, 'Spire Frostwyrm - Frost Breath');

-- Both trigger volumes on each faction's rampart start the same scripted event.
DELETE FROM `scripted_areatrigger`
WHERE `entry` IN (5628, 5629, 5630, 5631);
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`)
VALUES
    (5628, 'at_rampart_skull'),
    (5629, 'at_rampart_skull'),
    (5630, 'at_rampart_skull'),
    (5631, 'at_rampart_skull');

COMMIT;
