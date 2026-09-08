-- Restore native encounter data to CMaNGOS authority.
-- Core: ed6653a465351e325b794ff14439c15b6230d406
-- Database: b0cff7894ce7dbaaa3807eb7bd7f90f672f5b184
-- Archived experiments: archive/native-encounter-audit-20260908.
-- This migration intentionally removes the archived custom mechanics.

DELETE FROM spell_scripts WHERE Id IN (24223,24228,26140,26150,26216,26586,26768,33812,47958,50811,53242,56648,57500,57501,57502,57503,57504,61547,62056,62678,62873,63133,63343,63701,63985,64174,64224,64225,65279,65594,66862,67681,69172,69675,69712,69762,69766,69845,70117,70126,70127,70157,71053,71054,71055,72528,72529,72530);
INSERT INTO spell_scripts (Id,ScriptName) VALUES
(24228,'spell_arlokk_vanish');

-- Official final Eye Tentacle spell-list row (Classic update 4713; other eras full dump).
DELETE FROM creature_spell_list WHERE Id=1572600 AND Position=0;
INSERT INTO `creature_spell_list` (`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,`Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`) VALUES
(1572600,0,26141,0,-1,1,0,100,0,2000,3000,5000,6000,'Claw Tentacle - Hamstring');

-- These two lists are absent from the official Wrath dump and current updates.
DELETE FROM creature_spell_list WHERE Id IN (1606001,1873101);

-- Restore the single Permafrost attribute changed by the audit.
UPDATE spell_template SET AttributesEx5=AttributesEx5 & ~33554432 WHERE Id=70336;
UPDATE creature_template SET AIName='',ScriptName='' WHERE Entry=36980;
DELETE FROM spell_proc_event WHERE entry=69172;
DELETE FROM vehicle_seat_addon WHERE SeatEntry IN (3690,3691,3692);
DELETE FROM spell_script_target WHERE entry IN (30410,64224,64225);
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`,`inverseEffectMask`) VALUES
(30410,1,17257,0);
DELETE FROM creature_ai_scripts WHERE id IN (2797701,2797707,2797708,2797709);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param6`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(2797701,27977,4,0,100,6,0,0,0,0,0,0,1,29556,0,0,0,0,0,0,0,0,0,0,'Krystallus - Yell on Aggro'),
(2797707,27977,0,0,100,1031,35000,35000,35000,35000,0,0,11,50827,0,0,0,0,0,0,0,0,0,0,'Krystallus - Cast Ground Slam'),
(2797708,27977,0,0,100,1027,45000,55000,35000,40000,0,0,11,50810,0,0,0,0,0,0,0,0,0,0,'Krystallus (Normal) - Cast Shatter Right After Ground Slam'),
(2797709,27977,0,0,100,1029,45000,55000,35000,40000,0,0,11,61546,0,0,0,0,0,0,0,0,0,0,'Krystallus (Heroic) - Cast Shatter Right After Ground Slam');
