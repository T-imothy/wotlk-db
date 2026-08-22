-- Icecrown Citadel: Lich King runtime bindings and encounter support.
-- Loot is appended separately; Shadowmourne quest drops are intentionally
-- reserved for a dedicated quest-chain update.

START TRANSACTION;

UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king_icc', `SpellList`=0 WHERE `Entry`=36597;
UPDATE `creature_template` SET `ScriptName`='npc_tirion_fordring_tft' WHERE `Entry`=38995;
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror_icc', `SpellList`=0 WHERE `Entry`=37698;
UPDATE `creature_template` SET `ScriptName`='npc_raging_spirit_icc', `SpellList`=0 WHERE `Entry`=36701;
UPDATE `creature_template` SET `ScriptName`='npc_defile_icc' WHERE `Entry`=38757;
UPDATE `creature_template` SET `ScriptName`='npc_vile_spirit_icc' WHERE `Entry`=37799;
UPDATE `creature_template` SET `ScriptName`='npc_shadow_trap_icc' WHERE `Entry`=39137;
UPDATE `creature_template` SET `ScriptName`='npc_ice_sphere_icc' WHERE `Entry`=36633;
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_shadowguard_icc' WHERE `Entry`=36609;
UPDATE `creature_template` SET `ScriptName`='npc_terenas_frostmourne_icc' WHERE `Entry` IN (36823,39217);
UPDATE `creature_template` SET `ScriptName`='npc_spirit_warden_icc', `SpellList`=0 WHERE `Entry`=36824;
UPDATE `creature_template` SET `ScriptName`='npc_spirit_bomb_icc' WHERE `Entry`=39189;

-- Frozen Throne scenery is script-controlled and must not remain clickable.
UPDATE `gameobject_template`
SET `flags`=`flags` | 0x10
WHERE `entry` IN (202078,202141,202142,202143,202144,202161,202188,202189,202190);

-- Give the Arthas platform the destructible state used by Quake transitions.
UPDATE `gameobject_template`
SET `data0`=1, `data5`=1
WHERE `entry`=202161;

DELETE FROM `spell_scripts`
WHERE `Id` IN (69200,70337,73912,73913,73914,70338,73785,73786,73787,
               72754,73708,73709,73710);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(69200,'spell_lich_king_raging_spirit'),
(70337,'spell_lich_king_necrotic_plague'),
(73912,'spell_lich_king_necrotic_plague'),
(73913,'spell_lich_king_necrotic_plague'),
(73914,'spell_lich_king_necrotic_plague'),
(70338,'spell_lich_king_necrotic_plague_jump'),
(73785,'spell_lich_king_necrotic_plague_jump'),
(73786,'spell_lich_king_necrotic_plague_jump'),
(73787,'spell_lich_king_necrotic_plague_jump'),
(72754,'spell_lich_king_defile'),
(73708,'spell_lich_king_defile'),
(73709,'spell_lich_king_defile'),
(73710,'spell_lich_king_defile');

-- Ice Lock is an implicit area spell; restrict its scripted target to Tirion.
DELETE FROM `spell_script_target` WHERE `entry`=71614;
INSERT INTO `spell_script_target`
    (`entry`,`type`,`targetEntry`,`inverseEffectMask`)
VALUES
    (71614,1,38995,0);

-- Val'kyr need the retail vehicle kit for passenger pickup and transport.
UPDATE `creature_template`
SET `VehicleTemplateId`=532
WHERE `Entry` IN (36609,39120,39121,39122);

-- CMaNGOS caps corpse lifetime relative to spawn delay. Keep the loot corpse
-- present while movie 16 plays instead of despawning it during the cinematic.
UPDATE `creature`
SET `spawntimesecsmin`=604800, `spawntimesecsmax`=604800
WHERE `map`=631 AND `id`=36597;

COMMIT;

-- Icecrown Citadel: restore the Lich King death movie and difficulty loot.

START TRANSACTION;

DELETE FROM `spell_scripts` WHERE `Id`=73159;
INSERT INTO `spell_scripts` (`Id`,`ScriptName`)
VALUES (73159,'spell_play_movie');

UPDATE `creature_template`
SET `LootId`=`Entry`
WHERE `Entry` IN (36597,39166,39167,39168);

DELETE FROM `creature_loot_template`
WHERE `entry` IN (36597,39166,39167,39168);

INSERT INTO `creature_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`)
VALUES
-- 10-player normal: two ilvl 258 weapons and two Emblems.
(36597,34238,100,0,-34238,2,0,'The Lich King 10N - weapon reference'),
(36597,49426,100,0,2,2,0,'The Lich King 10N - Emblem of Frost'),
-- 25-player normal.
(39166,34250,100,0,-34250,2,0,'The Lich King 25N - weapon reference'),
(39166,34278,100,0,-34278,2,0,'The Lich King 25N - mark reference'),
(39166,49426,100,0,2,2,0,'The Lich King 25N - Emblem of Frost'),
(39166,49908,38,0,1,1,0,'The Lich King 25N - Primordial Saronite'),
-- 10-player heroic.
(39167,34262,100,0,-34262,2,0,'The Lich King 10H - weapon reference'),
(39167,34278,100,0,-34278,1,0,'The Lich King 10H - mark reference'),
(39167,49426,100,0,2,2,0,'The Lich King 10H - Emblem of Frost'),
(39167,49908,38,0,1,1,0,'The Lich King 10H - Primordial Saronite'),
-- 25-player heroic.
(39168,34274,100,0,-34274,2,0,'The Lich King 25H - weapon reference'),
(39168,34278,100,0,-34278,2,0,'The Lich King 25H - mark reference'),
(39168,34279,100,0,-34279,1,0,'The Lich King 25H - heroic mark reference'),
(39168,49426,100,0,2,2,0,'The Lich King 25H - Emblem of Frost'),
(39168,49908,38,0,1,1,0,'The Lich King 25H - Primordial Saronite'),
(39168,50818,100,0,1,1,0,'The Lich King 25H - Invincible Reins');

