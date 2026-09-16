-- Recover the cumulative V3/September 1 ICC test data.
-- Apply after 5900 through 5918 and alongside the restored core.

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

-- Crok, the Argent captains, and Sister Svalna's Frostwing escort event.
-- Routine combat casts stay DB-driven; ScriptDevAI owns the escort,
-- resurrection, and wipe-reset lifecycle.
UPDATE `creature_template`
SET `AIName`='',`ScriptName`='npc_crok_scourgebane',`SpellList`=3712901
WHERE `Entry`=37129;

UPDATE `creature_template`
SET `AIName`='',`ScriptName`='boss_sister_svalna',`SpellList`=0
WHERE `Entry`=37126;

UPDATE `creature_template`
SET `AIName`='',`ScriptName`='npc_argent_captain'
WHERE `Entry` IN (37122,37123,37124,37125,37491,37493,37494,37495);

DELETE FROM `creature_spell_list` WHERE `Id` IN (3712601,3712901);
DELETE FROM `creature_spell_list_entry` WHERE `Id` IN (3712601,3712901);

INSERT INTO `creature_spell_list_entry`
(`Id`,`Name`,`ChanceSupportAction`,`ChanceRangedAttack`) VALUES
(3712901,'ICC - Crok Scourgebane',0,0);

INSERT INTO `creature_spell_list`
(`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,
 `Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`) VALUES
(3712901,0,71488,0,-1,1,0,100,1,7500,12500,10000,14000,'Crok Scourgebane - Scourge Strike');

-- Correct the living captain rotations inherited from ACID. These rows had
-- several undead-only spell IDs assigned to the friendly captains.
UPDATE `creature_ai_scripts` SET `action1_param1`=71548
WHERE `id` IN (3712202,3712203);
UPDATE `creature_ai_scripts` SET `action1_param1`=71595
WHERE `id` IN (3712204,3712205);
UPDATE `creature_ai_scripts` SET `action1_param1`=71546
WHERE `id` BETWEEN 3712207 AND 3712210;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3712302,3712403);
UPDATE `creature_ai_scripts` SET `action1_param1`=71594
WHERE `id` IN (3712501,3712502);
UPDATE `creature_ai_scripts` SET `action1_param1`=71592
WHERE `id`=3712503;
UPDATE `creature_ai_scripts` SET `action1_param1`=71590
WHERE `id`=3712504;

-- The revived entries reuse the same native EventAI rotations with their
-- undead spell families. The two betrayal abilities exist only here.
DELETE FROM `creature_ai_scripts`
WHERE `creature_id` IN (37491,37493,37494,37495);

INSERT INTO `creature_ai_scripts`
(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
 `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
 `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
 `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
 `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
SELECT 3749100+(`id`-3712200),37491,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
       `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
       `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
       `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
       `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,
       REPLACE(`comment`,'Captain Arnath','Undead Captain Arnath')
FROM `creature_ai_scripts` WHERE `creature_id`=37122;

INSERT INTO `creature_ai_scripts`
(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
 `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
 `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
 `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
 `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
SELECT 3749300+(`id`-3712300),37493,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
       `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
       `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
       `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
       `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,
       REPLACE(`comment`,'Captain Brandon','Undead Captain Brandon')
FROM `creature_ai_scripts` WHERE `creature_id`=37123;

INSERT INTO `creature_ai_scripts`
(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
 `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
 `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
 `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
 `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
SELECT 3749400+(`id`-3712400),37494,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
       `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
       `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
       `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
       `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,
       REPLACE(REPLACE(`comment`,'Captain Groundel','Undead Captain Grondel'),'Captain Grondel','Undead Captain Grondel')
FROM `creature_ai_scripts` WHERE `creature_id`=37124;

INSERT INTO `creature_ai_scripts`
(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
 `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
 `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
 `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
 `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
SELECT 3749500+(`id`-3712500),37495,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
       `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
       `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,
       `action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,
       `action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,
       REPLACE(`comment`,'Captain Rupert','Undead Captain Rupert')
FROM `creature_ai_scripts` WHERE `creature_id`=37125;

UPDATE `creature_ai_scripts` SET `action1_param1`=71780
WHERE `creature_id`=37491 AND `id` IN (3749102,3749103);
UPDATE `creature_ai_scripts` SET `action1_param1`=71782
WHERE `creature_id`=37491 AND `id` IN (3749104,3749105);
UPDATE `creature_ai_scripts` SET `action1_param1`=71778
WHERE `creature_id`=37491 AND `id` BETWEEN 3749107 AND 3749110;

INSERT INTO `creature_ai_scripts`
(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,
 `event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,
 `action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES
(3749305,37493,0,0,100,1055,25000,30000,45000,60000,0,0,11,71784,4,0,'Undead Captain Brandon - Cast Hammer of Betrayal'),
(3749409,37494,0,0,100,1055,12000,17000,10000,15000,0,0,11,71785,4,0,'Undead Captain Grondel - Cast Conflagration');

UPDATE `creature_ai_scripts` SET `action1_param1`=71788
WHERE `creature_id`=37495 AND `id` IN (3749501,3749502);
UPDATE `creature_ai_scripts` SET `action1_param1`=71787
WHERE `creature_id`=37495 AND `id`=3749503;
UPDATE `creature_ai_scripts` SET `action1_param1`=71786
WHERE `creature_id`=37495 AND `id`=3749504;

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

-- Activate the 25-player Frostbinder and Huntress variants used by Svalna.
UPDATE `creature_template`
SET `UnitFlags`=`UnitFlags` & ~33555200
WHERE `Entry` IN (38126,38131);

-- Final tested ICC data: frostwing
START TRANSACTION;

-- BroadcastText records absent from the base world database.
INSERT IGNORE INTO `broadcast_text`
(`Id`,`Text`,`Text1`,`ChatTypeID`,`LanguageID`,`ConditionID`,`EmotesID`,`Flags`,
 `SoundEntriesID1`,`SoundEntriesID2`,`EmoteID1`,`EmoteID2`,`EmoteID3`,
 `EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`VerifiedBuild`) VALUES
