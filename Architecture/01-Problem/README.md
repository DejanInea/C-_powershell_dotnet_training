# 01-Problem: Start with the problem

Level: Beginner | Time: 45-60 minutes | Prerequisite: none

## Goal

Describe what you are building before choosing a framework or folder structure.

## Understand it

Imagine that you keep study tasks in scattered notes. Your first application helps one learner add a task, list tasks, and mark a task complete. It runs locally and remembers tasks between commands.

A feature describes behavior. A quality goal describes how well the system behaves. A constraint limits your options. "Use .NET 10" is a technology constraint; "recover tasks after restarting" is behavior that technology must support.

## Worked example

| Concern | Decision for version 1 |
| --- | --- |
| User | One learner on a trusted local computer |
| Actions | Add, list, complete |
| Title rule | Trim surrounding whitespace; require 1-80 UTF-16 code units |
| Persistence | Keep tasks between commands |
| Out of scope | Accounts, sharing, remote access, reminders |
| Operating assumption | Run one command/process at a time |

UTF-16 code units are what C# string.Length counts. This is a deliberate simple limit; it is not necessarily a count of visible characters in every language.

Acceptance example: Given an empty list, when I add "Read C#", then one incomplete task exists with a nonempty ID. After a new process starts, listing still shows it.

## Exercise

1. Copy [Requirements.md](../Templates/Requirements.md) into your own practice notes.
2. Write acceptance criteria for add, list, and complete.
3. Add blank-title, unknown-ID, and storage-failure scenarios.
4. Choose one measurable quality target and a measurement method.
5. Defer three features and explain why.

## Explain it yourself

Can someone verify your requirements without asking what you meant by "fast" or "easy"? What would change if five people shared tasks?

Read [SOLUTION.md](SOLUTION.md) after your attempt.
