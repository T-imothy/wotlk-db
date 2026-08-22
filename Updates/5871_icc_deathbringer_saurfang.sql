-- Icecrown Citadel: Deathbringer Saurfang spell list and reward cache.

START TRANSACTION;

-- Both faction-specific intro leaders use the same encounter gossip script.
UPDATE `creature_template`
SET `ScriptName` = 'npc_saurfang_intro_leader'
WHERE `Entry` IN (37187, 37200);

UPDATE `creature_template`
SET `SpellList` = 3781301
WHERE `Entry` = 37813;

DELETE FROM `creature_spell_list`
WHERE `Id` = 3781301;

DELETE FROM `creature_spell_list_entry`
WHERE `Id` = 3781301;

INSERT INTO `creature_spell_list_entry`
    (`Id`, `Name`, `ChanceSupportAction`, `ChanceRangedAttack`)
VALUES
    (3781301, 'Icecrown Citadel - Deathbringer Saurfang', 0, 0);

INSERT INTO `creature_spell_list`
    (`Id`, `Position`, `SpellId`, `Flags`, `CombatCondition`, `TargetId`,
     `ScriptId`, `Availability`, `Probability`, `InitialMin`, `InitialMax`,
     `RepeatMin`, `RepeatMax`, `Comments`)
VALUES
    (3781301, 0, 72410, 0, -1, 1, 0, 100, 1, 20000, 20000, 20000, 25000,
     'Deathbringer Saurfang - Rune of Blood'),
    (3781301, 1, 72385, 0, -1, 2, 0, 100, 1, 15500, 15500, 15000, 20000,
     'Deathbringer Saurfang - Boiling Blood'),
    (3781301, 2, 72378, 0, -1, 2, 0, 100, 1, 17000, 17000, 20000, 25000,
     'Deathbringer Saurfang - Blood Nova');

DELETE FROM `reference_loot_template` WHERE `entry` BETWEEN 65005 AND 65010;
INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(65005,50798,0,1,1,1,0,'Ramaladni''s Blade of Culling'),
(65005,50799,0,1,1,1,0,'Scourge Stranglers'),
(65005,50800,0,1,1,1,0,'Hauberk of a Thousand Cuts'),
(65005,50801,0,1,1,1,0,'Blade-Scored Carapace'),
(65005,50802,0,1,1,1,0,'Gargoyle Spit Bracers'),
(65005,50803,0,1,1,1,0,'Saurfang''s Cold-Forged Band'),
(65005,50804,0,1,1,1,0,'Icecrown Spire Sandals'),
(65005,50805,0,1,1,1,0,'Mag''hari Chieftain''s Staff'),
(65005,50806,0,1,1,1,0,'Leggings of Unrelenting Blood'),
(65005,50807,0,1,1,1,0,'Thaumaturge''s Crackling Cowl'),
(65005,50808,0,1,1,1,0,'Deathforged Legplates'),
(65005,50809,0,1,1,1,0,'Soulcleave Pendant'),
(65006,51894,0,1,1,1,0,'Soulcleave Pendant heroic'),
(65006,51895,0,1,1,1,0,'Deathforged Legplates heroic'),
(65006,51896,0,1,1,1,0,'Thaumaturge''s Crackling Cowl heroic'),
(65006,51897,0,1,1,1,0,'Leggings of Unrelenting Blood heroic'),
(65006,51898,0,1,1,1,0,'Mag''hari Chieftain''s Staff heroic'),
(65006,51899,0,1,1,1,0,'Icecrown Spire Sandals heroic'),
(65006,51900,0,1,1,1,0,'Saurfang''s Cold-Forged Band heroic'),
(65006,51901,0,1,1,1,0,'Gargoyle Spit Bracers heroic'),
(65006,51902,0,1,1,1,0,'Blade-Scored Carapace heroic'),
(65006,51903,0,1,1,1,0,'Hauberk of a Thousand Cuts heroic'),
(65006,51904,0,1,1,1,0,'Scourge Stranglers heroic'),
(65006,51905,0,1,1,1,0,'Ramaladni''s Blade of Culling heroic'),
(65007,50014,0,1,1,1,0,'Greatcloak of the Turned Champion'),
(65007,50015,0,1,1,1,0,'Belt of the Blood Nova'),
(65007,50333,0,1,1,1,0,'Toskk''s Maximized Wristguards'),
(65007,50362,0,1,1,1,0,'Deathbringer''s Will'),
(65007,50412,0,1,1,1,0,'Bloodvenom Blade'),
(65008,50363,0,1,1,1,0,'Deathbringer''s Will heroic'),
(65008,50668,0,1,1,1,0,'Greatcloak of the Turned Champion heroic'),
(65008,50670,0,1,1,1,0,'Toskk''s Maximized Wristguards heroic'),
(65008,50671,0,1,1,1,0,'Belt of the Blood Nova heroic'),
(65008,50672,0,1,1,1,0,'Bloodvenom Blade heroic'),
(65009,52025,0,1,1,1,0,'Vanquisher''s Mark of Sanctification'),
(65009,52026,0,1,1,1,0,'Protector''s Mark of Sanctification'),
(65009,52027,0,1,1,1,0,'Conqueror''s Mark of Sanctification'),
(65010,52028,0,1,1,1,0,'Vanquisher''s Mark of Sanctification heroic'),
(65010,52029,0,1,1,1,0,'Protector''s Mark of Sanctification heroic'),
(65010,52030,0,1,1,1,0,'Conqueror''s Mark of Sanctification heroic');

