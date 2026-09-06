param(
    [Parameter(Mandatory=$true)][string]$MysqlPath,
    [Parameter(Mandatory=$true)][string]$Database,
    [Parameter(Mandatory=$true)][string]$UserName
)
# MYSQL_PWD supplies the password; never put it on the command line.
# Local test connection only. All test writes are in a session-temporary table.
$ErrorActionPreference = 'Stop'
$migration = Get-Content -LiteralPath "$PSScriptRoot\..\Updates\5874_mantech_magtheridon_cube_target.sql" -Raw
$fixture = @'
CREATE TEMPORARY TABLE mantech_cube_target_fixture LIKE spell_script_target;
INSERT INTO mantech_cube_target_fixture (entry,type,targetEntry,inverseEffectMask) VALUES
(30410,1,17257,0),(30166,1,17257,0),(99999,1,12345,2);
'@
$check = @'
SELECT 'CHECK',
SUM(entry=30410 AND type=1 AND targetEntry=17376 AND inverseEffectMask=0),
SUM(entry=30410 AND type=1 AND targetEntry=17257),
SUM(entry=30166 AND type=1 AND targetEntry=17257),
SUM(entry=99999 AND type=1 AND targetEntry=12345 AND inverseEffectMask=2),
COUNT(*) FROM mantech_cube_target_fixture;
'@
$testMigration = $migration.Replace('`spell_script_target`', '`mantech_cube_target_fixture`')
$output = ($fixture + "`n" + $testMigration + "`n" + $testMigration + "`n" + $check) |
    & $MysqlPath --protocol=tcp --host=127.0.0.1 --port=3306 "--user=$UserName" "--database=$Database" --batch --raw --skip-column-names
if ($LASTEXITCODE -ne 0 -or $output -ne "CHECK`t1`t0`t1`t1`t3") { throw 'Temporary-table migration test failed.' }
Write-Output 'PASS: actual SQL applied twice; native trigger target restored; independent beam and unrelated targets preserved.'
