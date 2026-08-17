-- Icecrown Citadel lower-spire world data.
-- Companion update for the lower-spire ScriptDev2 implementation.

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

-- This is the non-combat forward gate at Light's Hammer.
UPDATE `gameobject_template`
SET `data0` = 1,
    `data2` = 0
WHERE `entry` = 201583
  AND `type` = 0;

-- Zafod's client-known spell lacks the server-side create-item data.
INSERT INTO `spell_template`
    (`Id`, `Attributes`, `AttributesEx2`, `ProcChance`, `Effect1`,
     `EffectImplicitTargetA1`, `EffectItemType1`, `SpellName`, `SchoolMask`)
VALUES
    (70055, 384, 4, 101, 24, 25, 49278, 'Create Rocket Pack', 1)
ON DUPLICATE KEY UPDATE
    `ProcChance` = VALUES(`ProcChance`),
    `Effect1` = VALUES(`Effect1`),
    `EffectImplicitTargetA1` = VALUES(`EffectImplicitTargetA1`),
    `EffectItemType1` = VALUES(`EffectItemType1`);

-- Restrict each cannon to players of its owning faction.
INSERT IGNORE INTO `conditions`
    (`condition_entry`,`type`,`value1`,`value2`,`value3`,`value4`,`flags`,`comments`)
VALUES
    (21,6,67,0,0,0,0,'Horde Player'),
    (22,6,469,0,0,0,0,'Alliance Player');

DELETE FROM `npc_spellclick_spells`
WHERE `npc_entry` IN (36838,36839)
  AND `spell_id` = 70510;

INSERT INTO `npc_spellclick_spells`
    (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`condition_id`)
VALUES
    (36838,70510,0,0,0,1,22),
    (36839,70510,0,0,0,1,21);

-- Cannon heat is encounter-controlled; generic power regeneration races it.
UPDATE `creature_template`
SET `RegenerateStats` = `RegenerateStats` & ~4
WHERE `Entry` IN (36838,36839);

COMMIT;