DELETE FROM `reference_loot_template`
WHERE `entry` IN (34238,34250,34262,34274,34278,34279);

INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`)
VALUES
-- 10-player normal weapons.
(34238,51795,0,1,1,1,0,'Troggbane, Axe of the Frostborne King'),
(34238,51796,0,1,1,1,0,'Warmace of Menethil'),
(34238,51797,0,1,1,1,0,'Tainted Twig of Nordrassil'),
(34238,51798,0,1,1,1,0,'Valius, Gavel of the Lightbringer'),
(34238,51799,0,1,1,1,0,'Halion, Staff of Forgotten Love'),
(34238,51800,0,1,1,1,0,'Stormfury, Black Blade of the Betrayer'),
(34238,51801,0,1,1,1,0,'Pugius, Fist of Defiance'),
(34238,51802,0,1,1,1,0,'Windrunner\'s Heartseeker'),
(34238,51803,0,1,1,1,0,'Tel\'thas, Dagger of the Blood King'),
-- 25-player normal weapons.
(34250,49981,0,1,1,1,0,'Fal\'inrush, Defender of Quel\'thalas'),
(34250,49997,0,1,1,1,0,'Mithrios, Bronzebeard\'s Legacy'),
(34250,50012,0,1,1,1,0,'Havoc\'s Call, Blade of Lordaeron Kings'),
(34250,50070,0,1,1,1,0,'Glorenzelg, High-Blade of the Silver Hand'),
(34250,50425,0,1,1,1,0,'Oathbinder, Charge of the Ranger-General'),
(34250,50426,0,1,1,1,0,'Heaven\'s Fall, Kryss of a Thousand Lies'),
(34250,50427,0,1,1,1,0,'Bloodsurge, Kel\'Thuzad\'s Blade of Agony'),
(34250,50428,0,1,1,1,0,'Royal Scepter of Terenas II'),
(34250,50429,0,1,1,1,0,'Archus, Greatstaff of Antonidas'),
-- 10-player heroic weapons.
(34262,51939,0,1,1,1,0,'Tel\'thas, Dagger of the Blood King'),
(34262,51940,0,1,1,1,0,'Windrunner\'s Heartseeker'),
(34262,51941,0,1,1,1,0,'Pugius, Fist of Defiance'),
(34262,51942,0,1,1,1,0,'Stormfury, Black Blade of the Betrayer'),
(34262,51943,0,1,1,1,0,'Halion, Staff of Forgotten Love'),
(34262,51944,0,1,1,1,0,'Valius, Gavel of the Lightbringer'),
(34262,51945,0,1,1,1,0,'Tainted Twig of Nordrassil'),
(34262,51946,0,1,1,1,0,'Warmace of Menethil'),
(34262,51947,0,1,1,1,0,'Troggbane, Axe of the Frostborne King'),
-- 25-player heroic weapons.
(34274,50730,0,1,1,1,0,'Glorenzelg, High-Blade of the Silver Hand'),
(34274,50731,0,1,1,1,0,'Archus, Greatstaff of Antonidas'),
(34274,50732,0,1,1,1,0,'Bloodsurge, Kel\'Thuzad\'s Blade of Agony'),
(34274,50733,0,1,1,1,0,'Fal\'inrush, Defender of Quel\'thalas'),
(34274,50734,0,1,1,1,0,'Royal Scepter of Terenas II'),
(34274,50735,0,1,1,1,0,'Oathbinder, Charge of the Ranger-General'),
(34274,50736,0,1,1,1,0,'Heaven\'s Fall, Kryss of a Thousand Lies'),
(34274,50737,0,1,1,1,0,'Havoc\'s Call, Blade of Lordaeron Kings'),
(34274,50738,0,1,1,1,0,'Mithrios, Bronzebeard\'s Legacy'),
-- Marks of Sanctification.
(34278,52025,0,1,1,1,0,'Vanquisher\'s Mark of Sanctification'),
(34278,52026,0,1,1,1,0,'Protector\'s Mark of Sanctification'),
(34278,52027,0,1,1,1,0,'Conqueror\'s Mark of Sanctification'),
(34279,52028,0,1,1,1,0,'Vanquisher\'s Mark of Sanctification'),
(34279,52029,0,1,1,1,0,'Protector\'s Mark of Sanctification'),
(34279,52030,0,1,1,1,0,'Conqueror\'s Mark of Sanctification');

COMMIT;
