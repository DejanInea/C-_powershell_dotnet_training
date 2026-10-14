# 08-Errors: Errors and external process exit codes

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn terminating errors, catch, finally, and native programs. Complete [07-Files](../07-Files/README.md) first.

## Understand the idea

Many cmdlet failures are non-terminating by default. -ErrorAction Stop converts them into terminating errors that try/catch can handle. ErrorActionPreference applies a default within the script scope. Catching a specific exception avoids hiding unrelated failures. finally runs whether the try block succeeds or fails and is suitable for cleanup. Native executables such as dotnet communicate failure through an exit code. Check LASTEXITCODE immediately after the executable. It is different from the success flag $? and is not a general cmdlet error flag. Scripts used in automation should fail clearly instead of continuing with incomplete results.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\08-Errors\Demo.ps1 -Verbose
```

## Expected result

```text
Expected: the demonstration file does not exist.
An installed .NET SDK version.
The dotnet command succeeded.
Verbose cleanup text is also displayed.
```

## Exercise

Call dotnet with an invalid subcommand, capture LASTEXITCODE immediately, and confirm it is nonzero. Handle that expected failure without failing the whole demo.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Run the experiment in a separate terminal or separate script.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-08-native-exit.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-08-native-exit
# Implement the exercise, then verify:
.\PowerShell\08-Errors\Demo.ps1
git diff -- PowerShell/08-Errors/Demo.ps1
git add -- PowerShell/08-Errors/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "test(powershell): check native failure exit codes"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-08-native-exit`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
