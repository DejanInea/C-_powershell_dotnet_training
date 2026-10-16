# Visual maps for testing

- [Project lifecycle](Diagrams/qe-lifecycle.svg): where QE contributes and what evidence is produced.
- [Investigation loop](Diagrams/investigation.svg): observe, reproduce, explain, propose, verify.
- [Risk matrix](Diagrams/risk-matrix.svg): see the risk ranking without opening a spreadsheet.
- [QE workbook](QE-Workbook.xlsx): a visual risk matrix plus filterable risk, case, defect, and coverage tables.

Open the SVG files directly in a browser; they need no diagram extension or internet connection.

## Map the task's states

```text
Absent -- create --> Todo -- complete --> Done
Todo   -- delete --> Absent
Done   -- delete --> Absent
Done   -- complete --> Done
Absent -- complete/delete --> Not found
```

An action can be correct in one state and invalid in another. A state map gives you test ideas that a list of input values will miss.

## Map a failure investigation

```text
Observation: "Task missing after restart"
  +-- Same data path? ------------ compare configuration and logs
  +-- Save acknowledged? --------- inspect response and file state
  +-- Different process/store? --- compare environment and build
  +-- File valid? ---------------- inspect a copy; preserve evidence
  +-- Another writer involved? --- reconstruct the event timeline
```

Each branch is a hypothesis. It becomes a cause only when evidence supports it.

## Draw your own

In paper or draw.io, create a behavior map first, then mark risks near the transitions. Use a separate defect board for work status. A red risk marker is not proof of a defect, and moving a bug card to Closed is not evidence that the fix works.
