-- Requires the matching native distance-damage script.
INSERT IGNORE INTO spell_scripts (Id, ScriptName) VALUES
(50811, 'spell_krystallus_shatter_damage'),
(61547, 'spell_krystallus_shatter_damage');

-- EventAI pauses masked timers and executes phase changes only after the
-- successful primary combat action. Keep the 35s cadence (25s + 10s).
UPDATE creature_ai_scripts SET action2_type=22, action2_param1=0,
 comment='Krystallus - Aggro text and reset Ground Slam phase'
WHERE id=2797701 AND creature_id=27977 AND event_type=4;
UPDATE creature_ai_scripts SET event_inverse_phase_mask=2,
 event_param3=25000, event_param4=25000, action2_type=22, action2_param1=1,
 comment='Krystallus - Ground Slam then enter Shatter phase'
WHERE id=2797707 AND creature_id=27977 AND action1_type=11 AND action1_param1=50827;
UPDATE creature_ai_scripts SET event_inverse_phase_mask=1,
 event_param1=10000, event_param2=10000, event_param3=10000, event_param4=10000,
 action2_type=22, action2_param1=0,
 comment='Krystallus - Shatter ten seconds after accepted Ground Slam then resume'
WHERE creature_id=27977 AND action1_type=11 AND
 ((id=2797708 AND action1_param1=50810) OR (id=2797709 AND action1_param1=61546));
