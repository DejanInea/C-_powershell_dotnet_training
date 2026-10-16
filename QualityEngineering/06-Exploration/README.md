# 06-Exploration: Investigate with a purpose

Level: Beginner | Time: 45-60 minutes

## Learn the habit

Exploratory testing is structured learning: choose a mission, make observations, and adapt the next experiment. It complements scripted checks.

Use [Exploratory-Charter.md](../Templates/Exploratory-Charter.md). Set a 20-minute timebox. Record input, observation, expectation, question, and next experiment as separate items.

## Example charter

Explore task identity across create, completion, deletion, and a new creation to discover identity reuse or stale-reference problems. Use a disposable local store. Observe API responses and stored state; do not infer correctness from a success code alone.

If a task appears missing, compare the data path and build before changing multiple variables. Keep surprising behavior as evidence rather than immediately "fixing" the setup.

## Exercise

Run one 20-minute session on title handling or task state. Try meaningful variants, not random values without an explanation. Pause at minute 15 to choose the most valuable remaining question.

Finish with three findings, two unresolved questions, and one proposed repeatable regression check. A finding can confirm a useful behavior; it need not be a bug.

## Done when

Your notes explain why the next experiment followed from the previous observation. Another learner can repeat your most important experiment.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
