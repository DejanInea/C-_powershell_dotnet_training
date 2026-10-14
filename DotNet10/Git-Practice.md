# Git practice in the DotNet10 course

Read [Git-Workflow.md](../Git-Workflow.md) first and save the supplied baseline before editing. Start each exercise on a clean branch from main. Run focused checks, stage related changes, commit with a clear message, then choose either local integration or a GitHub pull request.

## Track checkpoints

| Lesson | Branch | Suggested commit | Extra Git skill |
| --- | --- | --- | --- |
| 01-Sdk | feat/dotnet10-01-sdk-notes | docs(dotnet10): explain project SDK settings | Inspect status, diff, and staging |
| 02-Library | feat/dotnet10-02-remaining-minutes | feat(dotnet10): add a remaining minutes calculation | Inspect status, diff, and staging |
| 03-Configuration | feat/dotnet10-03-environment-override | test(dotnet10): verify the daily target override | Inspect status, diff, and staging |
| 04-DependencyInjection | feat/dotnet10-04-service-lifetimes | test(dotnet10): compare service lifetimes | Keep commits focused and review the staged snapshot |
| 05-MinimalApi | feat/dotnet10-05-minutes-route | feat(dotnet10): add a minutes conversion endpoint | Keep commits focused and review the staged snapshot |
| 06-Validation | feat/dotnet10-06-invalid-input | test(dotnet10): verify invalid session requests | Keep commits focused and review the staged snapshot |
| 07-HttpClient | feat/dotnet10-07-connection-failure | test(dotnet10): document client failure behavior | Push a branch and explain validation in a PR |
| 08-Testing | feat/dotnet10-08-boundary-cases | test(dotnet10): check study budget boundaries | Push a branch and explain validation in a PR |
| 09-Publishing | feat/dotnet10-09-publish-notes | docs(dotnet10): explain published runtime files | Push a branch and explain validation in a PR |
| 10-Capstone | feat/dotnet10-10-task-summary | feat(dotnet10): add task summary counts | Review integration history and practice conflict resolution |

For a docs-only change, prefer a docs/ branch; for a bug fix, prefer fix/. The suggested feat/ name is a convenient starting point and can be adapted to what you actually implement. Do not describe a documentation-only experiment as a new program feature.

## Practice in a separate local repository

```powershell
.\New-GitPractice.ps1 -Topic DotNet10
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
