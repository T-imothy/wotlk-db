-- Icecrown Citadel Crimson Hall rewards for 10N, 25N, 10H, and 25H.

START TRANSACTION;

-- Blood Prince Council has one encounter reward owner. Keleseth and Taldaram
-- must not create additional independent loot or coin rolls.
SET @KELESETH_D1 := (SELECT `DifficultyEntry1` FROM `creature_template` WHERE `Entry`=37972);
SET @KELESETH_D2 := (SELECT `DifficultyEntry2` FROM `creature_template` WHERE `Entry`=37972);
SET @KELESETH_D3 := (SELECT `DifficultyEntry3` FROM `creature_template` WHERE `Entry`=37972);
SET @TALDARAM_D1 := (SELECT `DifficultyEntry1` FROM `creature_template` WHERE `Entry`=37973);
SET @TALDARAM_D2 := (SELECT `DifficultyEntry2` FROM `creature_template` WHERE `Entry`=37973);
SET @TALDARAM_D3 := (SELECT `DifficultyEntry3` FROM `creature_template` WHERE `Entry`=37973);

UPDATE `creature_template`
SET `LootId`=0,`MinLootGold`=0,`MaxLootGold`=0
WHERE `Entry` IN
(37972,@KELESETH_D1,@KELESETH_D2,@KELESETH_D3,
 37973,@TALDARAM_D1,@TALDARAM_D2,@TALDARAM_D3);

UPDATE `creature_template` SET `LootId`=`Entry`
WHERE `Entry` IN (37970,38401,38784,38785);

DELETE FROM `reference_loot_template` WHERE `entry` BETWEEN 65031 AND 65034;
INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(65031,51021,0,1,1,1,0,'Soulbreaker'),
(65031,51022,0,1,1,1,0,'Hersir''s Greatspear'),
(65031,51023,0,1,1,1,0,'Taldaram''s Soft Slippers'),
(65031,51024,0,1,1,1,0,'Thrice Fanged Signet'),
(65031,51025,0,1,1,1,0,'Battle-Maiden''s Legguards'),
(65031,51325,0,1,1,1,0,'Blood-Drinker''s Girdle'),
(65031,51326,0,1,1,1,0,'Wand of Ruby Claret'),
(65031,51379,0,1,1,1,0,'Bloodsoul Raiment'),
(65031,51380,0,1,1,1,0,'Pale Corpse Boots'),
(65031,51381,0,1,1,1,0,'Cerise Coiled Ring'),
(65031,51382,0,1,1,1,0,'Heartsick Mender''s Cape'),
(65031,51383,0,1,1,1,0,'Spaulders of the Blood Princes'),
(65032,49919,0,1,1,1,0,'Cryptmaker'),
(65032,50071,0,1,1,1,0,'Treads of the Wasteland'),
(65032,50072,0,1,1,1,0,'Landsoul''s Horned Greathelm'),
(65032,50073,0,1,1,1,0,'Geistlord''s Punishment Sack'),
(65032,50074,0,1,1,1,0,'Royal Crimson Cloak'),
(65032,50075,0,1,1,1,0,'Taldaram''s Plated Fists'),
(65032,50170,0,1,1,1,0,'Valanar''s Other Signet Ring'),
(65032,50171,0,1,1,1,0,'Shoulders of Frost-Tipped Thorns'),
(65032,50172,0,1,1,1,0,'Sanguine Silk Robes'),
(65032,50173,0,1,1,1,0,'Shadow Silk Spindle'),
(65032,50174,0,1,1,1,0,'Incarnadine Band of Mending'),
(65032,50175,0,1,1,1,0,'Crypt Keeper''s Bracers'),
(65032,50176,0,1,1,1,0,'San''layn Ritualist Gloves'),
(65032,50177,0,1,1,1,0,'Mail of Crimson Coins'),
(65032,50184,0,1,1,1,0,'Keleseth''s Seducer'),
(65033,51847,0,1,1,1,0,'Spaulders of the Blood Princes heroic'),
(65033,51848,0,1,1,1,0,'Heartsick Mender''s Cape heroic'),
(65033,51849,0,1,1,1,0,'Cerise Coiled Ring heroic'),
(65033,51850,0,1,1,1,0,'Pale Corpse Boots heroic'),
(65033,51851,0,1,1,1,0,'Bloodsoul Raiment heroic'),
(65033,51852,0,1,1,1,0,'Wand of Ruby Claret heroic'),
(65033,51853,0,1,1,1,0,'Blood-Drinker''s Girdle heroic'),
(65033,51854,0,1,1,1,0,'Battle-Maiden''s Legguards heroic'),
(65033,51855,0,1,1,1,0,'Thrice Fanged Signet heroic'),
(65033,51856,0,1,1,1,0,'Taldaram''s Soft Slippers heroic'),
(65033,51857,0,1,1,1,0,'Hersir''s Greatspear heroic'),
(65033,51858,0,1,1,1,0,'Soulbreaker heroic'),
(65034,50603,0,1,1,1,0,'Cryptmaker heroic'),
(65034,50710,0,1,1,1,0,'Keleseth''s Seducer heroic'),
(65034,50711,0,1,1,1,0,'Treads of the Wasteland heroic'),
(65034,50712,0,1,1,1,0,'Landsoul''s Horned Greathelm heroic'),
(65034,50713,0,1,1,1,0,'Geistlord''s Punishment Sack heroic'),
(65034,50714,0,1,1,1,0,'Valanar''s Other Signet Ring heroic'),
(65034,50715,0,1,1,1,0,'Shoulders of Frost-Tipped Thorns heroic'),
(65034,50716,0,1,1,1,0,'Taldaram''s Plated Fists heroic'),
(65034,50717,0,1,1,1,0,'Sanguine Silk Robes heroic'),
(65034,50718,0,1,1,1,0,'Royal Crimson Cloak heroic'),
(65034,50719,0,1,1,1,0,'Shadow Silk Spindle heroic'),
(65034,50720,0,1,1,1,0,'Incarnadine Band of Mending heroic'),
(65034,50721,0,1,1,1,0,'Crypt Keeper''s Bracers heroic'),
(65034,50722,0,1,1,1,0,'San''layn Ritualist Gloves heroic'),
(65034,50723,0,1,1,1,0,'Mail of Crimson Coins heroic');

