# 03-Responsibilities: Give each part a clear job

Level: Beginner | Time: 45-60 minutes | Prerequisite: C# methods and classes

## Goal

Decide where behavior belongs using reasons for change.

## Understand it

A first program may read arguments, validate titles, build tasks, serialize JSON, write files, and print output in Program.cs. This is understandable while tiny. As those behaviors grow, changing one concern can accidentally break another.

Use four responsibility cards:

| Part | Owns | Does not need to know |
| --- | --- | --- |
| CLI | Arguments, output, exit codes, wiring | JSON field mapping |
| Application | Add/list/complete steps and storage boundary | Filesystem API |
| Domain | Valid task state and completion behavior | Console, JSON, HTTP |
| Infrastructure | JSON and filesystem implementation | Terminal formatting |

The core benefit is being able to explain the consequences of a change. Counting classes is not a useful success metric.

## Worked change map

Change the title limit: Domain and its tests change.

Change output from text to a table: CLI changes.

Replace JSON storage: Infrastructure and composition change; the title rule stays the same.

Add a new task action: inspect the use case and domain rule first, then adapt its inputs and outputs.

## Exercise

Assign these behaviors to a responsibility: trim a title, parse a GUID argument, reject a missing task, write a file, print "No tasks.", select the data path. For each, explain what requirement might make it change.

Draw your own version with folders in one project. Then compare it to our five-project example. What can a separate project enforce that a folder cannot?

## Done when

You can follow a requirement to its owner without creating a Helpers folder for unrelated behavior.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
