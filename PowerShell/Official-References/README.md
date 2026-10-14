# PowerShell: official reference PDFs

This folder contains **5 PDFs** from official source material. Files labeled Publisher PDF are the original downloaded publications. Files labeled Documentation export are locally printed copies of official Microsoft Learn articles, with source links, attribution, retrieval dates, and print formatting. They are not Microsoft-published PDF books or complete product manuals.

## Read in this order

Use the course's original learning guide and runnable lessons first. Then consult the relevant current Microsoft documentation article for a deeper explanation. Read standards and architecture books when you want formal language/runtime details or further architecture study.

The Monad Manifesto is the original 2002 design paper. It explains the ideas behind PowerShell, not current command syntax. The documentation exports use the PowerShell 7.6 view; the course's core scripts remain compatible with Windows PowerShell 5.1.

## PDF catalog

| PDF | Kind | Read with course lessons | Scope / edition |
| --- | --- | --- | --- |
| [Microsoft-Monad-Manifesto.pdf](Microsoft-Monad-Manifesto.pdf) | Publisher PDF | Background; 01 and 04 | Jeffrey Snover's original 2002 PowerShell design paper. Historical background, not a current command reference. |
| [Microsoft-PowerShell-Overview.pdf](Microsoft-PowerShell-Overview.pdf) | Documentation export | 01 | Current Microsoft Learn PowerShell overview, view 7.6. |
| [Microsoft-PowerShell-Pipelines.pdf](Microsoft-PowerShell-Pipelines.pdf) | Documentation export | 04-05 | Microsoft Learn object pipeline reference, view 7.6. |
| [Microsoft-PowerShell-Advanced-Functions.pdf](Microsoft-PowerShell-Advanced-Functions.pdf) | Documentation export | 06 | Microsoft Learn advanced functions reference, view 7.6. |
| [Microsoft-PowerShell-Modules.pdf](Microsoft-PowerShell-Modules.pdf) | Documentation export | 09 | Microsoft Learn module reference, view 7.6. |

## Sources

- Microsoft-Monad-Manifesto.pdf: [official source](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.6) and [PDF download](https://raw.githubusercontent.com/MicrosoftDocs/PowerShell-Docs/main/assets/MonadManifesto.pdf).
- Microsoft-PowerShell-Overview.pdf: [official source](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.6).
- Microsoft-PowerShell-Pipelines.pdf: [official source](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-7.6).
- Microsoft-PowerShell-Advanced-Functions.pdf: [official source](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced?view=powershell-7.6).
- Microsoft-PowerShell-Modules.pdf: [official source](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7.6).

## Provenance and refresh

Download-Record.json records the source URL, retrieval timestamp in UTC, file size, PDF SHA-256 hash, and original HTML hash for each documentation export. The retrieval timestamp records when the copy was collected; it is not the document's publication date. Article metadata dates are preserved where supplied. The official article remains the source of truth for changes after this snapshot.

From the repository root:

```powershell
.\Download-OfficialReferences.ps1
```

This refreshes the collection using Official-Resources.json. It requires internet access and local Chrome or Edge. It downloads only the public documents and creates local print copies; it does not install software or publish anything.

## Attribution

Original publisher PDFs retain their own copyright, license notices, and source formatting. Ecma standards include their copying terms. Microsoft Learn article wording and examples are retained while navigation is removed and print styling and a provenance banner are added. Credit belongs to Microsoft and the documentation contributors, including named authors credited in the source. See the [Microsoft Learn terms](https://learn.microsoft.com/en-us/legal/termsofuse) and the [.NET documentation CC BY 4.0 license](https://github.com/dotnet/docs/blob/main/LICENSE). This course and its exports do not imply publisher endorsement.
