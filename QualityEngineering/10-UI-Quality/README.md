# 10-UI-Quality: Look beyond functional happy paths

Level: Intermediate | Time: 60 minutes

## Learn the habit

Usability, accessibility, performance, security, and recovery need explicit scenarios. Choose applicable dimensions rather than attaching every quality label to every project.

The current target is an API. Browser exercises below describe a proposed future task interface, not an existing screen.

## Proposed UI scenarios

| Dimension | Example investigation |
| --- | --- |
| Keyboard | Create and complete a task without a mouse; visible focus and sensible order |
| Accessibility | Labels, status announcements, contrast, zoom, and error identification |
| Network | Lost response, offline state, retries, and stale display |
| Usability | Understand what was saved and what action is needed after failure |
| Performance | Agreed dataset/load/environment and measured latency distribution |
| Security | If sharing exists, test permitted actions and ownership boundaries |
| Recovery | Restore a test backup and verify IDs/state before relying on it |

Use the [W3C preliminary checks](https://www.w3.org/WAI/test-evaluate/preliminary/) as a starting point for a real UI. A quick automated scan cannot establish accessibility conformance.

## Exercise

Choose three dimensions. For each state user impact, preconditions, observable result, measurement/evidence, and whether the current target supports the scenario.

Mark missing identity/UI requirements as Needs requirement or Not applicable with a reason. Do not silently call them Passed.

## Done when

You can explain why these checks matter to a user and what environment/contract is needed to run them.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
