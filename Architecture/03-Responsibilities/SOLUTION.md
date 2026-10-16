# 03-Responsibilities exercise solution

Domain normalizes and validates titles. CLI parses the GUID argument and prints results. Application decides what to do when a requested ID does not exist. Infrastructure writes the JSON file. CLI selects the configured path and supplies it to Infrastructure.

Unknown-ID behavior crosses a boundary: the service raises KeyNotFoundException, and the CLI maps that failure to exit code 3. One layer owns the meaning; another presents it.

Folders help navigation. Separate projects restrict what compiles based on project references. If Domain does not reference Infrastructure, it cannot use JsonTaskStore directly.

A single-project design with disciplined folders can be enough for a smaller application. Splitting projects should earn its complexity.
