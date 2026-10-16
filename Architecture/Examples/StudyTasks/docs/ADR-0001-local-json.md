# ADR-0001: Local CLI and JSON for the first learning release

Date: 2026-10-16
Status: Accepted for the teaching example

## Context

We need a runnable architecture that a learner can inspect with the installed .NET SDK. There is one local user and one command at a time. The repository uses no external package source.

## Options

1. In-memory collection: simplest, but does not survive separate commands.
2. JSON file with a storage adapter: persists with built-in libraries, but has limited write guarantees.
3. SQLite: introduces a database, transactions, and additional library/configuration work.
4. Remote API with a database: enables shared access but adds network/deployment concerns.

## Decision

Use a local CLI with JSON storage, explicit application/domain boundaries, and manual constructor injection. Use in-memory storage for fast application checks and contrast.

## Consequences

The complete example runs without installing a database, service, or package. The source boundary is visible, but five projects add navigation overhead for such a small problem.

Direct JSON overwrite is not crash-safe. Separate load/save operations cannot prevent lost updates. The store's whole-list contract limits scaling and atomic use cases.

## Validation

Run behavior and file-persistence checks. Exercise add, list, completion, malformed input, missing ID, and restart from the CLI. Record the limits honestly.

## Revisit when

More than one process must write, recovery guarantees become important, or measured collection sizes make full reads/writes unsuitable. A different store may require a revised application contract as well as a new adapter.
