# 03-Risks: Build and rank worst-case scenarios

Level: Beginner | Time: 60 minutes

## Learn the habit

A good risk statement connects an event to a consequence: "If a save fails but success is displayed, the learner may lose a task while believing it is safe."

Read [Worst-Case-Method.md](../Worst-Case-Method.md), then filter the workbook's WorstCases sheet. Ask which estimate is uncertain and which experiment would reduce that uncertainty fastest.

## Worked example

| Failure | Trigger | Harm | Expected protection |
| --- | --- | --- | --- |
| Missing task after restart | Wrong configured data path | User believes data was lost | Path is clear; same-path restart preserves state |
| Invalid input saved | Boundary validation error | Unusable/corrupt state | Rejection and unchanged stored tasks |
| Lost update | Independent overlapping writers | One learner's update disappears | Deployment restriction or stronger persistence design |

The third row is a known unsupported operating situation, not an automatically observed defect. Distinguish the proposed requirement from today's supported scope.

## Exercise

Write eight scenarios across input, state, persistence, dependency failure, and configuration. Give each a user impact, likelihood/impact rationale, expected protection, test approach, scope, and owner.

Choose the first three to investigate if you have only one hour. Include one high-impact scenario even if its estimated likelihood is low.

## Done when

Your priority is justified by impact and evidence needs, rather than the order in which you thought of cases.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
