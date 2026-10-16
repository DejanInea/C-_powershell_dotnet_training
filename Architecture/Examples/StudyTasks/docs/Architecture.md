# StudyTasks architecture overview

## Problem and scope

One learner needs offline add, list, and complete actions on a trusted local computer. Tasks survive process restarts. First release excludes shared users and remote access.

## Responsibilities

Cli adapts terminal arguments and maps results to messages/exit codes. Application coordinates use cases and owns ITaskStore. Domain validates task identity/title and defines completion. Infrastructure stores a JSON representation or provides an in-memory alternative.

[Source dependency map](../../../Diagrams/dependencies.svg) and [runtime request map](../../../Diagrams/request-flow.svg) show different views of these parts.

## Dependency rules

Domain references no other example project. Application references Domain. Infrastructure references Application and Domain. Cli chooses Infrastructure in Program.cs and calls Application. Checks can reference the inner projects and the real adapter.

We use manual constructor injection: the composition root supplies ITaskStore to TaskService. No container package or service locator is involved.

## Data and errors

A task has a stable GUID, normalized nonblank title of at most 80 UTF-16 code units, and completion state. JSON rows are reconstructed through domain validation. Malformed/invalid persisted data fails visibly. A missing file represents a new empty store.

CLI returns 0 for success, 1 for storage/data failures, 2 for command/input/configuration errors, and 3 for a missing task.

## Operations and limits

Default data lives below the executable output directory; use ARCHITECTURE_TASKS_PATH for stable storage independent of binaries. Only one writer/process at a time is supported.

Whole-file loading and direct overwriting keep the example small but provide no crash-safe transaction or concurrent-update protection. No confidential data or public hosting is assumed. Checks cover business failures and serialization; they do not establish crash recovery or concurrent correctness.

## Decision and review trigger

[ADR-0001](ADR-0001-local-json.md) records why we chose this scope. Shared access, important recovery requirements, or measured data-size problems trigger a new storage and operations review.
