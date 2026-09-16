# ManTech Wrath ICC data integration — updated 2026-09-16

## September 16 cumulative recovery

The earlier integration did not include all uncommitted cumulative test changes.
`5919_icc_cumulative_v3_recovery.sql` restores the later Svalna/captain data,
Putricide and Rotface targeting/class fixes, Crimson Hall orb bindings, and
Sindragosa Ice Tomb regeneration fix. `5920_icc_core_script_bindings.sql` explicitly
installs the ICC core creature/object and spell bindings required on upgraded worlds.
Current upstream Frostwyrm spawn groups and the previously restored loot, gold,
reputation, coldflame jets and dialogue updates remain in place.

Apply **5900 through 5920 in numerical order** to a current-schema world database
with the realm stopped and the matching restored core ready. Do not import a full
world or instance replacement over production. Existing databases already through
5918 can apply the two new files; the entire sequence also passed a repeat run.

`python utilities/build_icc_world_update.py --output ICC-WORLD-RESTORE.sql` creates
a single ordered file. It does not connect to a database or overwrite existing output.
Take a world-database backup before applying. These files do not touch accounts,
characters or saved character instance progress.

The sequence was executed twice successfully on the repository's full world data
with current core schema updates, using a private MySQL 8.0.46 instance. This is
SQL validation, not confirmation of an in-game raid clear. Original cumulative
working files and cleanup bundles remain preserved locally.

The saved ICC data integration is restored to `mantech-wotlk`, paired with
`T-imothy/mangos-wotlk:mantech-wotlk`. No database has been modified by committing
these SQL files.

## September 15 integration history

### Provenance

- Starting DB baseline: `5cb3151397cd18e03ef98f4a9d27435004f5df79`.
- Saved DB `icc-master`: `13d9e8605d774fd3c64f320c4bf17f7f40b67fa5`.
- Later data commits incorporated: `7db028ea`, `a8f305cc`, `430c4157`,
  `4f3b580a`, `0c5bbc09`, `f956349e`, `464bd469`, `00c24310`,
  `778add2f`, `79601ef2`, `8114a251`, and `30d16f95`.

These include Gunship health/cannon heat and cache gold, Lich King/Sindragosa
gold, Valithria cache/controller data, Putricide completion, pipe Fleshreaper
StringIds, Lower Spire event spawns, Festergut binding ownership, and Ashen
Verdict reputation. Already accepted upstream data remains in the baseline.

### Original update order

The 19 restored ICC update files are numbered `5900` through `5918` in their
original encounter order. This moves them after the existing
`5896_restore_cmangos_encounters.sql` and avoids old ICC/upstream filename-number
collisions. `Updates/Instances/631_icecrown_citadel.sql` contains the matching
instance changes; retain it as part of the paired update.

The core's updated ScriptDevAI bindings are also required. Do not interpret
this source merge as permission to apply these files to production while an
older executable is running. Use the normal reviewed release/database procedure.

### Original verification and limits

The saved combined history is a parent of this integration, and the later
encounter data changes are retained as individual commits. ScriptName references
were checked against the paired native C++ registrations. SQL transaction
delimiters, merge markers and whitespace were checked. The SQL was not executed
against a database during that September 15 integration, and gameplay was not tested.
The September 16 SQL validation is recorded above.
