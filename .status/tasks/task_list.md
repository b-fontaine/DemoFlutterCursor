# Task : Display task list

Status: To Do
Priority: High
Dependencies: None

## Requirements
- Create a screen to display all user tasks
- Show task details in a clear and organized layout
- Enable task status updates (complete/incomplete)

## Steps
1. Domain layer: Create task model and use case to retrieve tasks following domain_layer.mdc rules.
2. Data layer: Create API, DAO and repository implementation following data_layer.mdc rules.
3. UI layer: Create widgets and state notifier to display tasks following ui_layer.mdc rules.

## Acceptance criteria
- The screen displays all tasks in a scrollable list
- Each task item shows title and status using a checkbox
- User can complete a task by clicking on the checkbox
- A completed task is visually distinct from an incomplete task (grey color and strikethrough)
- The list updates in real-time when tasks are created, updated or deleted
- Empty state is displayed when no tasks exist
- Loading state is displayed when retrieving tasks
- The UI follows the app design system and theme

## Technical notes
- Create files in module `lib/modules/tasks`
- Use shared storage mechanisms to retrieve tasks