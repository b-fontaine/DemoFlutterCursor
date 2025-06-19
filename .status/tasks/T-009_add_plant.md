# Task : Add plant

Status: In Progress
Priority: High
Dependencies: None

## Requirements
Create a plant management system that allows users to manage their personal plant collection
- Display a list of all user plants in a clear and organized layout
- Provide a UI tool to add new plants to the collection
- Show plant details including name, type, and description
- Enable plant information updates

## Steps
1. Domain layer:
- Create plant model and repository interface following domain_layer.mdc rules
- Create empty use case implementations for getting plants, adding plants, and updating plants
- Create unit tests using fake repositories
- Implement use cases following domain_layer.mdc rules
- Execute unit tests again

2. Data layer:
- Create tests for plant repository
- Execute unit tests
- Implement API, DAO and repository
- Execute tests again
- Follow data_layer.mdc rules for every implementation

3. UI layer:
- Create widgets and state notifier to display plant list and add plant functionality
- Follow ui_layer.mdc rules

## Acceptance criteria
- The screen displays all plants in a scrollable list
- Each plant item shows name, type, and description in a clear layout
- User can add a new plant using a dedicated form with name, type, and description fields
- The plant list updates in real-time when plants are added or updated
- Empty state is displayed when no plants exist with helpful message
- Loading state is displayed when retrieving plants
- Form validation ensures required fields are filled
- Success feedback is shown when plants are added or updated
- The UI follows the app design system and theme
- All text uses internationalization system (Slang)

## Technical notes
- Create files in module `lib/modules/plants`
- Use shared storage mechanisms to store plants (API + DAO pattern)
- Follow freezed pattern for domain models and UI states
- Use StateNotifier pattern for state management
- Add plant-related strings to internationalization file
- Follow TDD approach with comprehensive test coverage
