-- Icecrown Citadel lower-spire reward caches.
-- Fixes Gunship and Deathbringer Saurfang loot for 10N/25N/10H/25H.
-- Also installs one correctly masked cache per faction/difficulty.
-- Safe to rerun against the world database.

START TRANSACTION;

-- Reference IDs reserved for the ICC lower-spire reward pools.
DELETE FROM `reference_loot_template`
WHERE `entry` BETWEEN 65001 AND 65010;

INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
-- Gunship 10 normal
(65001,50340,0,1,1,1,0,'Muradin''s Spyglass'),
(65001,50787,0,1,1,1,0,'Frost Giant''s Cleaver'),
(65001,50788,0,1,1,1,0,'Bone Drake''s Enameled Boots'),
(65001,50789,0,1,1,1,0,'Icecrown Rampart Bracers'),
(65001,50790,0,1,1,1,0,'Abomination''s Bloody Ring'),
(65001,50791,0,1,1,1,0,'Saronite Gargoyle Cloak'),
(65001,50792,0,1,1,1,0,'Pauldrons of Lost Hope'),
(65001,50793,0,1,1,1,0,'Midnight Sun'),
(65001,50794,0,1,1,1,0,'Neverending Winter'),
(65001,50795,0,1,1,1,0,'Cord of Dark Suffering'),
(65001,50796,0,1,1,1,0,'Bracers of Pale Illumination'),
(65001,50797,0,1,1,1,0,'Ice-Reinforced Vrykul Helm'),
-- Gunship 25 normal
(65002,49998,0,1,1,1,0,'Shadowvault Slayer''s Cloak'),
(65002,49999,0,1,1,1,0,'Skeleton Lord''s Circle'),
(65002,50000,0,1,1,1,0,'Scourge Hunter''s Vambraces'),
(65002,50001,0,1,1,1,0,'Ikfirus'' Sack of Wonder'),
(65002,50002,0,1,1,1,0,'Polar Bear Claw Bracers'),
(65002,50003,0,1,1,1,0,'Boneguard Commander''s Pauldrons'),
(65002,50005,0,1,1,1,0,'Amulet of the Silent Eulogy'),
(65002,50006,0,1,1,1,0,'Corp''rethar Ceremonial Crown'),
(65002,50008,0,1,1,1,0,'Ring of Rapid Ascent'),
(65002,50009,0,1,1,1,0,'Boots of Unnatural Growth'),
(65002,50010,0,1,1,1,0,'Waistband of Righteous Fury'),
(65002,50011,0,1,1,1,0,'Gunship Captain''s Mittens'),
(65002,50352,0,1,1,1,0,'Corpse Tongue Coin'),
(65002,50359,0,1,1,1,0,'Althor''s Abacus'),
(65002,50411,0,1,1,1,0,'Scourgeborne Waraxe'),
-- Gunship 10 heroic
(65003,50345,0,1,1,1,0,'Muradin''s Spyglass heroic'),
(65003,51906,0,1,1,1,0,'Ice-Reinforced Vrykul Helm heroic'),
(65003,51907,0,1,1,1,0,'Bracers of Pale Illumination heroic'),
(65003,51908,0,1,1,1,0,'Cord of Dark Suffering heroic'),
(65003,51909,0,1,1,1,0,'Neverending Winter heroic'),
(65003,51910,0,1,1,1,0,'Midnight Sun heroic'),
(65003,51911,0,1,1,1,0,'Pauldrons of Lost Hope heroic'),
(65003,51912,0,1,1,1,0,'Saronite Gargoyle Cloak heroic'),
(65003,51913,0,1,1,1,0,'Abomination''s Bloody Ring heroic'),
(65003,51914,0,1,1,1,0,'Icecrown Rampart Bracers heroic'),
(65003,51915,0,1,1,1,0,'Bone Drake''s Enameled Boots heroic'),
(65003,51916,0,1,1,1,0,'Frost Giant''s Cleaver heroic'),
-- Gunship 25 heroic
(65004,50349,0,1,1,1,0,'Corpse Tongue Coin heroic'),
(65004,50366,0,1,1,1,0,'Althor''s Abacus heroic'),
(65004,50653,0,1,1,1,0,'Shadowvault Slayer''s Cloak heroic'),
(65004,50654,0,1,1,1,0,'Scourgeborne Waraxe heroic'),
(65004,50655,0,1,1,1,0,'Scourge Hunter''s Vambraces heroic'),
(65004,50656,0,1,1,1,0,'Ikfirus'' Sack of Wonder heroic'),
(65004,50657,0,1,1,1,0,'Skeleton Lord''s Circle heroic'),
(65004,50658,0,1,1,1,0,'Amulet of the Silent Eulogy heroic'),
(65004,50659,0,1,1,1,0,'Polar Bear Claw Bracers heroic'),
(65004,50660,0,1,1,1,0,'Boneguard Commander''s Pauldrons heroic'),
(65004,50661,0,1,1,1,0,'Corp''rethar Ceremonial Crown heroic'),
(65004,50663,0,1,1,1,0,'Gunship Captain''s Mittens heroic'),
(65004,50664,0,1,1,1,0,'Ring of Rapid Ascent heroic'),
(65004,50665,0,1,1,1,0,'Boots of Unnatural Growth heroic'),
(65004,50667,0,1,1,1,0,'Waistband of Righteous Fury heroic'),
-- Saurfang 10 normal
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
-- Saurfang 10 heroic
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
-- Saurfang 25 normal
(65007,50014,0,1,1,1,0,'Greatcloak of the Turned Champion'),
(65007,50015,0,1,1,1,0,'Belt of the Blood Nova'),
(65007,50333,0,1,1,1,0,'Toskk''s Maximized Wristguards'),
(65007,50362,0,1,1,1,0,'Deathbringer''s Will'),
(65007,50412,0,1,1,1,0,'Bloodvenom Blade'),
-- Saurfang 25 heroic
(65008,50363,0,1,1,1,0,'Deathbringer''s Will heroic'),
(65008,50668,0,1,1,1,0,'Greatcloak of the Turned Champion heroic'),
(65008,50670,0,1,1,1,0,'Toskk''s Maximized Wristguards heroic'),
(65008,50671,0,1,1,1,0,'Belt of the Blood Nova heroic'),
(65008,50672,0,1,1,1,0,'Bloodvenom Blade heroic'),
-- Tier tokens
(65009,52025,0,1,1,1,0,'Vanquisher''s Mark of Sanctification'),
(65009,52026,0,1,1,1,0,'Protector''s Mark of Sanctification'),
(65009,52027,0,1,1,1,0,'Conqueror''s Mark of Sanctification'),
(65010,52028,0,1,1,1,0,'Vanquisher''s Mark of Sanctification heroic'),
(65010,52029,0,1,1,1,0,'Protector''s Mark of Sanctification heroic'),
(65010,52030,0,1,1,1,0,'Conqueror''s Mark of Sanctification heroic');

