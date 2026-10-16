# 12-Capstone: Design and deliver your own change

Level: Intermediate | Time: 2-4 sessions | Prerequisite: lessons 01-11

## Goal

Demonstrate the full architecture workflow with a small finished feature.

## Project brief

In a practice copy of the StudyTasks example, add:

```text
rename <id> <new-title>
```

The learner should rename a task without losing its identity or completion state.

## Required behavior

1. Existing ID: normalize the new title using the same 1-80 rule.
2. Preserve ID and IsComplete.
3. Save successfully before printing success.
4. Blank/long title: exit 2 and no write.
5. Missing ID: exit 3 and no write.
6. New process: list shows the renamed title.
7. Existing add, list, and complete commands still work.

## Work from beginning to delivery

1. Copy the planning templates into your practice project's docs folder.
2. Write requirements and a short acceptance table.
3. Draw responsibility and request-flow diagrams.
4. Compare two placements for the title rule and record the decision.
5. Identify the smallest files that should change.
6. Implement Domain behavior, then Application orchestration, then CLI presentation.
7. Add meaningful checks and run the existing suite.
8. Publish a local Release build with disposable data.
9. Ask someone to follow your runbook, or follow it yourself in a fresh terminal.
10. Review the diff, explain tradeoffs, and record evidence in Progress.md.

## Review rubric

Score each area 0 (missing), 1 (partial), or 2 (demonstrated): requirements, responsibility placement, dependency direction, useful diagrams, failure handling, checks, release/recovery, clear handover. Aim for at least 12/16 with no zero in failure handling or checks.

## Further study

After this feature, consider an HTTP adapter, a transactional database, authentication for shared access, or a bounded Tasks/Reports module split. Each is a new project with new requirements. The architecture PDF is a reference for those decisions.

Read [SOLUTION.md](SOLUTION.md) after completing your own design.
