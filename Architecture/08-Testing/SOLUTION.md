# 08-Testing exercise solution

The length checks catch missing boundary validation. The "invalid title never saves" check verifies a business guarantee using a counting fake, not a private-method name. Save-failure propagation verifies the application does not claim success on an IO error.

JSON round-trip and restart checks detect a missing save. An in-memory store cannot expose filesystem permissions, JSON parsing, or serialized-field mistakes.

Inspect project references separately: Domain must not reference Application, Infrastructure, or Cli. Application must not reference Infrastructure or Cli. The supplied checks build within those boundaries, while deliberate new references still need review.

A crash halfway through a write is not covered. Neither is simultaneous access from two processes. Those are known design limits, not reasons to invent a passing concurrency test.
