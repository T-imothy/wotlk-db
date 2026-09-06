# Native cube target correction (testing branch)

The current core's ShadowGraspCube AuraScript makes the target of effect 0 of
30410 cast 30166. That target must be the local Hellfire Raid Trigger 17376 at
the cube, not Magtheridon himself. Five independent triggers provide five
native beam holders; the core then cages/interrupts the boss when their count
reaches five. Each cube already has a corresponding trigger in both reviewed
TBC/Wrath databases. TBC's target is correct; Wrath's was still 17257.

`Updates/5874_mantech_magtheridon_cube_target.sql` corrects only the obsolete
30410 creature target and installs the canonical trigger target. 30166 still
targets Magtheridon, and 30410's player/self effect and native exhaustion are
not changed. No creature spawns, boss stats, character data or general spells
are altered.

The migration was applied to **local Wrath dev only** after a temporary-table
test with two applications and checks that unrelated targets stayed intact.
`tests/Test-MagtheridonCubeTarget.ps1` reproduces that test against a local MySQL
instance using the actual migration file. Supply MYSQL_PWD through the
environment and MysqlPath, Database and UserName parameters. The test itself
does not modify any persistent table and creates no database or backup.

TBC/Wrath core testing branches separately repair the existing cube last-user
guard. This SQL is not proof of complete bot cube assignment or successful
in-world channels; five-cube/interrupt/exhaustion and wipe tests remain required.
