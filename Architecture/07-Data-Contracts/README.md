# 07-Data-Contracts: Design data and failure behavior

Level: Intermediate | Time: 60-90 minutes | Prerequisite: C# files and JSON

## Goal

Keep domain meaning, storage shape, and boundary behavior explicit.

## Understand it

StudyTask is a domain object. StoredTask is the JSON adapter's storage shape. CLI arguments are another boundary representation. They may contain similar fields, but they change for different reasons.

The domain constructor protects a nonempty ID and a normalized title of 1-80 UTF-16 code units. Complete creates a new immutable task state with the same ID. The adapter validates data read from disk by reconstructing domain objects.

## Contract for the supplied sample

| Situation | Result |
| --- | --- |
| File does not exist | Empty store |
| Blank / long title | ArgumentException; no save |
| Unknown ID | KeyNotFoundException; no save |
| Already complete | Still complete; no duplicate task |
| Malformed JSON, null document, duplicate IDs | Visible failure |
| Storage access or write failure | Error; CLI does not print success |

The CLI maps expected categories into exit codes. See the example README. A missing file is different from an existing unreadable file. Silently replacing corrupt data with an empty list could hide data loss.

## Exercise

1. Inspect a JSON file created by the example.
2. Trace StoredTask -> StudyTask in JsonTaskStore.Load.
3. Use a disposable copy to try malformed JSON. Preserve your real data.
4. Propose a DueDate field. Define whether it is optional, date-only or an instant, and how old files are handled.
5. Draw two writers loading before either saves. Explain the lost update.

## Done when

You can explain why this example is single-writer and why write success is not the same as crash-safe persistence.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
