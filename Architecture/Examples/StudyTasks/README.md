# StudyTasks: a small architecture you can trace

This is a complete local CLI example for the architecture track. It adds, lists, and completes study tasks with JSON persistence. It deliberately keeps one process at a time and small data; it is not a shared production task service.

## Projects and responsibilities

| Project | Job | Direct example-project references |
| --- | --- | --- |
| Domain | Valid task state and completion rule | None |
| Application | Use cases and ITaskStore contract | Domain |
| Infrastructure | In-memory and JSON storage adapters | Application, Domain |
| Cli | Argument parsing, output, exit codes, composition | Application, Infrastructure |
| Checks | Executable behavior and persistence checks | Application, Domain, Infrastructure |

The CLI sees Domain types through the Application reference as well. These are five source projects compiled into one console application plus a separate checks executable. They are not five services.

## Build and run

From the repository root:

If scripts are blocked, first run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` in this terminal. See the root course setup for details.

```powershell
. .\Initialize-Training.ps1
dotnet build .\Architecture\Examples\StudyTasks\StudyTasks.slnx -m:1 -nr:false
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- add "Read C#"
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- list
```

Add prints an actual generated GUID. Copy it into the command below in place of TASK-ID:

```powershell
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- complete TASK-ID
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- list
```

Completion prints Completed and listing changes [todo] to [done]. Completing an already completed task leaves one completed task.

## Where data lives

Default: Cli/bin/Debug/net10.0/output/tasks.json (or Release for a Release build). The CLI prints its actual absolute path to stderr on each invocation. Build output is ignored by Git.

To preserve data independently of build output, use an explicit path in the current terminal:

```powershell
$env:ARCHITECTURE_TASKS_PATH = Join-Path $PWD '.artifacts\architecture-practice\tasks.json'
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- add "Practice boundaries"
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- list
Remove-Item Env:\ARCHITECTURE_TASKS_PATH
```

Removing this environment variable changes the next command's configuration; it does not delete the data. Run only one command against a store at a time.

## Error behavior

| Exit code | Meaning | Example |
| --- | --- | --- |
| 0 | Success | Valid add/list/complete |
| 1 | Storage failure or invalid persisted data | Malformed JSON or inaccessible path |
| 2 | Invalid command, argument, or configuration | Blank title or invalid GUID syntax |
| 3 | Task not found | Well-formed GUID absent from the store |

```powershell
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- add "   "
$LASTEXITCODE
```

Expected: error on stderr, no new task, exit 2. A GUID consisting entirely of zeroes is syntactically valid but cannot identify a valid stored task, so completing it returns not found.

## Automated checks

```powershell
dotnet run --project .\Architecture\Examples\StudyTasks\Checks
```

This is an executable harness, not a test-runner project. It reports 16 named checks. Each run creates unique files under the working directory's .artifacts folder; run from the repository root to keep them together. Test data is retained for inspection and never uses the learner's configured CLI store.

## Read in this order

1. [Domain/StudyTask.cs](Domain/StudyTask.cs): one immutable model with protected rules.
2. [Application/ITaskStore.cs](Application/ITaskStore.cs): persistence boundary.
3. [Application/TaskService.cs](Application/TaskService.cs): use-case steps.
4. [Infrastructure/JsonTaskStore.cs](Infrastructure/JsonTaskStore.cs): technology implementation.
5. [Cli/Program.cs](Cli/Program.cs): composition root and presentation.
6. [Checks/Program.cs](Checks/Program.cs): evidence and limitations.

## Important limits

The adapter reads and writes the entire collection. Direct overwrite is not crash-safe, and separate Load/Save calls are not transactional. Concurrent writers can lose updates. There is no schema-version migration, authorization, encryption, remote service, or production backup mechanism. These are specific future requirements to design for in lessons 07-11.

The title limit counts UTF-16 code units through string.Length. It does not count grapheme clusters. Domain failures discovered while loading persisted tasks are reclassified as invalid data.

The five-project structure is intentionally explicit for learning. For a small new app, start with the smallest structure whose responsibilities and dependencies you can explain.
