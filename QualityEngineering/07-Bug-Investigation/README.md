# 07-Bug-Investigation: Turn an observation into a reproducible report

Level: Beginner to intermediate | Time: 60 minutes

## Learn the habit

Report the observed difference, its impact, and how to reproduce it. Separate facts from hypotheses and proposed fixes.

Use [Bug-Report.md](../Templates/Bug-Report.md). Record build/commit, environment, preconditions, exact steps, input, expected result and its source, actual result, evidence, frequency, and impact.

## Reduce the problem

1. Preserve the failing evidence.
2. Reproduce from a known state.
3. Remove unrelated steps while keeping the failure.
4. Change one variable at a time.
5. Compare working and failing conditions.
6. Form hypotheses and choose experiments that distinguish them.

Use the [investigation diagram](../Diagrams/investigation.svg). "Probably a cache bug" is a hypothesis, not a cause.

## Exercise

Use the fictional worked defect in the workbook: duplicate task after a timeout and manual retry in a proposed networked client. Identify missing evidence and unresolved requirements. Write a minimal reproduction plan and three possible explanations.

Do not claim you observed this against today's API; the example is an investigation exercise.

## Done when

A developer can attempt reproduction without a meeting. Your report avoids blame and does not force a particular implementation before understanding the failure.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
