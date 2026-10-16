# 04-Visual-Models exercise solution

Today's context contains one learner using StudyTasks. Today's container view contains a local CLI and its data file. Domain/Application/Infrastructure are source-level divisions within that process.

A proposed web design could contain a browser, one HTTP API, and a database. A CLI could call that API instead of writing the database directly. Mark this as a proposed evolution, not an implemented feature.

Multiple independent processes using the JSON adapter could load the same old state and overwrite each other's changes. Drawing two arrows to a file does not solve that lost-update problem.

C4's container concept is broader than Docker. See the [official diagram levels](https://c4model.com/diagrams) for more detail.
