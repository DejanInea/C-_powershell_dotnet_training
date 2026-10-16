# Practice on the local task API

The automatic lab is the simplest complete route. Postman is an optional visual alternative.

## Automatic lab

From the repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\QualityEngineering\Labs\Invoke-ApiChecks.ps1
```

Requirements: installed .NET 10 SDK and PowerShell 5.1 or 7. The script uses built-in tools; it installs nothing.

The runner:

1. Creates a unique .artifacts/qe-run-* directory.
2. Records source hashes, SDK, target, data path, and run time.
3. Builds DotNet10/10-Capstone with single-process MSBuild.
4. Starts its own hidden loopback-only server on an available port.
5. Runs the 16 cases from Test-Cases.csv, including a controlled server restart.
6. Writes Report.html, Results.csv, Results.json, Requests.json, and Environment.json.
7. Stops only the server processes it started and retains isolated evidence.

The report path is printed at the end. Open Report.html in a browser. It works offline and links its raw data. Requests.json contains request/response bodies, statuses, UTC timestamps, and case IDs for the synthetic lab data. Build and server logs are in the same directory.

Exit 0 means every lab case passed. Exit 1 means at least one failed or was blocked. An unavailable build/environment is reported as Blocked rather than falsely blaming product behavior. Individual dependent cases may also be blocked if prerequisite data was not created.

The script does not change the API source, your normal task store, or the planning workbook. Runtime directories remain under .artifacts.

## Read results critically

A passing invalid-input case checks both status and collection size. A passing restart case uses a new process with the same file. Neither establishes crash durability, backup restoration, or multi-process concurrency.

A failing check needs investigation: product behavior, contract, data, test code, and environment are all candidates. Use the case ID, expected result, actual message, source hashes, and logs.

Durations are diagnostic wall-clock case durations, including requests/setup for some cases. They are not response-time benchmarks.

## Postman: optional visual API workflow

Import [Task-API.postman_collection.json](Task-API.postman_collection.json) into Postman. It contains eight requests with assertions and a task ID captured from its own creation response.

Start a separate disposable server from the repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
. .\Initialize-Training.ps1
$qeDirectory = Join-Path $PWD ('.artifacts\qe-postman-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $qeDirectory
$qeDataPath = Join-Path $qeDirectory 'tasks.json'
dotnet run --project .\DotNet10\10-Capstone -- --urls http://127.0.0.1:5088 --TrainingDataPath $qeDataPath
```

Wait for the listening message. The collection's baseUrl defaults to http://127.0.0.1:5088. If that port is busy, choose another loopback port and update the collection variable. Run the collection in order against this disposable target. It creates and deletes only the task whose ID it captures; duplicate-title behavior is not treated as a defect.

Compare the request, response body, assertion result, and server log. Stop the manual server with Ctrl+C when finished. The Postman collection covers a smaller request sequence than the PowerShell lab and does not restart the server.

See [Postman's official collection-run documentation](https://learning.postman.com/latest-v-12/docs/collections/running-collections/running-collections-overview). The collection is provided as an importable learning artifact; the local PowerShell lab is the independently runnable verification route.

## Your next investigations

Add a null-title case, a missing completion ID case, and a raw padded-title boundary case in your own practice copy. Preserve isolated data and report failures honestly. Plan a controlled storage-failure experiment separately; the current lab does not automate it.
