-- ManTech 2026-10-29: do not start Sunfury ambient scenes without their crystal.
START TRANSACTION;
UPDATE dbscripts_on_relay SET priority=4
WHERE id=18024 AND delay=0 AND command=15 AND priority=3
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18024 AND delay=0 AND command=31 AND datalong=19421 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=3
WHERE id=18024 AND delay=0 AND command=15 AND priority=2
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18024 AND delay=0 AND command=31 AND datalong=19421 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=3
WHERE id=18024 AND delay=0 AND command=28 AND priority=2
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18024 AND delay=0 AND command=31 AND datalong=19421 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=2
WHERE id=18024 AND delay=0 AND command=36 AND priority=1
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18024 AND delay=0 AND command=31 AND datalong=19421 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=1
WHERE id=18024 AND delay=0 AND command=35 AND priority=0
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18024 AND delay=0 AND command=31 AND datalong=19421 AND datalong2=25) AS guard);
INSERT INTO dbscripts_on_relay(id,delay,priority,command,datalong,datalong2,comments)
SELECT 18024,0,0,31,19421,25,'ManTech: require crystal before starting Sunfury scene'
WHERE EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=18024 AND command=36 AND buddy_entry=19421 AND search_radius=25)
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=18024 AND delay=0 AND command=31 AND datalong=19421 AND datalong2=25);
UPDATE dbscripts_on_relay SET priority=4
WHERE id=18025 AND delay=0 AND command=15 AND priority=3
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18025 AND delay=0 AND command=31 AND datalong=19437 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=3
WHERE id=18025 AND delay=0 AND command=15 AND priority=2
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18025 AND delay=0 AND command=31 AND datalong=19437 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=3
WHERE id=18025 AND delay=0 AND command=28 AND priority=2
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18025 AND delay=0 AND command=31 AND datalong=19437 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=2
WHERE id=18025 AND delay=0 AND command=36 AND priority=1
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18025 AND delay=0 AND command=31 AND datalong=19437 AND datalong2=25) AS guard);
UPDATE dbscripts_on_relay SET priority=1
WHERE id=18025 AND delay=0 AND command=35 AND priority=0
AND NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT id FROM dbscripts_on_relay WHERE id=18025 AND delay=0 AND command=31 AND datalong=19437 AND datalong2=25) AS guard);
INSERT INTO dbscripts_on_relay(id,delay,priority,command,datalong,datalong2,comments)
SELECT 18025,0,0,31,19437,25,'ManTech: require crystal before starting Sunfury scene'
WHERE EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=18025 AND command=36 AND buddy_entry=19437 AND search_radius=25)
AND NOT EXISTS (SELECT 1 FROM dbscripts_on_relay WHERE id=18025 AND delay=0 AND command=31 AND datalong=19437 AND datalong2=25);
COMMIT;

-- GO-use scripts receive the player as source and the clicked object as target.
-- SOURCE_TARGETS_SELF (4) incorrectly replaces that target with the player.
UPDATE dbscripts_on_go_template_use SET data_flags=0
WHERE id=188673 AND delay=10 AND priority=0 AND command=40
AND buddy_entry=0 AND data_flags=4;