REPLACE INTO `reference_loot_template_names` (`entry`,`name`) VALUES
(65001,'ICC Gunship 10 Normal'),
(65002,'ICC Gunship 25 Normal'),
(65003,'ICC Gunship 10 Heroic'),
(65004,'ICC Gunship 25 Heroic'),
(65005,'ICC Saurfang 10 Normal'),
(65006,'ICC Saurfang 10 Heroic'),
(65007,'ICC Saurfang 25 Normal'),
(65008,'ICC Saurfang 25 Heroic'),
(65009,'ICC Mark of Sanctification'),
(65010,'ICC Heroic Mark of Sanctification');

-- Correct gameobject_template Data1 mapping:
-- Gunship: 28045=10N, 28072=25N, 28057=10H, 28090=25H.
-- Saurfang: 28046=10N, 28074=25N, 28058=10H, 28088=25H.
DELETE FROM `gameobject_loot_template`
WHERE `entry` IN (28045,28046,28057,28058,28072,28074,28088,28090);

INSERT INTO `gameobject_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
-- Gunship
(28045,65001,100,0,-65001,2,0,'Two items: Gunship 10 normal'),
(28045,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28072,65002,100,0,-65002,3,0,'Three items: Gunship 25 normal'),
(28072,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28072,49908,38,0,1,1,0,'Primordial Saronite'),
(28072,50274,-35,0,1,1,0,'Shadowfrost Shard quest chance'),
(28057,65003,100,0,-65003,2,0,'Two items: Gunship 10 heroic'),
(28057,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28057,49908,38,0,1,1,0,'Primordial Saronite'),
(28090,65004,100,0,-65004,3,0,'Three items: Gunship 25 heroic'),
(28090,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28090,49908,50,0,1,1,0,'Primordial Saronite'),
(28090,50274,-75,0,1,1,0,'Shadowfrost Shard quest chance'),
-- Saurfang
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
(28074,50274,-38,0,1,1,0,'Shadowfrost Shard quest chance'),
(28088,65008,100,0,-65008,1,0,'One item: Saurfang 25 heroic'),
(28088,65009,100,0,-65009,2,0,'Two normal Sanctification marks'),
(28088,65010,100,0,-65010,1,0,'One heroic Sanctification mark'),
(28088,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28088,49908,20,0,1,1,0,'Primordial Saronite'),
(28088,50274,-68,0,1,1,0,'Shadowfrost Shard quest chance');

-- Replace the all-difficulties cache spawns with one object for each mode.
-- Gunship armories are attached to their transport maps (672 Alliance,
-- 673 Horde); Saurfang's cache remains on ICC map 631.
DELETE FROM `gameobject`
WHERE `map` IN (631,672,673)
  AND `id` IN (201872,201873,201874,201875,202177,202178,202179,202180,
               202238,202239,202240,202241);

DELETE FROM `gameobject` WHERE `guid` BETWEEN 6319101 AND 6319112;

INSERT INTO `gameobject`
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecsmin`,`spawntimesecsmax`) VALUES
-- Alliance Gunship armory: 10N, 25N, 10H, 25H
(6319101,201873,672,1,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319102,201874,672,2,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319103,201872,672,4,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319104,201875,672,8,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
-- Horde Gunship armory: 10N, 25N, 10H, 25H
(6319105,202178,673,1,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
(6319106,202180,673,2,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
(6319107,202177,673,4,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
(6319108,202179,673,8,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
-- Deathbringer's Cache: 10N, 25N, 10H, 25H
(6319109,202239,631,1,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800),
(6319110,202240,631,2,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800),
(6319111,202238,631,4,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800),
(6319112,202241,631,8,1,-489.72,2172.07,539.289,2.65289,0,0,0.970295,0.241925,-604800,-604800);

COMMIT;


