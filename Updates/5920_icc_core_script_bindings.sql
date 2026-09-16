-- Explicit ICC core bindings for baseline upgrades; no full-world script reload.
START TRANSACTION;
UPDATE instance_template SET ScriptName='instance_icecrown_citadel' WHERE map=631;
UPDATE creature_template SET ScriptName='boss_lord_marrowgar' WHERE entry=36612;
UPDATE creature_template SET ScriptName='npc_bone_spike' WHERE entry IN (36619,38711,38712);
UPDATE creature_template SET ScriptName='boss_lady_deathwhisper' WHERE entry=36855;
UPDATE creature_template SET ScriptName='boss_deathbringer_saurfang' WHERE entry=37813;
UPDATE creature_template SET ScriptName='npc_saurfang_intro_leader' WHERE entry IN (37187,37200);
UPDATE creature_template SET ScriptName='npc_queen_lanathel_intro' WHERE entry=38004;
UPDATE creature_template SET ScriptName='npc_blood_orb_control' WHERE entry=38008;
UPDATE creature_template SET ScriptName='npc_ball_of_flame' WHERE entry IN (38332,38451);
UPDATE creature_template SET ScriptName='npc_kinetic_bomb' WHERE entry=38454;
UPDATE creature_template SET ScriptName='npc_dark_nucleus' WHERE entry=38369;
UPDATE creature_template SET ScriptName='boss_taldaram_icc' WHERE entry=37973;
UPDATE creature_template SET ScriptName='boss_keleseth_icc' WHERE entry=37972;
UPDATE creature_template SET ScriptName='boss_valanar_icc' WHERE entry=37970;
UPDATE creature_template SET ScriptName='boss_blood_queen_lanathel' WHERE entry=37955;
UPDATE creature_template SET ScriptName='boss_sindragosa' WHERE entry=36853;
UPDATE creature_template SET ScriptName='npc_rimefang_icc' WHERE entry=37533;
UPDATE creature_template SET ScriptName='npc_spinestalker_icc' WHERE entry=37534;
UPDATE creature_template SET ScriptName='mob_frost_bomb' WHERE entry=37186;
UPDATE creature_template SET ScriptName='boss_festergut' WHERE entry=36626;
UPDATE creature_template SET ScriptName='npc_puddle_stalker' WHERE entry=37013;
UPDATE creature_template SET ScriptName='npc_orange_gas_stalker' WHERE entry=36659;
UPDATE creature_template SET ScriptName='boss_rotface' WHERE entry=36627;
UPDATE creature_template SET ScriptName='mob_little_ooze' WHERE entry=36897;
UPDATE creature_template SET ScriptName='mob_big_ooze' WHERE entry=36899;
UPDATE creature_template SET ScriptName='boss_valithria_dreamwalker' WHERE entry=36789;
UPDATE creature_template SET ScriptName='npc_blazing_skeleton_icc' WHERE entry=36791;
UPDATE creature_template SET ScriptName='npc_suppresser_icc' WHERE entry=37863;
UPDATE creature_template SET ScriptName='npc_risen_archmage_icc' WHERE entry=37868;
UPDATE creature_template SET ScriptName='npc_gluttonous_abomination_icc' WHERE entry=37886;
UPDATE creature_template SET ScriptName='npc_valithria_rot_worm' WHERE entry=37907;
UPDATE creature_template SET ScriptName='npc_valithria_column_of_frost' WHERE entry=37918;
UPDATE creature_template SET ScriptName='npc_blistering_zombie_icc' WHERE entry=37934;
UPDATE creature_template SET ScriptName='npc_valithria_portal' WHERE entry IN (37945,38430);
UPDATE creature_template SET ScriptName='npc_valithria_portal_preeffect' WHERE entry IN (38186,38429);
UPDATE creature_template SET ScriptName='npc_valithria_cloud' WHERE entry IN (37985,38421);
UPDATE creature_template SET ScriptName='npc_valithria_mana_void' WHERE entry=38068;
UPDATE creature_template SET ScriptName='boss_professor_putricide' WHERE entry=36678;
UPDATE creature_template SET ScriptName='npc_putricides_trap' WHERE entry=38879;
UPDATE creature_template SET ScriptName='npc_volatile_ooze_icc' WHERE entry=37697;
UPDATE creature_template SET ScriptName='npc_gas_cloud_icc' WHERE entry=37562;
UPDATE creature_template SET ScriptName='npc_growing_ooze_puddle' WHERE entry=37690;
UPDATE creature_template SET ScriptName='npc_choking_gas_bomb' WHERE entry=38159;
UPDATE creature_template SET ScriptName='npc_mutated_abomination' WHERE entry IN (37672,38285);
UPDATE creature_template SET ScriptName='boss_the_lich_king_icc' WHERE entry=36597;
UPDATE creature_template SET ScriptName='npc_saurfang_gunship' WHERE entry=36939;
UPDATE creature_template SET ScriptName='npc_muradin_gunship' WHERE entry=36948;
UPDATE creature_template SET ScriptName='npc_gunship' WHERE entry IN (37215,37540);
UPDATE creature_template SET ScriptName='npc_gunship_cannon' WHERE entry IN (36838,36839);
UPDATE creature_template SET ScriptName='npc_gunship_soldier' WHERE entry IN (36950,36957,36960,36961,36968,36969,36978,36982,37116,37117);
UPDATE creature_template SET ScriptName='npc_zafod_boombox' WHERE entry=37184;
UPDATE gameobject_template SET ScriptName='go_icc_teleporter' WHERE entry IN (202235,202242,202243,202244,202245,202246);
UPDATE gameobject_template SET ScriptName='go_lady_deathwhisper_elevator' WHERE entry IN(202220);
DELETE FROM spell_scripts WHERE Id IN (68645,68721,69057,69140,69147,69165,69195,69290,69402,69558,69674,69678,69679,69705,69782,69795,70175,70227,70304,70347,71424,71425,70308,70311,70345,70346,70351,70360,70402,70405,70447,70539,70572,70609,70672,70739,70740,70826,70842,70895,70896,70897,70900,70901,70903,70911,70920,71219,71222,71224,71236,71255,71278,71279,71307,71503,71620,71693,71770,71908,72088,72089,72202,72219,72254,72295,72451,72455,72456,72457,72459,72460,72463,72495,72496,72497,72498,72499,72500,72508,72509,72510,72511,72512,72513,72527,72551,72552,72553,72618,72619,72620,72621,72622,72671,72672,72705,72832,72833,72836,72837,72838,72840,72854,72855,72856,72868,72869,72875,72876,73031,73032,73033,73034,73022,73023,73142,73159);
INSERT INTO spell_scripts (Id,ScriptName) VALUES
(68645,'spell_rocket_pack'),
(68721,'spell_rocket_pack_periodic'),
(69057,'spell_bone_spike_graveyard'),
(69140,'spell_coldflame_targeting'),
(69147,'spell_coldflame'),
(69165,'spell_inhale_blight'),
(69195,'spell_festergut_pungent_blight'),
(69290,'spell_festergut_blighted_spores'),
(69402,'spell_incinerating_blast'),
(69558,'spell_unstable_ooze_rotface'),
(69674,'spell_rotface_mutated_infection'),
(69678,'spell_gunship_rocket_artillery'),
(69679,'spell_gunship_rocket_artillery_explosion'),
(69705,'spell_gunship_below_zero'),
(69782,'spell_ooze_flood'),
(69795,'spell_ooze_flood_trigger'),
(70175,'spell_incinerating_blast'),
(70227,'spell_icc_empowered_blood'),
(70304,'spell_icc_empowered_blood_controller'),
(70347,'spell_putricide_grow'),
(71424,'spell_putricide_slime_puddle_selector'),
(71425,'spell_putricide_slime_puddle_target'),
(70308,'spell_putricide_mutation_init'),
(70311,'spell_putricide_mutated_transformation'),
(70345,'spell_putricide_grow_stacker'),
(70346,'spell_putricide_slime_puddle'),
(70351,'spell_unstable_experiment'),
(70360,'spell_eat_ooze'),
(70402,'spell_putricide_mutated_transformation_damage'),
(70405,'spell_putricide_mutated_transformation_dismiss'),
(70447,'spell_putricide_ooze_channel'),
(70539,'spell_putricide_regurgitated_ooze'),
(70572,'spell_grip_of_agony_aura'),
(70609,'spell_gunship_rocket_artillery'),
(70672,'spell_putricide_ooze_channel'),
(70739,'spell_icc_geist_alarm'),
(70740,'spell_icc_geist_alarm'),
(70826,'spell_bone_spike_graveyard'),
(70842,'spell_mana_barrier_aura'),
(70895,'spell_dark_transformation'),
(70896,'spell_dark_empowerment'),
(70897,'spell_dark_martyrdom'),
(70900,'spell_dark_transformation_aura'),
(70901,'spell_dark_empowerment_aura'),
(70903,'spell_dark_adherent_martyrdom_aura'),
(70911,'spell_putricide_unbound_plague_damage'),
(70920,'spell_putricide_unbound_plague'),
(71219,'spell_festergut_pungent_blight'),
(71222,'spell_festergut_blighted_spores'),
(71224,'spell_rotface_mutated_infection'),
(71236,'spell_dark_fanatic_martyrdom_aura'),
(71255,'spell_putricide_choking_gas_bomb'),
(71278,'spell_putricide_choking_gas_filter'),
(71279,'spell_putricide_choking_gas_filter'),
(71307,'spell_festergut_vile_gas'),
(71503,'spell_putricide_mutated_transformation'),
(71620,'spell_putricide_clear_auras'),
(71693,'spell_putricide_cleanse_mutation'),
(71770,'spell_putricide_ooze_tank_protection'),
(71908,'spell_festergut_vile_gas'),
(72088,'spell_bone_spike_graveyard'),
(72089,'spell_bone_spike_graveyard'),
(72202,'spell_blood_link'),
(72219,'spell_festergut_gastric_bloat'),
(72254,'spell_mark_fallen_champion'),
(72295,'spell_putricide_malleable_goo'),
(72451,'spell_putricide_mutated_plague'),
(72455,'spell_putricide_ooze_channel'),
(72456,'spell_putricide_slime_puddle'),
(72457,'spell_putricide_regurgitated_ooze'),
(72459,'spell_putricide_choking_gas_filter'),
(72460,'spell_putricide_choking_gas_filter'),
(72463,'spell_putricide_mutated_plague'),
(72495,'spell_dark_fanatic_martyrdom_aura'),
(72496,'spell_dark_fanatic_martyrdom_aura'),
(72497,'spell_dark_fanatic_martyrdom_aura'),
(72498,'spell_dark_adherent_martyrdom_aura'),
(72499,'spell_dark_adherent_martyrdom_aura'),
(72500,'spell_dark_adherent_martyrdom_aura'),
(72508,'spell_putricide_mutated_transformation_dismiss'),
(72509,'spell_putricide_mutated_transformation_dismiss'),
(72510,'spell_putricide_mutated_transformation_dismiss'),
(72511,'spell_putricide_mutated_transformation_damage'),
(72512,'spell_putricide_mutated_transformation_damage'),
(72513,'spell_putricide_mutated_transformation_damage'),
(72527,'spell_eat_ooze'),
(72551,'spell_festergut_gastric_bloat'),
(72552,'spell_festergut_gastric_bloat'),
(72553,'spell_festergut_gastric_bloat'),
(72618,'spell_putricide_clear_auras'),
(72619,'spell_putricide_choking_gas_filter'),
(72620,'spell_putricide_choking_gas_filter'),
(72621,'spell_putricide_choking_gas_filter'),
(72622,'spell_putricide_choking_gas_filter'),
(72671,'spell_putricide_mutated_plague'),
(72672,'spell_putricide_mutated_plague'),
(72705,'spell_coldflame_summon'),
(72832,'spell_putricide_ooze_channel'),
(72833,'spell_putricide_ooze_channel'),
(72836,'spell_putricide_ooze_channel'),
(72837,'spell_putricide_ooze_channel'),
(72838,'spell_putricide_ooze_channel'),
(72840,'spell_volatile_experiment'),
(72854,'spell_putricide_unbound_plague_damage'),
(72855,'spell_putricide_unbound_plague_damage'),
(72856,'spell_putricide_unbound_plague_damage'),
(72868,'spell_putricide_slime_puddle'),
(72869,'spell_putricide_slime_puddle'),
(72875,'spell_putricide_regurgitated_ooze'),
(72876,'spell_putricide_regurgitated_ooze'),
(73031,'spell_festergut_pungent_blight'),
(73032,'spell_festergut_pungent_blight'),
(73033,'spell_festergut_blighted_spores'),
(73034,'spell_festergut_blighted_spores'),
(73022,'spell_rotface_mutated_infection'),
(73023,'spell_rotface_mutated_infection'),
(73142,'spell_bone_spike_graveyard_storm'),
(73159,'spell_play_movie');
COMMIT;
