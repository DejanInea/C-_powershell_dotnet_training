# 05-Dependencies exercise solution

Domain's rules use only .NET base-library types, so it references no example project. Application uses Domain and defines ITaskStore. Infrastructure implements that interface and references both.

Program.cs is the composition root. Replacing new JsonTaskStore(dataPath) with new InMemoryTaskStore() changes storage selection there. The latter survives only during one process, so separate CLI invocations do not share data. Application and Domain remain unchanged.

Having Application reference Infrastructure would create a cycle with the existing Infrastructure -> Application reference. More generally, it would couple use-case policy to a file implementation.

Load-all/save-all is intentionally simple for small single-writer data. It does not express atomic updates or efficient querying. Moving to concurrent operations may require redesigning that contract.
