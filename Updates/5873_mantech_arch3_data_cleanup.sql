-- ManTech Arch3: targeted WotLK data corrections proven by dev diagnostics.

-- Remove direct vendor rows already supplied by the assigned vendor template.
DELETE `nv`
FROM `npc_vendor` AS `nv`
JOIN `creature_template` AS `ct` ON `ct`.`Entry` = `nv`.`entry`
JOIN `npc_vendor_template` AS `nvt`
  ON `nvt`.`entry` = `ct`.`VendorTemplateId`
 AND `nvt`.`item` = `nv`.`item`
 AND `nvt`.`ExtendedCost` = `nv`.`ExtendedCost`
WHERE `ct`.`Entry` IN (26089,26090,26091,26092,27489,27478,23710,24495,10856,2842,19045,23896,24510,24468);

UPDATE `creature_template` AS `ct`
LEFT JOIN `npc_vendor` AS `nv` ON `nv`.`entry` = `ct`.`Entry`
LEFT JOIN `npc_vendor_template` AS `nvt` ON `nvt`.`entry` = `ct`.`VendorTemplateId`
SET `ct`.`NpcFlags` = `ct`.`NpcFlags` & ~128
WHERE `ct`.`Entry` IN (5052,33934,33939)
  AND `nv`.`entry` IS NULL
  AND `nvt`.`entry` IS NULL;

-- Correct a model slot regression using the valid 2.4.3 definition.
UPDATE `creature_template`
SET `DisplayId1` = 16973, `DisplayId2` = 0
WHERE `Entry` = 17304 AND `DisplayId1` = 0 AND `DisplayId2` = 16973;

-- Spell 38046 targets the Elekk Demolisher in the corresponding TBC event.
DELETE FROM `spell_script_target` WHERE `entry` = 38046 AND `type` = 1;
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`,`inverseEffectMask`)
VALUES (38046,1,21802,0);

-- Canonical graveyard links already used by the earlier-expansion data.
DELETE FROM `game_graveyard_zone`
WHERE (`id`,`ghost_loc`,`link_kind`,`faction`) IN ((636,25,0,0),(107,2257,0,0));
INSERT INTO `game_graveyard_zone` (`id`,`ghost_loc`,`link_kind`,`faction`) VALUES
  (636,25,0,0),
  (107,2257,0,0);

-- The scripts are not registered in this core build; retaining the bindings
-- creates a startup error without providing behavior.
DELETE FROM `spell_scripts` WHERE `ScriptName` IN (
  'spell_greater_invisibility_mob',
  'spell_arcane_concentration',
  'spell_lightning_tendrils_visual'
);

-- Death events do not accept condition IDs in event_param1.
UPDATE `creature_ai_scripts`
SET `event_param1` = 0
WHERE `id` IN (2209501,2230701) AND `event_type` = 6 AND `event_param1` = 10089;

-- Update 5867 supplied the phase-specific spell rows but omitted their list
-- headers. Add all phase headers so the Iron Council lists load correctly.
DELETE FROM `creature_spell_list_entry` WHERE `Id` IN (
  3285700,3285701,3285702,3286700,3286701,3286702,3292700,3292701,3292702,
  3369400,3369401,3369402,3369300,3369301,3369302,3369200,3369201,3369202
);
INSERT INTO `creature_spell_list_entry` (`Id`,`Name`,`ChanceSupportAction`,`ChanceRangedAttack`) VALUES
  (3285700,'Ulduar - Stormcaller Brundir (10) phase 0',100,100),
  (3285701,'Ulduar - Stormcaller Brundir (10) phase 1',100,100),
  (3285702,'Ulduar - Stormcaller Brundir (10) phase 2',100,100),
  (3286700,'Ulduar - Steelbreaker (10) phase 0',100,100),
  (3286701,'Ulduar - Steelbreaker (10) phase 1',100,100),
  (3286702,'Ulduar - Steelbreaker (10) phase 2',100,100),
  (3292700,'Ulduar - Runemaster Molgeim (10) phase 0',100,100),
  (3292701,'Ulduar - Runemaster Molgeim (10) phase 1',100,100),
  (3292702,'Ulduar - Runemaster Molgeim (10) phase 2',100,100),
  (3369400,'Ulduar - Stormcaller Brundir (25) phase 0',100,100),
  (3369401,'Ulduar - Stormcaller Brundir (25) phase 1',100,100),
  (3369402,'Ulduar - Stormcaller Brundir (25) phase 2',100,100),
  (3369300,'Ulduar - Steelbreaker (25) phase 0',100,100),
  (3369301,'Ulduar - Steelbreaker (25) phase 1',100,100),
  (3369302,'Ulduar - Steelbreaker (25) phase 2',100,100),
  (3369200,'Ulduar - Runemaster Molgeim (25) phase 0',100,100),
  (3369201,'Ulduar - Runemaster Molgeim (25) phase 1',100,100),
  (3369202,'Ulduar - Runemaster Molgeim (25) phase 2',100,100);

CREATE TABLE IF NOT EXISTS `mantech_migration` (
  `id` varchar(64) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantech_migration` (`id`,`details`)
VALUES ('arch3-world-wotlk-v1','Targeted data cleanup and runtime-noise corrections')
ON DUPLICATE KEY UPDATE `applied_at`=CURRENT_TIMESTAMP, `details`=VALUES(`details`);
