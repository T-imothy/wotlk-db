-- Icecrown Citadel Gunship Battle reward caches for all four raid modes.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `entry` BETWEEN 65001 AND 65004;
INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
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
(65004,50667,0,1,1,1,0,'Waistband of Righteous Fury heroic');

REPLACE INTO `reference_loot_template_names` (`entry`,`name`) VALUES
(65001,'ICC Gunship 10 Normal'),
(65002,'ICC Gunship 25 Normal'),
(65003,'ICC Gunship 10 Heroic'),
(65004,'ICC Gunship 25 Heroic');

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (28045,28057,28072,28090);
INSERT INTO `gameobject_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(28045,65001,100,0,-65001,2,0,'Two items: Gunship 10 normal'),
(28045,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28072,65002,100,0,-65002,3,0,'Three items: Gunship 25 normal'),
(28072,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28072,49908,38,0,1,1,0,'Primordial Saronite'),
(28057,65003,100,0,-65003,2,0,'Two items: Gunship 10 heroic'),
(28057,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28057,49908,38,0,1,1,0,'Primordial Saronite'),
(28090,65004,100,0,-65004,3,0,'Three items: Gunship 25 heroic'),
(28090,49426,100,0,2,2,0,'Emblem of Frost x2'),
(28090,49908,50,0,1,1,0,'Primordial Saronite');

DELETE FROM `gameobject`
WHERE `map` IN (672,673)
  AND `id` IN (201872,201873,201874,201875,202177,202178,202179,202180);
DELETE FROM `gameobject` WHERE `guid` BETWEEN 6319101 AND 6319108;

INSERT INTO `gameobject`
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecsmin`,`spawntimesecsmax`) VALUES
(6319101,201873,672,1,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319102,201874,672,2,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319103,201872,672,4,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319104,201875,672,8,1,-45.4489,-0.062003,20.564,0.26977,0,0,0.134476,0.990917,604800,604800),
(6319105,202178,673,1,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
(6319106,202180,673,2,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
(6319107,202177,673,4,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800),
(6319108,202179,673,8,1,-19.8726,-14.1748,33.6377,4.71239,0,0,0.707107,-0.707107,604800,604800);

COMMIT;