(37653,'','Come, Scourgebane. I\'ll show the master which of us is truly worthy of the title of \"Champion\"!',1,0,0,0,0,17020,0,0,0,0,0,0,0,12340);

UPDATE `broadcast_text` SET `ChatTypeID`=1
WHERE `Id` IN (36945,36946,36948,37020,37024,37135,37161,37653,37654);

UPDATE `broadcast_text`
SET `SoundEntriesID1` = CASE `Id`
    WHEN 36945 THEN 16819
    WHEN 36946 THEN 16820
    WHEN 36948 THEN 16585
    WHEN 37020 THEN 17019
    WHEN 37024 THEN 17017
    WHEN 37135 THEN 17023
    WHEN 37161 THEN 0
    WHEN 37653 THEN 17020
    WHEN 37654 THEN 17021
    ELSE `SoundEntriesID1`
END
WHERE `Id` IN (36945,36946,36948,37020,37024,37135,37161,37653,37654);

COMMIT;

START TRANSACTION;

UPDATE `creature_template`
SET `UnitClass`=4, `RegenerateStats`=2
WHERE `Entry` IN (37672,38285);

UPDATE `creature_template`
SET `ScriptName`='npc_mutated_abomination'
WHERE `Entry` IN (37672,38285);

DELETE FROM `creature_ai_scripts`
WHERE `id` IN (3767201,3767202);

DELETE FROM `spell_scripts`
WHERE `Id` IN (70347,71424,71425);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(70347,'spell_putricide_grow'),
(71424,'spell_putricide_slime_puddle_selector'),
(71425,'spell_putricide_slime_puddle_target');

DELETE FROM `string_id`
WHERE `Id` IN (6310004,6310005);
INSERT INTO `string_id` (`Id`,`Name`) VALUES
(6310004,'ICC_ROTFACE_OOZE_FLOOD_UPPER'),
(6310005,'ICC_ROTFACE_OOZE_FLOOD_LOWER');

DELETE FROM `creature_spawn_data_template`
WHERE `Entry` IN (6310002,6310003);
INSERT INTO `creature_spawn_data_template` (`Entry`,`SpawnFlags`,`StringId`,`Name`) VALUES
(6310002,0,6310004,'ICC - Rotface - Ooze Flood upper stalker'),
(6310003,0,6310005,'ICC - Rotface - Ooze Flood lower stalker');

DELETE FROM `creature_spawn_data`
WHERE `Guid` IN
(6310122,6310123,6310126,6310128,6310129,6310130,6310131,6310132,6310133,6310134,
 6310135,6310137,6310138,6310139,6310140,6310141,6310145,6310146,6310147,6310148);
INSERT INTO `creature_spawn_data` (`Guid`,`Id`) VALUES
(6310122,6310003),(6310123,6310002),(6310126,6310002),(6310128,6310003),
(6310129,6310003),(6310130,6310002),(6310131,6310003),(6310132,6310003),
(6310133,6310002),(6310134,6310003),(6310135,6310003),(6310137,6310003),
(6310138,6310002),(6310139,6310003),(6310140,6310002),(6310141,6310003),
(6310145,6310003),(6310146,6310003),(6310147,6310002),(6310148,6310002);

DELETE FROM `spell_script_target`
WHERE `entry` IN (69782,69783);
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`,`inverseEffectMask`) VALUES
(69782,5,6310004,0),
(69783,5,6310005,0);

COMMIT;

START TRANSACTION;
-- Ice Tomb must not regenerate while players break it.
UPDATE creature_template SET ScriptName='npc_ice_tomb_icc', RegenerateStats=RegenerateStats & ~2 WHERE Entry=36980;
DELETE FROM spell_scripts WHERE Id IN (70227,70304);
INSERT INTO spell_scripts (Id,ScriptName) VALUES
(70227,'spell_icc_empowered_blood'),
(70304,'spell_icc_empowered_blood_controller');
COMMIT;
