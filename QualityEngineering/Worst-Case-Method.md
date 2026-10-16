# Build a useful worst-case scenario table

A worst case is a plausible failure with serious consequences under stated conditions. It is not simply the largest number you can type or a list of every disaster imaginable.

## Work backward from harm

1. **Choose a user action:** save a study task.
2. **Name what matters:** data stays correct; a success message is trustworthy.
3. **Find a failure:** saving fails but success is reported.
4. **Choose a trigger:** the target directory is not writable.
5. **State the expected protection:** visible failure, no misleading success, previous data preserved according to the agreed persistence contract.
6. **Design the experiment:** a disposable local environment with controlled permissions or a failing storage adapter.
7. **Capture the evidence:** build, exact path/setup, request, response, before/after state.
8. **Record the residual risk:** a passing simulated failure does not prove crash recovery.

## Recommended columns

| Column | Why it exists |
| --- | --- |
| Risk ID and feature | Link the scenario to the behavior at risk |
| Failure and trigger | Describe what could go wrong and how to explore it |
| User impact | Explain the consequence before choosing a priority |
| Likelihood and impact score | Rank effort using documented estimates |
| Expected protection | State the contract or mark an unanswered requirement |
| Approach | Describe the test, review, or experiment |
| Scope/status | Distinguish planned, observed, unsupported, and future cases |
| Owner / evidence | Make follow-up possible |

The worked table is [Worst-Case-Scenarios.csv](Worked-Example/Worst-Case-Scenarios.csv), also in the workbook.

## Risk score for this course

Likelihood: 1 rare, 2 unlikely, 3 plausible, 4 likely, 5 frequent under the stated use.
Impact: 1 minor annoyance, 2 small inconvenience, 3 disrupted workflow, 4 serious incorrect result, 5 severe data loss or disclosure.

Score = likelihood x impact. High = score 15-25; Medium = 8-14; Low = 1-7. **An impact of 5 is escalated to High regardless of the product.** This is our learning convention, not a universal standard or a prediction of probability. Uncertain likelihood deserves investigation, not a confident-looking invented number.

Severity describes a defect's consequence. Priority describes when to address it. A risk estimate before testing is different from the severity of an observed defect.

## Use dimensions to generate ideas

Input: absent, blank, minimum, maximum, malformed, Unicode.
State: new, existing, completed, deleted, repeated action.
Dependencies: unavailable, slow, partial response, bad data.
Time: retry, overlap, restart, time zone if relevant.
Environment: permissions, disk, configuration, network.
People: mistaken action, assistive technology, ownership if shared.

Combine factors deliberately. Two concurrent writers plus a restart may matter; a full Cartesian product usually does not fit your time. Pairwise coverage can help select combinations, but it does not replace targeted high-risk cases.

Do not label a hypothetical risk "Failed". Write a failed result only after an executed check differs from an agreed expectation.
