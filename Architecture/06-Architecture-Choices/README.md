# 06-Architecture-Choices: Choose a structure for a reason

Level: Intermediate | Time: 60 minutes | Prerequisite: lesson 05

## Goal

Compare options and record why a particular structure fits today's problem.

## Compare the ideas

| Approach | Organizing idea | Useful when | Cost to consider |
| --- | --- | --- | --- |
| Small structured program | Few files with clear jobs | Small scope, few rules | Boundaries rely heavily on discipline |
| Layers | Presentation, rules, data responsibilities | You need a clear division of work | Requests may cross several layers |
| Clean / ports-and-adapters boundaries | Policy independent of external details | Rules need independent tests or multiple adapters | More contracts and wiring |
| Vertical slices | Group code by a complete feature | Features evolve independently | Shared rules still need a clear owner |
| Modular monolith | Separate business modules in one deployment | Several business areas, one operational unit | Module boundaries need enforcement |
| Microservices | Independently operated services | Proven independent deployment/scale needs | Network failures, data consistency, operations |

These ideas can overlap. A monolith may have layers, vertical slices, and inward dependencies. A project per layer does not make a program a set of microservices.

## Worked decision

For one local learner, choose a single deployable CLI with clear rule/storage boundaries. Our sample makes boundaries explicit with projects for teaching. A smaller implementation could start in one project.

Write an ADR using [the template](../Templates/ADR.md). Compare a structured single project, the supplied layout, and a remote service design. Tie your decision to offline use, current scope, and who maintains it.

## Exercise

Add the proposed feature "share tasks between twenty learners". What evidence do you need before choosing an API, database, authentication, or independent services? Separate a required behavior from a preferred technology.

## Done when

You can describe one rejected alternative fairly and name a concrete event that would make you reconsider.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
