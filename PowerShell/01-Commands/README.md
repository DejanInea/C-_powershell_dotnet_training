# 01-Commands: Commands, help, and discovery

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn finding commands and understanding the shell. Complete the setup in the track README.

## Understand the idea

PowerShell is a shell and a scripting language. A cmdlet is a command named with a verb and noun, such as Get-Date. Parameters begin with a dash. Get-Command discovers a command and its type; Get-Help explains syntax and examples. Help content depends on what is installed locally; you can still inspect command syntax without downloading help. The pipe character passes output to another command. A .ps1 file stores a script. Dot-slash tells PowerShell to run a file from the current directory. Full command names are easier to read than aliases such as gci when you are learning.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\01-Commands\Demo.ps1
```

## Expected result

```text
The Get-Date command, today's local date, and help information. The date and installed help vary.
```

## Exercise

Find Get-Content, inspect its syntax, and list only files in this lesson folder.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Get-ChildItem accepts -LiteralPath and -File.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-01-discovery.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-01-discovery
# Implement the exercise, then verify:
.\PowerShell\01-Commands\Demo.ps1
git diff -- PowerShell/01-Commands/Demo.ps1
git add -- PowerShell/01-Commands/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "docs(powershell): record command discovery"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-01-discovery`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
