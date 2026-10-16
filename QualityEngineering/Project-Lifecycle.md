# QE from the beginning to the end of a project

Use this as a practical sequence, then repeat small parts whenever a feature changes. Testing is not a single stage after development.

| Stage | Your questions | Your work | Useful visual | Exit evidence |
| --- | --- | --- | --- | --- |
| Discovery | Who uses it? What harm matters? | Review assumptions and user journeys | Context / journey sketch | Questions answered or owned |
| Requirements | What result would demonstrate correctness? | Write examples, failure behavior, testability needs | Acceptance / decision table | Agreed, observable criteria |
| Design | Where can state or information be lost? | Review boundaries, errors, recovery, observability | State / sequence diagram | Important risks have owners |
| Planning | What must we learn first? | Rank risks, choose levels, data, tools, and scope | Risk matrix and coverage map | Feasible plan and known gaps |
| Development | Can a small check expose this defect sooner? | Pair on examples; review changes; test increments | Change-to-risk map | Unit/component evidence |
| Integration | Do parts agree on contracts? | API/storage checks and failure experiments | Request/result timeline | State and error evidence |
| Exploration | What are scripted checks missing? | Timeboxed investigation guided by observations | Session notes / hypothesis tree | Findings and next questions |
| Fixing | Did the change address the real failure? | Reproduce, compare hypotheses, retest and regress | Defect workflow | Original failure corrected |
| Release | What remains unknown or unacceptable? | Summarize scope, results, gaps, risk acceptance | Release evidence table | Named decision and conditions |
| Operation | What happens in real use? | Observe incidents, verify recovery, improve checks | Incident timeline | Learning feeds the next cycle |

## A first project in ten steps

1. Pick the supplied local task API. Read the worked contract.
2. Ask five questions before running anything.
3. Select three high-consequence failures from WorstCases.
4. Design at least one happy path, boundary, and state transition.
5. Identify the expected result and its authority for each case.
6. Prepare isolated data and record the build.
7. Run a short exploratory session, then the repeatable API lab.
8. Investigate a discrepancy; distinguish a real observation from a hypothetical exercise.
9. Propose a correction plus regression checks, with costs and uncertainty.
10. Write a release summary that says what was not tested.

## What "done testing" means

It means you completed an agreed scope and communicated the remaining uncertainty. It does not mean every input combination was tried or that no defects exist.

For the teaching API, local learning can be acceptable with documented limits. A shared public service would need a new contract, access-control design, stronger operational evidence, and a different release decision.
