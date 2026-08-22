-- Icecrown Citadel: Lady Deathwhisper phase spell lists.

START TRANSACTION;

UPDATE `creature_template`
SET `SpellList` = 3685501
WHERE `Entry` = 36855;

DELETE FROM `creature_spell_list`
WHERE `Id` IN (3685501, 3685502);

DELETE FROM `creature_spell_list_entry`
WHERE `Id` IN (3685501, 3685502);

INSERT INTO `creature_spell_list_entry`
    (`Id`, `Name`, `ChanceSupportAction`, `ChanceRangedAttack`)
VALUES
    (3685501, 'Icecrown Citadel - Lady Deathwhisper - phase one', 0, 0),
    (3685502, 'Icecrown Citadel - Lady Deathwhisper - phase two', 0, 0);

INSERT INTO `creature_spell_list`
    (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`,
     `ScriptId`, `Availability`, `Probability`, `InitialMin`, `InitialMax`,
     `RepeatMin`, `RepeatMax`, `Comments`)
VALUES
    (3685501, 0, 71254, 0, -1, 100, 0, 100, 1, 0, 0, 2000, 3000,
     'Lady Deathwhisper phase one - Shadow Bolt'),
    (3685501, 1, 71001, 0, -1, 100, 0, 100, 1, 20000, 20000, 20000, 20000,
     'Lady Deathwhisper phase one - Death and Decay'),
    (3685502, 0, 71001, 0, -1, 100, 0, 100, 1, 20000, 20000, 20000, 20000,
     'Lady Deathwhisper phase two - Death and Decay'),
    (3685502, 1, 71204, 0, -1, 1, 0, 100, 1, 1000, 1000, 7000, 7000,
     'Lady Deathwhisper phase two - Touch of Insignificance'),
    (3685502, 2, 71420, 0, -1, 100, 0, 100, 1, 5000, 5000, 12000, 12000,
     'Lady Deathwhisper phase two - Frostbolt'),
    (3685502, 3, 72905, 0, -1, 2, 0, 100, 1, 20000, 20000, 20000, 20000,
     'Lady Deathwhisper phase two - Frostbolt Volley');

COMMIT;
