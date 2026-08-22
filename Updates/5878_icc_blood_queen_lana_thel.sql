-- Icecrown Citadel Blood-Queen Lana'thel encounter and reward data.

START TRANSACTION;

UPDATE `creature_template` SET `ScriptName`='npc_queen_lanathel_intro' WHERE `Entry`=38004;
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel' WHERE `Entry`=37955;

DELETE FROM `spell_scripts` WHERE `Id` IN (70946,71475,71476,71477,70877,71474);
INSERT INTO `spell_scripts` (`Id`,`ScriptName`) VALUES
(70946,'spell_blood_queen_vampiric_bite'),
(71475,'spell_blood_queen_vampiric_bite'),
(71476,'spell_blood_queen_vampiric_bite'),
(71477,'spell_blood_queen_vampiric_bite'),
(70877,'spell_blood_queen_frenzied_bloodthirst'),
(71474,'spell_blood_queen_frenzied_bloodthirst');

UPDATE `creature_template`
SET `LootId`=`Entry`,`MinLootGold`=300000,`MaxLootGold`=350000
WHERE `Entry` IN (37955,38434,38435,38436);

DELETE FROM `reference_loot_template` WHERE `entry` BETWEEN 65101 AND 65106;
INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(65101,51384,0,1,1,1,0,'Bloodsipper'),
(65101,51385,0,1,1,1,0,'Stakethrower'),
(65101,51386,0,1,1,1,0,'Throatrender Handguards'),
(65101,51387,0,1,1,1,0,'Seal of the Twilight Queen'),
(65101,51548,0,1,1,1,0,'Collar of Haughty Disdain'),
(65101,51550,0,1,1,1,0,'Ivory-Inlaid Leggings'),
(65101,51551,0,1,1,1,0,'Chestguard of Siphoned Elements'),
(65101,51552,0,1,1,1,0,'Shoulderpads of the Searing Kiss'),
(65101,51553,0,1,1,1,0,'Lana''thel''s Bloody Nail'),
(65101,51554,0,1,1,1,0,'Cowl of Malefic Repose'),
(65101,51555,0,1,1,1,0,'Tightening Waistband'),
(65101,51556,0,1,1,1,0,'Veincrusher Gauntlets'),
(65102,50065,0,1,1,1,0,'Icecrown Glacial Wall'),
(65102,50178,0,1,1,1,0,'Bloodfall'),
(65102,50180,0,1,1,1,0,'Lana''thel''s Chain of Flagellation'),
(65102,50181,0,1,1,1,0,'Dying Light'),
(65102,50182,0,1,1,1,0,'Blood Queen''s Crimson Choker'),
(65102,50354,0,1,1,1,0,'Bauble of True Blood'),
(65103,51835,0,1,1,1,0,'Veincrusher Gauntlets heroic'),
(65103,51836,0,1,1,1,0,'Tightening Waistband heroic'),
(65103,51837,0,1,1,1,0,'Cowl of Malefic Repose heroic'),
(65103,51838,0,1,1,1,0,'Lana''thel''s Bloody Nail heroic'),
(65103,51839,0,1,1,1,0,'Shoulderpads of the Searing Kiss heroic'),
(65103,51840,0,1,1,1,0,'Chestguard of Siphoned Elements heroic'),
(65103,51841,0,1,1,1,0,'Ivory-Inlaid Leggings heroic'),
(65103,51842,0,1,1,1,0,'Collar of Haughty Disdain heroic'),
(65103,51843,0,1,1,1,0,'Seal of the Twilight Queen heroic'),
(65103,51844,0,1,1,1,0,'Throatrender Handguards heroic'),
(65103,51845,0,1,1,1,0,'Stakethrower heroic'),
(65103,51846,0,1,1,1,0,'Bloodsipper heroic'),
(65104,50724,0,1,1,1,0,'Blood Queen''s Crimson Choker heroic'),
(65104,50725,0,1,1,1,0,'Dying Light heroic'),
(65104,50726,0,1,1,1,0,'Bauble of True Blood heroic'),
(65104,50727,0,1,1,1,0,'Bloodfall heroic'),
(65104,50728,0,1,1,1,0,'Lana''thel''s Chain of Flagellation heroic'),
(65104,50729,0,1,1,1,0,'Icecrown Glacial Wall heroic'),
(65105,52025,0,1,1,1,0,'Vanquisher''s Mark of Sanctification'),
(65105,52026,0,1,1,1,0,'Protector''s Mark of Sanctification'),
(65105,52027,0,1,1,1,0,'Conqueror''s Mark of Sanctification'),
(65106,52028,0,1,1,1,0,'Vanquisher''s Mark of Sanctification heroic'),
(65106,52029,0,1,1,1,0,'Protector''s Mark of Sanctification heroic'),
(65106,52030,0,1,1,1,0,'Conqueror''s Mark of Sanctification heroic');

DELETE FROM `reference_loot_template_names` WHERE `entry` BETWEEN 65101 AND 65106;
INSERT INTO `reference_loot_template_names` (`entry`,`name`) VALUES
(65101,'ICC Blood-Queen Lana''thel 10 Normal'),
(65102,'ICC Blood-Queen Lana''thel 25 Normal'),
(65103,'ICC Blood-Queen Lana''thel 10 Heroic'),
(65104,'ICC Blood-Queen Lana''thel 25 Heroic'),
(65105,'ICC Blood-Queen normal Marks'),
(65106,'ICC Blood-Queen heroic Marks');

DELETE FROM `creature_loot_template` WHERE `entry` IN (37955,38434,38435,38436);
INSERT INTO `creature_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(37955,65101,100,0,-65101,2,0,'Blood Queen 10N: two items'),
(37955,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38434,65102,100,0,-65102,1,0,'Blood Queen 25N: one weapon or trinket'),
(38434,65105,100,0,-65105,2,0,'Blood Queen 25N: two normal marks'),
(38434,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38434,49908,38,0,1,1,0,'Primordial Saronite'),
(38435,65103,100,0,-65103,2,0,'Blood Queen 10H: two heroic items'),
(38435,65105,100,0,-65105,1,0,'Blood Queen 10H: one normal mark'),
(38435,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38435,49908,38,0,1,1,0,'Primordial Saronite'),
(38436,65104,100,0,-65104,1,0,'Blood Queen 25H: one heroic weapon or trinket'),
(38436,65105,100,0,-65105,2,0,'Blood Queen 25H: two normal marks'),
(38436,65106,100,0,-65106,1,0,'Blood Queen 25H: one heroic mark'),
(38436,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38436,49908,38,0,1,1,0,'Primordial Saronite');

COMMIT;
