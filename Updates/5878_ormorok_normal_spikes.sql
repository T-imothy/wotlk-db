-- The normal-mode spell list casts 47958, whose four-summon ScriptEffect
-- is already implemented by spell_crystal_spikes alongside 57082/57083.
-- Requires the matching core fix that resets the spike counter for 47958.
INSERT IGNORE INTO spell_scripts (Id, ScriptName) VALUES
(47958, 'spell_crystal_spikes');
