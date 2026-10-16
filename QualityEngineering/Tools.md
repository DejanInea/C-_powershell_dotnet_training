# Tools that make testing easier to see

Choose tools by the question you need to answer. You do not need to install every item below.

## A useful starting set

| Project stage | Starting tool | Visual aid / purpose | First exercise |
| --- | --- | --- | --- |
| Understand requirements | Existing editor and a notebook | Questions and concrete examples | Rewrite "fast" as a measurable scenario |
| Model behavior | [draw.io](https://www.drawio.com/) or paper | Flows, state transitions, cause diagrams | Draw todo -> done -> deleted |
| Rank risks and design cases | Excel or [LibreOffice Calc](https://www.libreoffice.org/) | Filtered scenario table and risk colors | Open QE-Workbook.xlsx; sort high risks |
| Track work and defects | Existing issue tracker; optionally [GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects) | Board/table of status, owner, priority | Sketch Proposed -> Investigating -> Fixing -> Retesting -> Closed |
| Investigate browser behavior | [Browser DevTools](https://developer.chrome.com/docs/devtools/network/) | Network requests, errors, timing | Compare HTTP status with displayed message |
| Exercise an API | [Postman](https://learning.postman.com/latest-v-12/docs/collections/running-collections/running-collections-overview) or the supplied PowerShell lab | Saved requests and assertion results | Send blank-title request; inspect body and state |
| Debug the implementation | Your current C# IDE | Breakpoints, watches, call stack | Trace rejection before persistence |
| Review repeated browser checks | [Playwright UI mode](https://playwright.dev/docs/test-ui-mode) and [Trace Viewer](https://playwright.dev/docs/trace-viewer-intro) | Step through browser actions and snapshots | Inspect a failed assertion with its trace |
| Review a release | Workbook plus generated HTML lab report | Passed, failed, blocked, untested, residual risks | Write a recommendation tied to evidence |

The spreadsheet and diagrams cover the early lessons. The PowerShell API lab uses your existing .NET SDK; no API-client installation is required.

## Suggested tool progression

1. **Now:** workbook, paper/draw.io, editor, Git.
2. **For API testing:** choose Postman if you want a request/response interface. Import the supplied collection and use the isolated local target described in Labs/README.md.
3. **For a real browser interface:** DevTools first; Playwright later for repeated checks.
4. **For team work:** use the issue tracker the team already maintains. Keep requirements, cases, bugs, and evidence connected.

Postman account requirements, plan limits, and collaboration behavior can vary; consult its current documentation for the mode you choose. The local PowerShell runner is the complete no-account route for this track.

Playwright's Node/TypeScript UI-mode workflow requires a separate Node/browser setup. Its .NET library can also automate browsers, but it is not the same workflow as the Node Playwright Test runner. Neither is installed by this course. The current practice target is an API, so there is no browser UI to automate yet.

## How to arrange your screen

Keep the behavior under test on one side and your scenario/evidence record on the other. During investigation, replace the scenario view with logs, the Network panel, or the debugger. Avoid capturing screenshots without the build, input, and expected result needed to interpret them.

A spreadsheet becomes useful when it explains why a scenario exists and where evidence lives. Colors and counts cannot make that judgment for you.
