# 09-Quality: Make quality and risks concrete

Level: Intermediate | Time: 60 minutes | Prerequisite: lesson 08

## Goal

Turn vague qualities into scenarios that influence design.

## Understand it

"Reliable", "secure", and "fast" mean little until you name the situation and evidence. Write: when [event] occurs under [conditions], the system should [response], measured by [criterion].

For this personal local tool, loss of tasks matters more than request throughput. A shared web application adds identity, authorization, remote input, and network failures. Revisit assumptions when deployment changes.

## Worked review

| Scenario | Current behavior | Improvement to consider |
| --- | --- | --- |
| Invalid CLI input | Rejected with nonzero status | Keep messages clear and actionable |
| File cannot be written | Failure reported | Check permissions and backup procedure |
| Process crashes during save | May leave partial JSON | Transactional store or robust replacement protocol |
| Two processes write together | Lost updates possible | Transaction/concurrency design |
| Sensitive task titles | Stored as plaintext | Define acceptable data and filesystem access |
| Large file | Whole list loaded and saved | Measure; consider bounded queries and database |

No passwords or tokens are needed by this sample. A future service should keep credentials outside source and logs. A user-controlled data path is accepted for trusted local use; exposing it through a web request would need a different boundary policy.

## Exercise

Select three risks. For each record likelihood, consequence, current protection, remaining gap, and one next action. Measure listing performance for an explicit task count and machine; do not invent results.

Explain whether your diagram shows a trust boundary or only a logical layer.

## Done when

Your review distinguishes what you tested from what you assume. Improvements address actual requirements and evidence.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
