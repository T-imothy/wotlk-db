-- Icecrown Citadel: Sindragosa four-mode reward data.

START TRANSACTION;

UPDATE `creature_template` SET `LootId`=`Entry`
WHERE `Entry` IN (36853,38265,38266,38267);

DELETE FROM `reference_loot_template` WHERE `entry` BETWEEN 65015 AND 65020;
INSERT INTO `reference_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
-- 10 normal
(65015,51779,0,1,1,1,0,'Rimetooth Pendant'),
(65015,51782,0,1,1,1,0,'Etched Dragonbone Warboots'),
(65015,51783,0,1,1,1,0,'Vambraces of the Frost Wyrm Queen'),
(65015,51784,0,1,1,1,0,'Splintershard'),
(65015,51785,0,1,1,1,0,'Wyrmwing Treads'),
(65015,51786,0,1,1,1,0,'Legplates of Aetheric Strife'),
(65015,51787,0,1,1,1,0,'Scourge Fanged Stompers'),
(65015,51788,0,1,1,1,0,'Bleak Coldarra Carver'),
(65015,51789,0,1,1,1,0,'Icicle Shapers'),
(65015,51790,0,1,1,1,0,'Robes of Azure Downfall'),
(65015,51791,0,1,1,1,0,'Lost Pavise of the Blue Flight'),
(65015,51792,0,1,1,1,0,'Shoulderguards of Crystalline Bone'),
-- 25 normal
(65016,50360,0,1,1,1,0,'Phylactery of the Nameless Lich'),
(65016,50361,0,1,1,1,0,'Sindragosa''s Flawless Fang'),
(65016,50421,0,1,1,1,0,'Sindragosa''s Cruel Claw'),
(65016,50423,0,1,1,1,0,'Sundial of Eternal Dusk'),
(65016,50424,0,1,1,1,0,'Memory of Malygos'),
-- 10 heroic
(65017,51811,0,1,1,1,0,'Shoulderguards of Crystalline Bone heroic'),
(65017,51812,0,1,1,1,0,'Lost Pavise of the Blue Flight heroic'),
(65017,51813,0,1,1,1,0,'Robes of Azure Downfall heroic'),
(65017,51814,0,1,1,1,0,'Icicle Shapers heroic'),
(65017,51815,0,1,1,1,0,'Bleak Coldarra Carver heroic'),
(65017,51816,0,1,1,1,0,'Scourge Fanged Stompers heroic'),
(65017,51817,0,1,1,1,0,'Legplates of Aetheric Strife heroic'),
(65017,51818,0,1,1,1,0,'Wyrmwing Treads heroic'),
(65017,51819,0,1,1,1,0,'Splintershard heroic'),
(65017,51820,0,1,1,1,0,'Vambraces of the Frost Wyrm Queen heroic'),
(65017,51821,0,1,1,1,0,'Etched Dragonbone Warboots heroic'),
(65017,51822,0,1,1,1,0,'Rimetooth Pendant heroic'),
-- 25 heroic
(65018,50364,0,1,1,1,0,'Sindragosa''s Flawless Fang heroic'),
(65018,50365,0,1,1,1,0,'Phylactery of the Nameless Lich heroic'),
(65018,50633,0,1,1,1,0,'Sindragosa''s Cruel Claw heroic'),
(65018,50635,0,1,1,1,0,'Sundial of Eternal Dusk heroic'),
(65018,50636,0,1,1,1,0,'Memory of Malygos heroic'),
-- Sanctification marks
(65019,52025,0,1,1,1,0,'Vanquisher''s Mark of Sanctification'),
(65019,52026,0,1,1,1,0,'Protector''s Mark of Sanctification'),
(65019,52027,0,1,1,1,0,'Conqueror''s Mark of Sanctification'),
(65020,52028,0,1,1,1,0,'Vanquisher''s Mark of Sanctification heroic'),
(65020,52029,0,1,1,1,0,'Protector''s Mark of Sanctification heroic'),
(65020,52030,0,1,1,1,0,'Conqueror''s Mark of Sanctification heroic');

REPLACE INTO `reference_loot_template_names` (`entry`,`name`) VALUES
(65015,'ICC Sindragosa 10 Normal'),
(65016,'ICC Sindragosa 25 Normal'),
(65017,'ICC Sindragosa 10 Heroic'),
(65018,'ICC Sindragosa 25 Heroic'),
(65019,'ICC normal Sanctification marks'),
(65020,'ICC heroic Sanctification marks');

DELETE FROM `creature_loot_template` WHERE `entry` IN (36853,38265,38266,38267);
INSERT INTO `creature_loot_template`
(`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`,`comments`) VALUES
(36853,65015,100,0,-65015,2,0,'Sindragosa 10N: two items'),
(36853,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38265,65016,100,0,-65016,1,0,'Sindragosa 25N: one item'),
(38265,65019,100,0,-65019,2,0,'Two normal Sanctification marks'),
(38265,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38265,49908,38,0,1,1,0,'Primordial Saronite'),
(38266,65017,100,0,-65017,2,0,'Sindragosa 10H: two items'),
(38266,65019,100,0,-65019,1,0,'One normal Sanctification mark'),
(38266,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38266,49908,38,0,1,1,0,'Primordial Saronite'),
(38267,65018,100,0,-65018,1,0,'Sindragosa 25H: one item'),
(38267,65019,100,0,-65019,2,0,'Two normal Sanctification marks'),
(38267,65020,100,0,-65020,1,0,'One heroic Sanctification mark'),
(38267,49426,100,0,2,2,0,'Emblem of Frost x2'),
(38267,49908,38,0,1,1,0,'Primordial Saronite'),

-- Keep deterministic phase transitions, Ice Tomb selection, Frost Bomb
-- placement and flight paths in the encounter script.  The ordinary combat
-- rotations belong in spell lists so timings and difficulty data remain
-- inspectable and adjustable in the world database.
UPDATE `creature_template` SET `SpellList`=3685301
WHERE `Entry` IN (36853,38265,38266,38267);
UPDATE `creature_template` SET `SpellList`=3753301 WHERE `Entry`=37533;
UPDATE `creature_template` SET `SpellList`=3753401 WHERE `Entry`=37534;

DELETE FROM `creature_spell_list` WHERE `Id` IN (3685301,3753301,3753401);
DELETE FROM `creature_spell_list_entry` WHERE `Id` IN (3685301,3753301,3753401);
INSERT INTO `creature_spell_list_entry`
(`Id`,`Name`,`ChanceSupportAction`,`ChanceRangedAttack`) VALUES
(3685301,'ICC - Sindragosa - ground phase',0,0),
(3753301,'ICC - Rimefang - ground phase',0,0),
(3753401,'ICC - Spinestalker',0,0);

INSERT INTO `creature_spell_list`
(`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,`Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`) VALUES
(3685301,0,19983,0,-1,1,0,100,1,10000,15000,5000,15000,'Sindragosa - Cleave'),
(3685301,1,71077,0,-1,2,0,100,1,20000,20000,22000,27000,'Sindragosa - Tail Smash'),
(3685301,2,69649,0,-1,1,0,100,1,8000,12000,20000,25000,'Sindragosa - Frost Breath'),
(3685301,3,69762,0,-1,2,0,100,1,9000,14000,30000,35000,'Sindragosa - Unchained Magic'),
(3753301,0,71386,0,-1,1,0,100,1,12000,15000,20000,25000,'Rimefang - Frost Breath'),
(3753401,0,40505,0,-1,1,0,100,1,10000,15000,10000,15000,'Spinestalker - Cleave'),
(3753401,1,71369,0,-1,2,0,100,1,8000,12000,22000,25000,'Spinestalker - Tail Sweep'),
(3753401,2,36922,0,-1,2,0,100,1,20000,25000,25000,30000,'Spinestalker - Bellowing Roar');

COMMIT;
