-- Icecrown Citadel Plagueworks corridor and trap-event data.

START TRANSACTION;

UPDATE `creature_template`
SET `AIName`='', `ScriptName`='npc_icc_vengeful_fleshreaper', `SpellList`=3703801
WHERE `Entry`=37038;
UPDATE `creature_template` SET `ScriptName`='npc_putricides_trap' WHERE `Entry`=38879;

-- Leaping Face Maul is ordinary combat rotation. Keep the pipe jump in core,
-- and migrate the spell from the legacy EventAI row to the shared spell-list system.
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=37038;

DELETE FROM `creature_spell_list` WHERE `Id`=3703801;
INSERT INTO `creature_spell_list`
    (`Id`,`Position`,`SpellId`,`Flags`,`CombatCondition`,`TargetId`,`ScriptId`,
     `Availability`,`Probability`,`InitialMin`,`InitialMax`,`RepeatMin`,`RepeatMax`,`Comments`)
VALUES
    (3703801,0,71164,0,-1,1,0,100,1,5000,10000,15000,20000,
     'Vengeful Fleshreaper - Leaping Face Maul');

DELETE FROM `creature_spell_list_entry` WHERE `Id`=3703801;
INSERT INTO `creature_spell_list_entry`
    (`Id`,`Name`,`ChanceSupportAction`,`ChanceRangedAttack`)
VALUES
    (3703801,'Icecrown Citadel - Vengeful Fleshreaper',0,0);

DELETE FROM `scripted_areatrigger` WHERE `entry`=5647;
INSERT INTO `scripted_areatrigger` (`entry`,`ScriptName`)
VALUES (5647,'at_putricides_trap');

DELETE FROM `scripted_event_id` WHERE `id` IN (23426,23438);
INSERT INTO `scripted_event_id` (`id`,`ScriptName`) VALUES
(23426,'event_gameobject_citadel_valve'),
(23438,'event_gameobject_citadel_valve');

COMMIT;
