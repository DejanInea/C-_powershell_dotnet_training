# 04-Test-Design: Select tests that reveal different problems

Level: Beginner to intermediate | Time: 60 minutes

## Learn the techniques

Equivalence partitions group inputs expected to behave similarly for one rule. Boundary tests concentrate where the result changes. Decision tables combine conditions and actions. State transitions explore valid and invalid action sequences.

For this API's raw title-length rule, use lengths 0, 1, 199, 200, and 201, plus null/blank and representative Unicode. C# string.Length counts UTF-16 code units; visible characters are not always one unit.

## Decision table: creating a task

| Title nonblank? | Raw length <=200? | Storage save succeeds? | Expected |
| --- | --- | --- | --- |
| No | Any | Not reached | 400; no task created |
| Yes | No | Not reached | 400; no task created |
| Yes | Yes | Yes | 201; task exists |
| Yes | Yes | No | Failure, no misleading success; state consistency needs evidence |

Do not prescribe an unagreed exact server-error body. Review the failure contract and setup first.

## Exercise

Create a boundary table with input, expected status, and expected stored state. Add a state sequence: create -> complete -> complete again -> delete -> complete deleted ID.

Design a three-factor combination set using title partition, task state, and configuration. Remove impossible combinations and add a targeted severe-risk case.

## Done when

Each test has a reason and an oracle. A larger count of nearly identical cases is not automatically better coverage.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
