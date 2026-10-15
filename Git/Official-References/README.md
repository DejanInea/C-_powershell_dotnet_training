# Git: official reference PDFs

This folder contains two original PDFs: the Pro Git book linked by Git's official website, and a Git cheat sheet published by GitHub. Both are downloaded as published and retain their original formatting and notices.

## PDF catalog

| PDF | Source | Read with the course |
| --- | --- | --- |
| [Pro Git, second edition](Pro-Git-2nd-Edition.pdf) | Scott Chacon and Ben Straub, Apress; maintainer release 2.1.450 | Read chapters 1-3 alongside [Git-Workflow.md](../../Git-Workflow.md), then chapters 5-7 for collaboration and tools. |
| [GitHub Git Cheat Sheet](GitHub-Git-Cheat-Sheet.pdf) | GitHub Professional Services training | Keep this two-page command reference open during Git checkpoints in any track. |

The cheat sheet uses older `git checkout` syntax and `master` branch examples. The course uses `git switch` and `main`; use your repository's actual branch name.

## Sources and attribution

- Pro Git: [Git's official book page](https://git-scm.com/book/en/v2), [maintainer release](https://github.com/progit/progit2/releases/tag/2.1.450), and [original PDF download](https://github.com/progit/progit2/releases/download/2.1.450/progit.pdf). The book is licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/); credit belongs to the authors and contributors.
- GitHub cheat sheet: [official training site](https://training.github.com/) and [original PDF download](https://training.github.com/downloads/github-git-cheat-sheet.pdf). Copyright and notices remain in the PDF.

For command details after this snapshot, consult [Git's official command reference](https://git-scm.com/docs).

## Refresh and verify

Run from the repository root:

```powershell
.\Download-OfficialReferences.ps1 -Topic Git
```

This requires internet access and `curl.exe`. No browser is needed for these publisher PDFs. The Pro Git URL is pinned to the recorded release for reproducibility; update its entry in `Official-Resources.json` when adopting a newer release.

`Download-Record.json` records source URLs, retrieval timestamps in UTC, file sizes, and SHA-256 hashes. Retrieval timestamps describe the download, not the publication date.
