# Task : Add plant to plant list

Status: To Do
Priority: Medium
Dependencies: None

## Requirements
- Create a feature to add plants to a personal plant collection
- Allow users to input plant details including name, species, and care notes
- Display the plant list with all added plants
- Enable users to view plant details and manage their collection

## Steps
1. Domain layer:
- Create plant model and plant repository interface following domain_layer.mdc rules
- Create empty use case to add plants to the list
- Create empty use case to retrieve plants from the list
- Create unit tests for these use cases using fake repositories
- Implement use cases following domain_layer.mdc rules
- Execute unit tests again

2. Data layer:
- Create tests for plant repository
- Execute unit tests
- Implement API, DAO and repository for plant data persistence
- Execute tests again
- Follow data_layer.mdc rules

3. UI layer:
- Create widgets and state notifier to display plant list
- Create add plant form widget
- Create plant detail view widget
- Follow ui_layer.mdc rules

## Acceptance criteria
- Users can add a new plant with name, species, and optional care notes
- The plant list displays all added plants in a scrollable view
- Each plant item shows name and species clearly
- Users can tap on a plant to view detailed information
- The add plant form validates required fields (name and species)
- Empty state is displayed when no plants exist with helpful message
- Loading state is displayed when retrieving or saving plants
- Error handling for network failures and validation errors
- The UI follows the app design system and theme
- Real-time updates when plants are added or modified
- Plant data persists between app sessions

## Technical notes
- Create files in new module `lib/modules/plants`
- Use Firebase Firestore for plant data storage
- Follow existing authentication patterns for user-specific plant collections
- Integrate with existing navigation and theme systems
- Use freezed for plant model immutability
- Implement proper error handling and user feedback
