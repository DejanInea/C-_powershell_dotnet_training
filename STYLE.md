# Course code style

Authored C# follows [Google's C# guide](https://google.github.io/styleguide/csharpguide.html), linked from the [Google style-guide index](https://google.github.io/styleguide/).

## C# and .NET lessons

- Use two spaces, same-line opening braces, and a 100-column limit.
- Put one statement on each line and brace control-flow bodies.
- Use PascalCase for types/public members, camelCase for parameters/locals, and _camelCase for private fields.
- Place System imports first and sort other imports alphabetically.
- Use block-bodied methods; reserve expression bodies for suitable properties and simple lambdas.
- Put each core type in its own matching source file.
- Use constants for fixed rules and readonly fields for stable dependencies.

.editorconfig records formatter settings and private-field naming. Types now live in files such as StudySession.cs, StudyEntry.cs, and TaskRules.cs. Numbered folders preserve lesson order.

The course still teaches modern C#: top-level programs, file-scoped namespaces, records, collection expressions, and C# 14 field-backed properties. Positional record parameters use PascalCase because they declare public properties.

## PowerShell convention

Google's shell guide targets Bash, so these scripts use a documented course convention: two spaces, same-line braces, explicit blocks, and separate statements. Aim for 100 columns; long literal URLs, generated HTML here-strings, and indivisible arguments can exceed that target.

Keep Verb-Noun function names, PascalCase parameters/output properties, and camelCase locals. Use full commands, structured output, help comments, validation, native exit-code checks, and splatting for long calls.

## Verify before committing

```powershell
. .\Initialize-Training.ps1
dotnet build .\LearningPack.slnx -m:1 -nr:false
.\Check-Style.ps1
.\Test-LearningPack.ps1
```

To apply the SDK formatter:

```powershell
dotnet format whitespace .\LearningPack.slnx --no-restore
dotnet format style .\LearningPack.slnx --no-restore --diagnostics IDE0011 IDE0022 IDE0061 --severity info
```

Review changes and run checks before regenerating course PDFs with Build-Guides.ps1. Original publisher PDFs and official documentation exports retain their source formatting.
