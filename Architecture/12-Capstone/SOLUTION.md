# 12-Capstone exercise solution

One reasonable implementation adds StudyTask.Rename(title), TaskService.Rename(id, title), and a CLI rename case.

StudyTask.Rename constructs a validated new task with the existing ID and completion flag. Avoid copying the title-limit rule into the CLI. The service finds the task, replaces it in a loaded collection, and saves before returning. It throws KeyNotFoundException for an absent ID; title validation throws ArgumentException.

Decide and document precedence when the ID is missing and the title is invalid. The required individual scenarios do not mandate precedence for that combined case.

The CLI validates argument count and GUID syntax, calls the use case, and maps failures to the established exit codes. Infrastructure can remain unchanged because the stored fields have not changed.

Checks should demonstrate preserved identity/state, title boundaries, no write on invalid/missing requests, persistence across store instances, and existing commands. Keep the original working example as a comparison; this solution is guidance rather than a preimplemented rename command.

Your handover should link the brief, diagrams, ADR, automated-check output, and release runbook. You have completed the cycle when another learner can use and explain your result.
