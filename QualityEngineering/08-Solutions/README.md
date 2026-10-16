# 08-Solutions: Propose fixes and prove what changed

Level: Intermediate | Time: 60 minutes

## Learn the habit

A useful solution proposal connects a supported cause to an improvement and its consequences. QE can suggest options and verification; implementation ownership and release decisions should remain explicit.

Use [Investigation-and-Fix.md](../Templates/Investigation-and-Fix.md).

## Example: a proposed retry problem

| Option | Benefit | Tradeoff / new checks |
| --- | --- | --- |
| Disable repeat click while pending | Avoid some accidental requests | Keyboard flows, timeout recovery, no guarantee after a lost response |
| Server request deduplication key | Repeated logical submission can return the same outcome | Key scope, expiry, payload mismatch, concurrent requests |
| Clear pending/error messaging | Helps users understand uncertain results | Does not by itself prevent duplicate persistence |

These are proposals for a future networked client, not changes required by the current duplicate-title contract.

## Exercise

Pick one actual finding from your exploratory session, or use the explicitly fictional retry scenario. Document evidence, alternative explanations, two correction options, a chosen verification experiment, and regression risks.

Write a confirmation check for the original failure and separate checks for adjacent behavior. If no defect was established, propose a requirement clarification instead.

## Done when

A passing retest is tied to the original conditions, and the regression scope follows the changed behavior rather than "run everything" without reasoning.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
