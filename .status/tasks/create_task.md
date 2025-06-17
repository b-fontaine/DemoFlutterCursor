# Task : Add task creation feature

Status: To Do
Priority: High
Dependencies: task_list

## Requirements
- Add a screen to create new tasks
- Allow users to enter task title
- Save created tasks to local storage
- Display newly created tasks in the task list

## Steps 
1. Domain layer: Create task model and use case to create task following domain_layer.mdc rules.
2. Data layer: Create API, DAO and repository implementation following data_layer.mdc rules.
3. UI layer: Create widgets and state notifier to create task following ui_layer.mdc rules.

## Acceptance criteria
- The screen has a form with fields for task title and space for future fields
- Title field is required and must not be empty
- A save button submits the form
- Form validation shows appropriate error messages
- Successfully created tasks appear in the task list
- Tasks are persisted in local storage
- The UI follows the app design system and theme

## Technical notes
- Create files in module `lib/modules/tasks`
- Follow clean architecture principles
- Implement appropriate domain models, use cases, and repositories
- Use shared storage mechanisms to persist tasks