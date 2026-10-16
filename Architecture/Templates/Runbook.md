# Release and recovery runbook

## Build and verify

SDK/runtime version, working directory, exact commands, expected exit codes.

## Configuration

Setting, purpose, example, default, and who controls it.
Separate code, configuration, credentials, and user data.

## Publish and run

Release output location, framework-dependent or self-contained, runtime requirements.
Commands for a clean smoke test with separate test data.

## Diagnose

Where errors/logs go, how to distinguish invalid input from storage failure.

## Back up and restore

Data location, when to pause writes, backup location, restore verification.
Demonstrate recovery using a test copy before relying on it.

## Roll back

Previous release location, data compatibility, and stop/start sequence.
Do not assume old binaries can read a new schema.

## Known limits

Supported users, processes, data size, platforms, and operational assumptions.
