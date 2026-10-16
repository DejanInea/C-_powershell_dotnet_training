# 02-Tools exercise solution

The request travels through Program.cs, TaskService.Add, StudyTask.Create / its constructor, and the store's Load and Save methods. The call stack shows the current execution path; it is not the same thing as a project-reference graph.

A blank title fails in the domain constructor before storage is loaded or saved. The CLI translates the ArgumentException into a message and exit code 2.

bin and obj are build output. Default task data is under the CLI's bin output directory in output/tasks.json. The example prints the configured path on stderr. Those generated directories are ignored by Git.

Do not install a database, container runtime, or cloud account to solve this lesson.
