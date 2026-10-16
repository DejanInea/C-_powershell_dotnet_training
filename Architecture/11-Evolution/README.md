# 11-Evolution: Change the design when evidence asks for it

Level: Intermediate to advanced | Time: 60-90 minutes | Prerequisite: lessons 01-10

## Goal

Improve structure while preserving behavior and documenting new tradeoffs.

## Understand it

Refactoring changes structure without changing the intended public behavior. A new feature changes behavior. A storage migration changes data representation and needs compatibility planning. Keep these different kinds of work reviewable.

Consider these triggers:

| Evidence | Possible response |
| --- | --- |
| Program.cs owns several unrelated rules | Extract cohesive responsibilities |
| Two front ends need the same use case | Reuse Application; add an adapter |
| Concurrent writes cause lost updates | Revisit the store contract and transaction model |
| One large module mixes Tasks and Reports | Define module ownership and public boundaries |
| One operation is demonstrably slow | Profile and optimize the measured bottleneck |
| Separate teams require independent deployment | Evaluate service boundaries and operating costs |

A database replacement may require more than a JsonTaskStore substitution: our whole-list contract does not express atomic updates. Preserve useful policy boundaries without pretending every future technology fits the same interface.

## Exercise

Choose ONE change: optional due date, rename a task, SQLite persistence, or a web adapter. Write its acceptance criteria, changed responsibilities, test cases, diagram updates, and an ADR.

For a beginner implementation, choose rename. Follow the capstone's contract; do not add a database or API at the same time.

For a SQLite proposal, explain schema, transactions, migrations, package requirements, and rollback. Implement it later in a deliberate package-enabled practice workspace.

## Done when

Your plan names a real trigger and a validation strategy. You can explain which abstractions survive and which might need redesign.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
