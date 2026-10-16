# 04-Visual-Models: Draw useful architecture pictures

Level: Beginner | Time: 45-60 minutes | Prerequisite: lesson 03

## Goal

Use the right diagram to answer the question in front of you.

## Understand it

A context diagram shows users and outside systems. A container view shows running applications and data stores. A component view shows responsibilities within one application. A sequence diagram shows a single interaction over time.

Those views answer different questions. A class is not a server; a source project is not automatically a separate process. Five projects can be deployed together as one CLI application.

Open [Visual-Maps.md](../Visual-Maps.md), then the [dependency SVG](../Diagrams/dependencies.svg) and [request-flow SVG](../Diagrams/request-flow.svg). Each has a legend. Arrows mean different things in different views.

## Step by step

1. Draw one learner and the whole StudyTasks system.
2. Zoom inside the boundary: local CLI process and JSON file.
3. Draw a request journey: parse, validate, load, save, present.
4. Add a failure branch for a blank title.
5. Make a second diagram showing source dependencies, rather than calls.
6. Find one actual file behind every component box.

Use short labels with verbs: "enters commands", "calls Add", "reads JSON". Include the important assumption: one process at a time.

## Exercise

Imagine an optional web interface. Sketch a future container view and mark it "proposed". Identify whether a local CLI and a new web API would share a JSON file. Explain the new concurrency problem before drawing a database.

## Done when

A reader can tell which diagram describes today's code and which describes a future proposal. Your arrows are labeled and do not mix source references with network traffic.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
