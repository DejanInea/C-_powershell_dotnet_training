# 09-Publishing: Release builds and framework-dependent publishing

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn build configurations, deployment output, and runtime requirements. Complete [08-Testing](../08-Testing/README.md) first.

## Understand the idea

A Debug build favors development. A Release build enables optimizations intended for deployment. dotnet publish prepares application files for distribution. Framework-dependent publishing expects the target machine to have a compatible runtime installed. Running the DLL through dotnet makes that dependency explicit. A self-contained publish includes a runtime for a selected runtime identifier, such as win-x64, and usually requires downloading runtime packs. Native AOT is another deployment option with restrictions and toolchain requirements. This course publishes the small lesson 01 console app without a runtime download. Publishing locally creates files; it does not deploy to a server or expose an application on the internet.

## Step by step

1. Open Publish.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\DotNet10\09-Publishing\Publish.ps1
```

## Expected result

```text
Release/publish build output, followed by .NET major version: 10 and the SDK/runtime explanation.
```

## Exercise

Compare bin/Debug and the published output. Locate the DLL, runtimeconfig.json, and deps.json and explain each role.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

runtimeconfig names the framework; deps describes dependencies.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-09-publish-notes.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-09-publish-notes
# Implement the exercise, then verify:
.\DotNet10\09-Publishing\Publish.ps1
git diff -- DotNet10/09-Publishing/README.md DotNet10/09-Publishing/Publish.ps1
git add -- DotNet10/09-Publishing/README.md DotNet10/09-Publishing/Publish.ps1
git diff --cached
git diff --cached --check
git commit -m "docs(dotnet10): explain published runtime files"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-09-publish-notes`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