REPLACE INTO `reference_loot_template_names` (`entry`,`name`) VALUES
(65031,'ICC Blood Prince Council 10 Normal'),
(65032,'ICC Blood Prince Council 25 Normal'),
(65033,'ICC Blood Prince Council 10 Heroic'),
(65034,'ICC Blood Prince Council 25 Heroic');

DELETE FROM `creature_loot_template` WHERE `entry` IN (37970,38401,38784,38785);
INSERT INTO `creature_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(37970,65031,100,0,-65031,2,0,'Council 10N: two items'),
(37970,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38401,65032,100,0,-65032,3,0,'Council 25N: three items'),
(38401,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38401,49908,38,0,1,1,0,'Primordial Saronite'),
(38401,50274,-38,0,1,1,0,'Shadowfrost Shard quest chance'),
(38784,65033,100,0,-65033,2,0,'Council 10H: two items'),
(38784,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38784,49908,38,0,1,1,0,'Primordial Saronite'),
(38785,65034,100,0,-65034,3,0,'Council 25H: three items'),
(38785,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38785,49908,38,0,1,1,0,'Primordial Saronite'),
(38785,50274,-68,0,1,1,0,'Shadowfrost Shard quest chance');

-- Blood-Queen Lana'thel.
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
(38434,50274,-38,0,1,1,0,'Shadowfrost Shard quest chance'),
(38435,65103,100,0,-65103,2,0,'Blood Queen 10H: two heroic items'),
(38435,65105,100,0,-65105,1,0,'Blood Queen 10H: one normal mark'),
(38435,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38435,49908,38,0,1,1,0,'Primordial Saronite'),
(38436,65104,100,0,-65104,1,0,'Blood Queen 25H: one heroic weapon or trinket'),
(38436,65105,100,0,-65105,2,0,'Blood Queen 25H: two normal marks'),
(38436,65106,100,0,-65106,1,0,'Blood Queen 25H: one heroic mark'),
(38436,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38436,49908,38,0,1,1,0,'Primordial Saronite'),
(38436,50274,-68,0,1,1,0,'Shadowfrost Shard quest chance');

COMMIT;
