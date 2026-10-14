# Git practice in the CSharp course

Read [Git-Workflow.md](../Git-Workflow.md) first and save the supplied baseline before editing. Start each exercise on a clean branch from main. Run focused checks, stage related changes, commit with a clear message, then choose either local integration or a GitHub pull request.

## Track checkpoints

| Lesson | Branch | Suggested commit | Extra Git skill |
| --- | --- | --- | --- |
| 01-Hello | feat/csharp-01-city | feat(csharp): accept an optional city argument | Inspect status, diff, and staging |
| 02-Types | feat/csharp-02-discount | feat(csharp): calculate discounted study prices | Inspect status, diff, and staging |
| 03-Decisions | feat/csharp-03-senior-category | feat(csharp): classify senior ages | Inspect status, diff, and staging |
| 04-Loops | feat/csharp-04-session-statistics | feat(csharp): count longer study sessions | Keep commits focused and review the staged snapshot |
| 05-Methods | feat/csharp-05-total-calculation | feat(csharp): validate total calculation inputs | Keep commits focused and review the staged snapshot |
| 06-Collections | feat/csharp-06-topic-totals | feat(csharp): aggregate topic minutes | Keep commits focused and review the staged snapshot |
| 07-Classes | feat/csharp-07-completion-time | feat(csharp): record first completion time | Push a branch and explain validation in a PR |
| 08-Interfaces | feat/csharp-08-memory-notifier | test(csharp): capture notifier messages in memory | Push a branch and explain validation in a PR |
| 09-Linq | feat/csharp-09-topic-summary | feat(csharp): summarize distinct study topics | Push a branch and explain validation in a PR |
| 10-Files | feat/csharp-10-missing-file | fix(csharp): handle missing study files | Review integration history and practice conflict resolution |
| 11-Async | feat/csharp-11-cancellation | test(csharp): verify planning cancellation | Review integration history and practice conflict resolution |
| 12-Capstone | feat/csharp-12-summary-command | feat(csharp): add a per-topic summary command | Review integration history and practice conflict resolution |

For a docs-only change, prefer a docs/ branch; for a bug fix, prefer fix/. The suggested feat/ name is a convenient starting point and can be adapted to what you actually implement. Do not describe a documentation-only experiment as a new program feature.

## Practice in a separate local repository

```powershell
.\New-GitPractice.ps1 -Topic CSharp
```

Use the printed developer and teammate paths. Both clones and their bare remote are inside .artifacts. Follow the push, merge, and conflict examples from Git-Workflow.md there. This is separate from changing your actual course repository.

## A complete checkpoint

1. Verify the change with the lesson commands and an appropriate boundary case.
2. Inspect git diff and stage only related source or notes.
3. Inspect git diff --cached and commit.
4. Push your branch if you intend to publish it.
5. Review a PR or perform a local merge, then verify the behavior on main.
6. Record the resulting commit ID in Progress.md.

Do not commit generated build output, demonstration data, API logs, browser profiles, or credentials. Regenerate the original course PDFs after documentation changes only when the source content is ready; inspect PDF changes by size and rendered pages rather than a text diff.
