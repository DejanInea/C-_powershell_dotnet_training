# 01-Mindset: Ask better questions before looking for bugs

Level: Beginner | Time: 45 minutes | No coding prerequisite

## Learn the habit

Start with a user goal, then ask what would make the result untrustworthy. "The button works" is weaker than "The learner's task is saved once, visible after restart, and failures are explained."

Use this sequence: understand -> predict -> observe -> compare -> investigate -> communicate. Write your prediction before running the experiment so you notice when you are explaining a surprise away.

## Five lenses

| Lens | Question for the study-task project |
| --- | --- |
| User | What happens if I think my task was saved but it was not? |
| Rule | What does a valid title mean exactly? |
| State | Can I complete an already completed task? |
| Environment | Which file is used after restarting? |
| Evidence | What would convince someone else that the problem exists? |

A discrepancy may be a product defect, a requirement gap, incorrect test data, a broken environment, or a mistaken expectation. Keep these alternatives open.

## Exercise

Read the [worked contract](../Worked-Example/Contract.md). Write ten questions before executing anything. Separate known answers, assumptions, and unresolved questions. Choose one question whose answer would change your testing priorities.

## Explain it yourself

Why does a passing happy path tell you little about failed saves or missing data? What would you inspect before blaming the developer?

Read [SOLUTION.md](SOLUTION.md) after your attempt.
