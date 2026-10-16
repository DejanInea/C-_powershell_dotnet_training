# 10-Release exercise solution

The local runbook builds StudyTasks.slnx, runs Checks, and publishes Cli. Its release data path is explicitly configured outside the published binary folder through ARCHITECTURE_TASKS_PATH.

The generated framework-dependent folder needs the .NET runtime. A self-contained publication is another choice with a target platform and additional distribution/update considerations; it is not automatically required.

Rollback: stop commands, preserve current data, identify the last known-good release, check that release can read the current schema, then run it with the chosen compatible data. Verify using a disposable copy before replacing anything important.

A backup is only useful when restoration has been demonstrated. Copying while a write is in progress is outside the example's supported operating procedure.
