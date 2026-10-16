# 05-Dependencies: Keep policy independent of details

Level: Intermediate | Time: 60-90 minutes | Prerequisite: C# interfaces; .NET libraries

## Goal

Connect dependency arrows to interfaces and .csproj references.

## Understand it

TaskService needs to load and save tasks. It depends on an ITaskStore contract in Application. JsonTaskStore implements that contract in Infrastructure. Program.cs chooses the implementation and passes it to TaskService.

This is dependency injection using a constructor. A DI framework can automate wiring later; it is not required.

Dependency inversion is the design choice that makes storage implement a boundary owned by the application. Injection is the act of supplying the collaborator. These are related ideas with different meanings.

## Read real code

Open the example's Application/ITaskStore.cs and TaskService.cs. Then open Infrastructure/JsonTaskStore.cs and Cli/Program.cs. Finally inspect every ProjectReference in the .csproj files.

```text
Application -- source reference --> Domain
Infrastructure -- source reference --> Application + Domain
Cli -- source reference --> Application + Infrastructure
```

At runtime, TaskService calls a JsonTaskStore object through ITaskStore. That call does not require Application to reference Infrastructure.

## Exercise

1. Explain why Domain has no project references.
2. Find the in-memory store in Infrastructure.
3. In your own practice copy, wire that store into Program.cs.
4. Add a task, exit, and list in a new process. Predict why it is gone.
5. Restore JSON wiring and explain what stayed unchanged.

Try a forbidden dependency on paper: TaskService directly constructs JsonTaskStore. Which project reference would it need, and why does that conflict with Infrastructure's current reference back to Application?

## Done when

You can distinguish source dependencies, runtime calls, and object construction. Explain the tradeoff of the ITaskStore whole-list contract.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