REPLACE INTO `reference_loot_template_names` (`entry`,`name`) VALUES
(65005,'ICC Saurfang 10 Normal'),
(65006,'ICC Saurfang 10 Heroic'),
(65007,'ICC Saurfang 25 Normal'),
(65008,'ICC Saurfang 25 Heroic'),
(65009,'ICC Mark of Sanctification'),
(65010,'ICC Heroic Mark of Sanctification');

-- Reward-cache money is stored on the difficulty-specific GO templates.
UPDATE `gameobject_template` SET `mingold` = 800000,  `maxgold` = 900000  WHERE `entry` = 202239; -- 10 normal
UPDATE `gameobject_template` SET `mingold` = 2000000, `maxgold` = 2250000 WHERE `entry` = 202240; -- 25 normal
UPDATE `gameobject_template` SET `mingold` = 1000000, `maxgold` = 1200000 WHERE `entry` = 202238; -- 10 heroic
UPDATE `gameobject_template` SET `mingold` = 2000000, `maxgold` = 2250000 WHERE `entry` = 202241; -- 25 heroic

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (28046,28058,28074,28088);
INSERT INTO `gameobject_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(28046,65005,100,0,-65005,2,0,'Two items: Saurfang 10 normal'),
(28046,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28058,65006,100,0,-65006,2,0,'Two items: Saurfang 10 heroic'),
(28058,65009,100,0,-65009,1,0,'One normal Sanctification mark'),
(28058,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28058,49908,20,0,1,1,0,'Primordial Saronite'),
(28074,65007,100,0,-65007,1,0,'One item: Saurfang 25 normal'),
(28074,65009,100,0,-65009,2,0,'Two normal Sanctification marks'),
(28074,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28074,49908,20,0,1,1,0,'Primordial Saronite'),
(28088,65008,100,0,-65008,1,0,'One item: Saurfang 25 heroic'),
(28088,65009,100,0,-65009,2,0,'Two normal Sanctification marks'),
(28088,65010,100,0,-65010,1,0,'One heroic Sanctification mark'),
(28088,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28088,49908,20,0,1,1,0,'Primordial Saronite');

DELETE FROM `gameobject`
WHERE `map` = 631
  AND `id` IN (202238,202239,202240,202241);
DELETE FROM `gameobject` WHERE `guid` BETWEEN 6319109 AND 6319112;

INSERT INTO `gameobject`
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecsmin`,`spawntimesecsmax`) VALUES
(6319109,202239,631,1,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800),
(6319110,202240,631,2,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800),
(6319111,202238,631,4,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800),
(6319112,202241,631,8,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800);

COMMIT;
