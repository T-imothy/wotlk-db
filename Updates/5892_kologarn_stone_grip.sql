-- Requires native grip lifecycle handlers and corrected vehicle exit orientation.
-- Exit coordinates follow TrinityCore's Kologarn release position; use native
-- seat exit configuration instead of injecting teleports into encounter code.
INSERT IGNORE INTO spell_scripts (Id,ScriptName) VALUES
(65594,'spell_cancel_kologarn_stone_grip'),
(64224,'spell_kologarn_stone_grip_absorb'),
(64225,'spell_kologarn_stone_grip_absorb'),
(62056,'spell_kologarn_stone_grip'),
(63985,'spell_kologarn_stone_grip');
INSERT IGNORE INTO spell_script_target (entry,type,targetEntry,inverseEffectMask) VALUES
(64224,1,32934,0),(64225,1,32934,0);
INSERT INTO vehicle_seat_addon (SeatEntry,SeatOrientation,ExitParamX,ExitParamY,ExitParamZ,ExitParamO,ExitParamValue) VALUES
(3690,0,1750,-7.5,457.9322,3.141593,2),
(3691,0,1750,-6.0,457.9322,3.141593,2),
(3692,0,1750,-9.0,457.9322,3.141593,2)
ON DUPLICATE KEY UPDATE ExitParamX=VALUES(ExitParamX),ExitParamY=VALUES(ExitParamY),ExitParamZ=VALUES(ExitParamZ),ExitParamO=VALUES(ExitParamO),ExitParamValue=VALUES(ExitParamValue);
