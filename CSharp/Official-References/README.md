# CSharp: official reference PDFs

This folder contains **5 PDFs** from official source material. Files labeled Publisher PDF are the original downloaded publications. Files labeled Documentation export are locally printed copies of official Microsoft Learn articles, with source links, attribution, retrieval dates, and print formatting. They are not Microsoft-published PDF books or complete product manuals.

## Read in this order

Use the course's original learning guide and runnable lessons first. Then consult the relevant current Microsoft documentation article for a deeper explanation. Read standards and architecture books when you want formal language/runtime details or further architecture study.

ECMA-334's seventh edition specifies C# 7. It does not cover C# 14. Use Microsoft-CSharp14-Features.pdf for the newer language features used in the capstone.

## PDF catalog

| PDF | Kind | Read with course lessons | Scope / edition |
| --- | --- | --- | --- |
| [ECMA-334-CSharp-7th-Edition.pdf](ECMA-334-CSharp-7th-Edition.pdf) | Publisher PDF | All lessons; advanced reference | C# language standard, 7th edition (December 2023), covering C# 7. Not a C# 14 specification. |
| [Microsoft-CSharp-Overview.pdf](Microsoft-CSharp-Overview.pdf) | Documentation export | 01-08 | Current Microsoft Learn C# overview. |
| [Microsoft-CSharp14-Features.pdf](Microsoft-CSharp14-Features.pdf) | Documentation export | 12 | Microsoft Learn C# 14 feature overview. |
| [Microsoft-LINQ.pdf](Microsoft-LINQ.pdf) | Documentation export | 09 | Microsoft Learn introduction to LINQ queries. |
| [Microsoft-Async-Await.pdf](Microsoft-Async-Await.pdf) | Documentation export | 11 | Microsoft Learn asynchronous programming guidance. |

## Sources

- ECMA-334-CSharp-7th-Edition.pdf: [official source](https://ecma-international.org/publications-and-standards/standards/ecma-334/) and [PDF download](https://ecma-international.org/wp-content/uploads/ECMA-334_7th_edition_december_2023.pdf).
- Microsoft-CSharp-Overview.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/overview).
- Microsoft-CSharp14-Features.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-14).
- Microsoft-LINQ.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/csharp/linq/get-started/introduction-to-linq-queries).
- Microsoft-Async-Await.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/csharp/asynchronous-programming/).

## Provenance and refresh

Download-Record.json records the source URL, retrieval timestamp in UTC, file size, PDF SHA-256 hash, and original HTML hash for each documentation export. The retrieval timestamp records when the copy was collected; it is not the document's publication date. Article metadata dates are preserved where supplied. The official article remains the source of truth for changes after this snapshot.

From the repository root:

```powershell
.\Download-OfficialReferences.ps1
```

This refreshes the collection using Official-Resources.json. It requires internet access and local Chrome or Edge. It downloads only the public documents and creates local print copies; it does not install software or publish anything.

## Attribution

Original publisher PDFs retain their own copyright, license notices, and source formatting. Ecma standards include their copying terms. Microsoft Learn article wording and examples are retained while navigation is removed and print styling and a provenance banner are added. Credit belongs to Microsoft and the documentation contributors, including named authors credited in the source. See the [Microsoft Learn terms](https://learn.microsoft.com/en-us/legal/termsofuse) and the [.NET documentation CC BY 4.0 license](https://github.com/dotnet/docs/blob/main/LICENSE). This course and its exports do not imply publisher endorsement.
