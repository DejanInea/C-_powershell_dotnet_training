# DotNet10: official reference PDFs

This folder contains **10 PDFs** from official source material. Files labeled Publisher PDF are the original downloaded publications. Files labeled Documentation export are locally printed copies of official Microsoft Learn articles, with source links, attribution, retrieval dates, and print formatting. They are not Microsoft-published PDF books or complete product manuals.

## Read in this order

Use the course's original learning guide and runnable lessons first. Then consult the relevant current Microsoft documentation article for a deeper explanation. Read standards and architecture books when you want formal language/runtime details or further architecture study.

ECMA-335's sixth edition is a 2012 runtime standard, not the .NET 10 library catalog. The Microsoft architecture ebook covers an earlier generation of ASP.NET Core; use the .NET 10 overview and ASP.NET Core 10 tutorial for current APIs.

## PDF catalog

| PDF | Kind | Read with course lessons | Scope / edition |
| --- | --- | --- | --- |
| [ECMA-335-CLI-6th-Edition.pdf](ECMA-335-CLI-6th-Edition.pdf) | Publisher PDF | 01-02; advanced reference | Common Language Infrastructure standard, 6th edition (June 2012). Runtime concepts and library profiles; not the .NET 10 API reference. |
| [Microsoft-ASPNetCore-Architecture-Ebook.pdf](Microsoft-ASPNetCore-Architecture-Ebook.pdf) | Publisher PDF | After 10; architecture | Microsoft's published ASP.NET Core/Azure architecture ebook. Earlier-generation guidance; consult current ASP.NET Core 10 documentation for API details. |
| [Microsoft-DotNet10-Overview.pdf](Microsoft-DotNet10-Overview.pdf) | Documentation export | 01 and 10 | Microsoft Learn .NET 10 overview. |
| [Microsoft-DotNet-CLI.pdf](Microsoft-DotNet-CLI.pdf) | Documentation export | 01-02 and 09 | Microsoft Learn .NET command-line interface. |
| [Microsoft-SystemTextJson.pdf](Microsoft-SystemTextJson.pdf) | Documentation export | 03 and 10; CSharp 10-12 | Microsoft Learn System.Text.Json overview. |
| [Microsoft-Dependency-Injection.pdf](Microsoft-Dependency-Injection.pdf) | Documentation export | 04 | Microsoft Learn dependency injection overview. |
| [Microsoft-Configuration.pdf](Microsoft-Configuration.pdf) | Documentation export | 03-04 | Microsoft Learn configuration in .NET. |
| [Microsoft-Logging.pdf](Microsoft-Logging.pdf) | Documentation export | 04-10 | Microsoft Learn logging in .NET. |
| [Microsoft-HttpClient.pdf](Microsoft-HttpClient.pdf) | Documentation export | 07 | Microsoft Learn HttpClient guidelines. |
| [Microsoft-ASPNetCore10-MinimalAPI.pdf](Microsoft-ASPNetCore10-MinimalAPI.pdf) | Documentation export | 05-06 and 10 | Microsoft Learn minimal API tutorial explicitly pinned to ASP.NET Core 10. |

## Sources

- ECMA-335-CLI-6th-Edition.pdf: [official source](https://ecma-international.org/publications-and-standards/standards/ecma-335/) and [PDF download](https://ecma-international.org/wp-content/uploads/ECMA-335_6th_edition_june_2012.pdf).
- Microsoft-ASPNetCore-Architecture-Ebook.pdf: [official source](https://dotnet.microsoft.com/en-us/learn/dotnet/architecture-guides) and [PDF download](https://raw.githubusercontent.com/dotnet-architecture/eBooks/main/current/architecting-modern-web-apps-azure/Architecting-Modern-Web-Applications-with-ASP.NET-Core-and-Azure.pdf).
- Microsoft-DotNet10-Overview.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-10/overview).
- Microsoft-DotNet-CLI.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/core/tools/).
- Microsoft-SystemTextJson.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/standard/serialization/system-text-json/overview).
- Microsoft-Dependency-Injection.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/core/extensions/dependency-injection/overview).
- Microsoft-Configuration.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/core/extensions/configuration).
- Microsoft-Logging.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/core/extensions/logging).
- Microsoft-HttpClient.pdf: [official source](https://learn.microsoft.com/en-us/dotnet/fundamentals/networking/http/httpclient-guidelines).
- Microsoft-ASPNetCore10-MinimalAPI.pdf: [official source](https://learn.microsoft.com/en-us/aspnet/core/tutorials/min-web-api?view=aspnetcore-10.0).

## Provenance and refresh

Download-Record.json records the source URL, retrieval timestamp in UTC, file size, PDF SHA-256 hash, and original HTML hash for each documentation export. The retrieval timestamp records when the copy was collected; it is not the document's publication date. Article metadata dates are preserved where supplied. The official article remains the source of truth for changes after this snapshot.

From the repository root:

```powershell
.\Download-OfficialReferences.ps1
```

This refreshes the collection using Official-Resources.json. It requires internet access and local Chrome or Edge. It downloads only the public documents and creates local print copies; it does not install software or publish anything.

## Attribution

Original publisher PDFs retain their own copyright, license notices, and source formatting. Ecma standards include their copying terms. Microsoft Learn article wording and examples are retained while navigation is removed and print styling and a provenance banner are added. Credit belongs to Microsoft and the documentation contributors, including named authors credited in the source. See the [Microsoft Learn terms](https://learn.microsoft.com/en-us/legal/termsofuse) and the [.NET documentation CC BY 4.0 license](https://github.com/dotnet/docs/blob/main/LICENSE). This course and its exports do not imply publisher endorsement.
