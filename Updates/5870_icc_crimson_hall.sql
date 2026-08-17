-- Icecrown Citadel Crimson Hall encounter and progression data.
-- Companion update for the Crimson Hall ScriptDev2 implementation.

START TRANSACTION;

-- Blood Prince Council and encounter actors.
UPDATE `creature_template` SET `ScriptName`='boss_valanar_icc' WHERE `Entry`=37970;
UPDATE `creature_template` SET `ScriptName`='boss_keleseth_icc' WHERE `Entry`=37972;
UPDATE `creature_template` SET `ScriptName`='boss_taldaram_icc' WHERE `Entry`=37973;
UPDATE `creature_template` SET `ScriptName`='npc_blood_orb_control' WHERE `Entry`=38008;
UPDATE `creature_template` SET `ScriptName`='npc_dark_nucleus' WHERE `Entry`=38369;
UPDATE `creature_template` SET `ScriptName`='npc_ball_of_flame' WHERE `Entry` IN (38332,38451);
UPDATE `creature_template` SET `ScriptName`='npc_kinetic_bomb' WHERE `Entry`=38454;

-- The flame actors provide the spell visual. The separate kinetic helper is
-- an invisible, non-selectable server actor rather than a visible golem.
UPDATE `creature_template`
SET `DisplayId1`=26767,`DisplayId2`=0,`DisplayId3`=0,`DisplayId4`=0,
    `DisplayIdProbability1`=100,`DisplayIdProbability2`=0,
    `DisplayIdProbability3`=0,`DisplayIdProbability4`=0
WHERE `Entry` IN (38332,38451);

UPDATE `creature_template`
SET `DisplayId1`=21342,`DisplayId2`=0,`DisplayId3`=0,`DisplayId4`=0,
    `DisplayIdProbability1`=100,`DisplayIdProbability2`=0,
    `DisplayIdProbability3`=0,`DisplayIdProbability4`=0,
    `UnitFlags`=`UnitFlags` | 33554432
WHERE `Entry`=38458;

-- Blood-Queen Lana'thel and her introduction controller.
UPDATE `creature_template` SET `ScriptName`='npc_queen_lanathel_intro' WHERE `Entry`=38004;
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE `Entry`=37955;

-- Spell hooks used by the matching encounter scripts.
DELETE FROM `spell_scripts` WHERE `Id` IN
(73001,70946,71475,71476,71477,70877,71474);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(73001,'spell_blood_council_shadow_prison'),
(70946,'spell_blood_queen_vampiric_bite'),
(71475,'spell_blood_queen_vampiric_bite'),
(71476,'spell_blood_queen_vampiric_bite'),
(71477,'spell_blood_queen_vampiric_bite'),
(70877,'spell_blood_queen_frenzied_bloodthirst'),
(71474,'spell_blood_queen_frenzied_bloodthirst');

COMMIT;
