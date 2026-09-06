-- ManTech Playerbot behavior testing: restore the native Magtheridon cube chain.
-- 30410 effect 0 goes to the nearby Hellfire Raid Trigger at each cube.
-- Its native aura script makes that distinct trigger cast 30166 on Magtheridon;
-- five independent beams then trigger the core's Shadow Cage/interruption.
-- Targeting Magtheridon directly collapses those beams onto one caster.
-- Effect 1 still targets the player: native damage/channel/exhaustion unchanged.
-- Both expansions already have the five matching trigger spawns. TBC's target
-- was already correct; this correction is specific to the reviewed Wrath data.
DELETE FROM `spell_script_target`
WHERE `entry`=30410 AND `type`=1 AND `targetEntry`=17257;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`,`inverseEffectMask`)
VALUES (30410,1,17376,0)
ON DUPLICATE KEY UPDATE `inverseEffectMask`=0;
