# 11-Evolution exercise solution

Rename is a manageable change. Domain owns the replacement-title rule and returns a new task preserving ID and completion state. Application locates the task and saves the changed collection. CLI parses the command and displays its result. JSON field names can remain unchanged.

Tests cover trimming, blank input, 80/81 boundaries, missing ID, preserved completion state, and restart persistence. Existing behavior must continue to pass.

A SQLite proposal can preserve the domain model but should reconsider whether each use case needs an atomic storage operation. Loading and saving the whole collection inside independent calls is not a concurrency strategy.

Keep the current design until a requirement or observed problem makes the added cost worthwhile.
