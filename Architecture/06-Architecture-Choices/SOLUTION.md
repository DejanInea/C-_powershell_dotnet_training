# 06-Architecture-Choices exercise solution

A reasonable ADR accepts a single local deployment because the user, data, and operations are local. It accepts separate projects for this exercise because we want enforceable source-reference boundaries. The cost is more files and wiring.

A remote service is deferred because it adds deployment, networking, and access-control work without a current requirement. Revisit when users truly need shared data, remote access, or concurrent updates.

Sharing with twenty learners requires answers about identity, ownership, permissions, connectivity, concurrency, and recovery. One API with a relational store may be sufficient; the user count alone does not justify microservices.

For further comparison, consult [Microsoft's architecture overview](https://learn.microsoft.com/en-us/dotnet/architecture/modern-web-apps-azure/common-web-application-architectures).
