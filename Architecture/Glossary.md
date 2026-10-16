# Architecture words in plain language

| Word | Meaning here | Example |
| --- | --- | --- |
| Architecture | Important parts, relationships, and decisions | Keep task rules independent of file storage |
| Design | How a particular part solves its job | A method validates and normalizes titles |
| Requirement | A behavior or constraint the app must satisfy | Tasks survive a restart |
| Acceptance criterion | An observable way to decide whether behavior is correct | Add, restart, list: the task is present |
| Responsibility | A coherent job and reason to change | CLI formats terminal output |
| Domain | Concepts and rules of the problem | A study task needs a nonblank title |
| Application/use case | Steps that accomplish a user goal | Add a task and ask storage to save it |
| Infrastructure | Technology details | JSON serialization and filesystem access |
| Adapter | Connects a particular technology to a boundary | JsonTaskStore implements ITaskStore |
| Interface/port | Operations a collaborator promises to provide | Load and Save tasks |
| Dependency | Another part needed to compile or operate | Application uses Domain |
| Dependency injection | Supply a collaborator from outside | new TaskService(store) |
| Composition root | Place that chooses and connects implementations | Cli/Program.cs |
| Cohesion | How closely related a part's responsibilities are | Title rules stay together |
| Coupling | How much one part knows about or relies on another | Domain knowing a database schema adds coupling |
| Layer | A logical group of responsibilities | Application orchestration |
| Tier | A deployment separation, often across processes/machines | API server and database server |
| Monolith | Application deployed as one main unit | A CLI with several library assemblies |
| Modular monolith | One deployable app with enforced module boundaries | Tasks and Reports with explicit interfaces |
| Vertical slice | Organize around a complete feature/use case | AddTask owns its request, handler, response |
| Contract | Agreed inputs, outputs, and failure behavior | Complete throws if an ID is not found |
| Invariant | Rule that must remain true for a valid object | Task ID is not empty |
| DTO | Data-transfer object with a transport/storage shape | StoredTask in the JSON adapter |
| Transaction | Changes succeed or fail as a unit | Save task and audit entry together |
| Concurrency | More than one operation overlaps | Two processes update the same file |
| Idempotent | Repeating an operation has the same intended effect | Completing an already completed task |
| Refactoring | Change structure while preserving observable behavior | Extract storage without changing CLI results |
| ADR | Short record of a significant decision and its tradeoffs | Why choose JSON for the first local release? |
| Observability | Evidence that explains runtime behavior | Errors, logs, metrics, traces |
| CI | Automated checks when changes are integrated | Build plus checks on a pull request |
| Deployment | Place and configure a release so it can run | Copy a published folder to a local release directory |
| Rollback | Return to a known compatible release | Restore previous binaries and compatible data |
| Technical debt | A shortcut with a future cost | Whole-file JSON before concurrent users exist |

A folder does not automatically enforce a boundary. A project reference can enforce some compile-time boundaries. Neither guarantees good business rules or reliable operations.
