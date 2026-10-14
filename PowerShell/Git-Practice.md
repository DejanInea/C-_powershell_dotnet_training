# Git practice in the PowerShell course

Read [Git-Workflow.md](../Git-Workflow.md) first and save the supplied baseline before editing. Start each exercise on a clean branch from main. Run focused checks, stage related changes, commit with a clear message, then choose either local integration or a GitHub pull request.

## Track checkpoints

| Lesson | Branch | Suggested commit | Extra Git skill |
| --- | --- | --- | --- |
| 01-Commands | feat/powershell-01-discovery | docs(powershell): record command discovery | Inspect status, diff, and staging |
| 02-Variables | feat/powershell-02-remaining-minutes | feat(powershell): calculate remaining study minutes | Inspect status, diff, and staging |
| 03-ControlFlow | feat/powershell-03-session-count | feat(powershell): count long study sessions | Inspect status, diff, and staging |
| 04-Objects | feat/powershell-04-json-output | feat(powershell): serialize study objects | Keep commits focused and review the staged snapshot |
| 05-Pipeline | feat/powershell-05-short-sessions | feat(powershell): count filtered short sessions | Keep commits focused and review the staged snapshot |
| 06-Functions | feat/powershell-06-study-days | feat(powershell): convert minutes to study days | Keep commits focused and review the staged snapshot |
| 07-Files | feat/powershell-07-json-filter | feat(powershell): filter saved JSON study data | Push a branch and explain validation in a PR |
| 08-Errors | feat/powershell-08-native-exit | test(powershell): check native failure exit codes | Push a branch and explain validation in a PR |
| 09-Modules | feat/powershell-09-average-minutes | feat(powershell): add average minutes to summaries | Push a branch and explain validation in a PR |
| 10-Capstone | feat/powershell-10-task-client | test(powershell): verify task client completion | Review integration history and practice conflict resolution |

For a docs-only change, prefer a docs/ branch; for a bug fix, prefer fix/. The suggested feat/ name is a convenient starting point and can be adapted to what you actually implement. Do not describe a documentation-only experiment as a new program feature.

## Practice in a separate local repository

```powershell
.\New-GitPractice.ps1 -Topic PowerShell
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
