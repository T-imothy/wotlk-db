-- Icecrown Citadel: Frostwing Halls progression and trash controllers.

START TRANSACTION;

-- Upper Spire frost-jet gauntlet.
UPDATE `creature_template`
SET `ScriptName`='npc_frost_freeze_trap'
WHERE `Entry`=37744;

UPDATE `creature`
SET `spawnMask`=15
WHERE `map`=631 AND `id`=37744;

DELETE FROM `scripted_areatrigger` WHERE `entry` IN (5649,5698);
INSERT INTO `scripted_areatrigger` (`entry`,`ScriptName`) VALUES
(5649,'at_icecrown_citadel'),
(5698,'at_icecrown_citadel');

-- Crok and Sister Svalna's Frostwing escort event. Routine combat casts
-- belong in spell lists; the core scripts retain only escort and encounter
-- state transitions.
UPDATE `creature_template`
SET `ScriptName`='npc_crok_scourgebane',`SpellList`=3712901
WHERE `Entry`=37129;

UPDATE `creature_template`
SET `ScriptName`='boss_sister_svalna',`SpellList`=3712601
WHERE `Entry`=37126;

DELETE FROM `creature_spell_list` WHERE `Id` IN (3712601,3712901);
DELETE FROM `creature_spell_list_entry` WHERE `Id` IN (3712601,3712901);

INSERT INTO `creature_spell_list_entry`
(`Id`,`Name`,`ChanceSupportAction`,`ChanceRangedAttack`) VALUES
(3712601,'ICC - Sister Svalna',0,0),
(3712901,'ICC - Crok Scourgebane',0,0);

INSERT INTO `creature_spell_list`
(`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,
 `Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`) VALUES
(3712601,0,71443,0,-1,100,0,100,1,40000,50000,20000,25000,'Sister Svalna - Impaling Spear'),
(3712601,1,71463,0,-1,2,0,100,1,100000,110000,100000,110000,'Sister Svalna - Aether Shield'),
(3712901,0,71488,0,-1,1,0,100,1,7500,12500,10000,14000,'Crok Scourgebane - Scourge Strike'),
(3712901,1,71489,0,-1,1,0,100,1,25000,30000,25000,30000,'Crok Scourgebane - Death Strike');

DELETE FROM `creature_movement_template` WHERE `Entry`=37129 AND `PathId`=0;
DELETE FROM `script_waypoint` WHERE `Entry`=37129 AND `PathId`=0;
INSERT INTO `script_waypoint`
(`Entry`,`PathId`,`Point`,`PositionX`,`PositionY`,`PositionZ`,`Orientation`,`WaitTime`,`ScriptId`) VALUES
(37129,0,1,4356.90,2648.00,350.285,0,0,0),
(37129,0,2,4357.00,2582.17,351.101,0,0,0),
(37129,0,3,4357.21,2555.91,354.478,0,0,0),
(37129,0,4,4357.09,2547.81,354.766,0,0,0),
(37129,0,5,4356.88,2512.40,358.436,0,0,0);

-- Post-Valithria spider gauntlet controller.
UPDATE `creature_template`
SET `ScriptName`='npc_sindragosa_gauntlet_controller'
WHERE `Entry`=37503;

SET @ICC_FROSTWING_EXISTING_GUID :=
    (SELECT MIN(`guid`) FROM `creature` WHERE `map`=631 AND `id`=37503);
SET @ICC_FROSTWING_CGUID := IFNULL(
    @ICC_FROSTWING_EXISTING_GUID,
    (SELECT IFNULL(MAX(`guid`),0)+1 FROM `creature`));

INSERT INTO `creature`
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,
 `spawntimesecsmin`,`spawntimesecsmax`,`spawndist`,`MovementType`)
SELECT @ICC_FROSTWING_CGUID,37503,631,15,1,
       4181.5,2483.99,211.033,2.18341,604800,604800,0,0
WHERE @ICC_FROSTWING_EXISTING_GUID IS NULL;

UPDATE `creature`
SET `spawnMask`=15,`phaseMask`=1,
    `position_x`=4181.5,`position_y`=2483.99,`position_z`=211.033,
    `orientation`=2.18341,`spawntimesecsmin`=604800,
    `spawntimesecsmax`=604800,`spawndist`=0,`MovementType`=0
WHERE `guid`=@ICC_FROSTWING_CGUID;

DELETE FROM `scripted_areatrigger` WHERE `entry`=5623;
INSERT INTO `scripted_areatrigger` (`entry`,`ScriptName`) VALUES
(5623,'at_icecrown_citadel');

-- Existing pre-Sindragosa packs are shared by all four raid modes.
UPDATE `creature`
SET `spawnMask`=15
WHERE `map`=631 AND `id` IN (37531,37532,37533,37534);

UPDATE `creature_template`
SET `ScriptName`='npc_sindragosa_trash',`SpellList`=3753101
WHERE `Entry`=37531;

UPDATE `creature_template`
SET `ScriptName`='npc_sindragosa_trash',`SpellList`=3753201
WHERE `Entry`=37532;

DELETE FROM `creature_spell_list` WHERE `Id` IN (3753101,3753201);
DELETE FROM `creature_spell_list_entry` WHERE `Id` IN (3753101,3753201);

INSERT INTO `creature_spell_list_entry`
(`Id`,`Name`,`ChanceSupportAction`,`ChanceRangedAttack`) VALUES
(3753101,'ICC - Frostwarden Handler',0,0),
(3753201,'ICC - Frostwing Whelp',0,0);

INSERT INTO `creature_spell_list`
(`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,
 `Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`) VALUES
(3753101,0,71337,0,-1,2,0,100,1,8000,10000,10000,13000,'Frostwarden Handler - Concussive Shock'),
(3753201,0,71361,0,-1,1,0,100,1,3000,6000,5000,8000,'Frostwing Whelp - Frost Blast');

COMMIT;
