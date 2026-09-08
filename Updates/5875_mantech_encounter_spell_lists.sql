-- Restore native abilities missing from the reviewed Wrath database.
-- Same-era source migrations: 5621 (dccc0c8d), 5605 (2cc5f074),
-- 4627 (2609ebfc, Gothik 10), 5017 (d3786960, normal Hellmaw).
-- Priest/Technician rows were deleted by the subsequent Darkcaster/Collaborator
-- blocks in their original migrations. Preserve existing same-key custom rows.
-- Use Wrath's original normal-boss rows, not TBC targeting or spell timings.
UPDATE creature_template SET SpellList=1861501
WHERE Entry=18615 AND SpellList=1861401;

INSERT INTO creature_spell_list
(Id,Position,SpellId,Flags,CombatCondition,TargetId,ScriptId,Availability,Probability,InitialMin,InitialMax,RepeatMin,RepeatMax,Comments)
VALUES
(1989101,2,39376,0,-1,100,0,100,0,10000,24000,21000,33000,'Coilfang Technician - Rain of Fire - random'),
(2025701,1,22883,0,-1,206,0,100,0,2000,12000,6000,18000,'Ethereal Priest - Heal - Missing 25% including self'),
(2025701,2,35944,0,-1,5,0,100,0,6000,22000,6000,22000,'Ethereal Priest - Power Word: Shield - friendly missing buff'),
(2025701,3,37669,0,-1,2,0,100,0,4000,17000,11000,25000,'Ethereal Priest - Holy Nova - self'),
(1606001,0,28679,0,-1,0,0,100,0,2500,2500,15000,15000,'Gothik 10 - Harvest Soul'),
(1606001,1,29317,0,-1,1,0,100,0,2000,2000,0,0,'Gothik 10 - Shadow Bolt'),
(1873101,0,33551,0,-1,100,0,100,1,20000,23000,23000,35000,'Ambassador Hellmaw - Corrosive Acid'),
(1873101,1,33547,0,-1,100,0,100,1,20000,26000,20000,38000,'Ambassador Hellmaw - Fear')
ON DUPLICATE KEY UPDATE Id=VALUES(Id);
