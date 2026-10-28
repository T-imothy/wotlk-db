START TRANSACTION;

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_death SET priority=1 WHERE id=25422 AND delay=1000 AND priority=0 AND buddy_entry=26073 AND search_radius=50 AND command<>31;
INSERT INTO dbscripts_on_creature_death(id,delay,priority,command,datalong,datalong2,comments)
SELECT 25422,1000,0,31,26073,50,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_death WHERE id=25422 AND delay=1000 AND priority=1 AND buddy_entry=26073 AND search_radius=50 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_death WHERE id=25422 AND delay=1000 AND priority=0 AND command=31 AND datalong=26073 AND datalong2=50);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_death SET priority=1 WHERE id=25422 AND delay=2000 AND priority=0 AND buddy_entry=26073 AND search_radius=50 AND command<>31;
INSERT INTO dbscripts_on_creature_death(id,delay,priority,command,datalong,datalong2,comments)
SELECT 25422,2000,0,31,26073,50,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_death WHERE id=25422 AND delay=2000 AND priority=1 AND buddy_entry=26073 AND search_radius=50 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_death WHERE id=25422 AND delay=2000 AND priority=0 AND command=31 AND datalong=26073 AND datalong2=50);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_creature_death SET priority=1 WHERE id=25422 AND delay=3000 AND priority=0 AND buddy_entry=26073 AND search_radius=50 AND command<>31;
INSERT INTO dbscripts_on_creature_death(id,delay,priority,command,datalong,datalong2,comments)
SELECT 25422,3000,0,31,26073,50,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_creature_death WHERE id=25422 AND delay=3000 AND priority=1 AND buddy_entry=26073 AND search_radius=50 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_creature_death WHERE id=25422 AND delay=3000 AND priority=0 AND command=31 AND datalong=26073 AND datalong2=50);

-- Recheck the required participant when the delayed action actually runs.
UPDATE dbscripts_on_relay SET priority=1 WHERE id=20655 AND delay=6100 AND priority=0 AND buddy_entry=28260 AND search_radius=20 AND command<>31;
INSERT INTO dbscripts_on_relay(id,delay,priority,command,datalong,datalong2,comments)
SELECT 20655,6100,0,31,28260,20,'ManTech: terminate delayed scene when required participant is unavailable'
WHERE EXISTS(SELECT 1 FROM dbscripts_on_relay WHERE id=20655 AND delay=6100 AND priority=1 AND buddy_entry=28260 AND search_radius=20 AND command<>31)
AND NOT EXISTS(SELECT 1 FROM dbscripts_on_relay WHERE id=20655 AND delay=6100 AND priority=0 AND command=31 AND datalong=28260 AND datalong2=20);
COMMIT;
