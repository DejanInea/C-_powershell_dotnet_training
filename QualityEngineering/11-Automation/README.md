# 11-Automation: Automate evidence worth repeating

Level: Intermediate | Time: 60 minutes

## Learn the habit

Automate stable, repeatable checks when their repeated value justifies maintenance. Keep exploration and human judgment alongside automation.

A domain rule can often be checked without a browser. An API contract can be checked at HTTP level. A browser check is useful for real user interaction, but it is usually more expensive to diagnose than an isolated rule check.

## Select candidates

| Candidate | Repetition value | Likely approach |
| --- | --- | --- |
| Title limit and blank input | High | Domain/API boundary checks |
| Restart persistence | High | Isolated storage/API integration |
| Critical UI submission | High once UI exists | Browser interaction and trace |
| "Is this explanation understandable?" | Context-dependent | Human review with users |
| Unclear new workflow | Learning needed first | Exploratory session |

Playwright UI mode and Trace Viewer make browser actions and failures visible. They do not replace assertions, isolation, or a reason for each check. The current lab automates API checks using PowerShell.

## Exercise

Rank five candidates by value, stability, setup cost, and diagnosis cost. For one candidate define its oracle, isolated data, cleanup/ownership, failure evidence, and nonzero failure exit status.

Explain how you would distinguish a product failure, flaky timing, a broken test, and an environment outage. Do not hide intermittent failures with unlimited retries.

## Done when

Your proposal says what the check can detect, how failures will be investigated, and who will maintain it.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
