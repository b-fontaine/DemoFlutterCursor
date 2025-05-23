
# Project Architecture

This document describes the architecture of the project.

## Project Structure

The two root packages are "core" and "modules".
"modules" defines a functionnal unit, a stand-alone feature set of classes, following clean architecture principle inside its own package.
"core" defines every classes that are common to multiple modules.

Here is an overview of the folder structure of the project:

lib
├── core
│   ├── data // Data layer for core
│   │   ├── api // httpclient and api extensions + core api (if an api is used by multiple modules we put it here)
│   │   │   └── dto // function to help you create entities from json and common entities used by multiple modules
│   │   ├── models // Domain models used by multiple modules
│   │   ├── repositories // Domain models used by multiple modules
│   │   └── storage // Classes that manage local storage (Dao, shared_preferences etc.)
│   ├── domain // Domain layer for core
│   │   │   ├── models // Specific models used in this module
│   │   │   └── repositories // Definition of repositories used in this module
│   ├── initializer // app initializer class definitions 
│   │   └── models
│   └── ui // Ui layer for core
│       ├── states // contains all global states (user states)
│       │   └── models // models used by thoses states
│       ├── theme // Defines the theme used in the app (colors, font, sizes, widget style etc.)
│       └── widgets // Common widget used by multiple modules
└── modules
    └── module_1
        ├── data // Data layer
        │   ├── api // a module can have its own api classes
        │   ├── entities // entities returned by api
        │   └── repositories // Implementations of repositories used in this module
        ├── domain // Domain layer
        │   ├── models // Specific models used in this module
        │   └── usecases // Definition of use cases used in this module
        ├── ui // Ui layer
        │   ├── providers // Riverpod state notifier that returns a page / component state
        │   │   └── models // models for our page state
        │   ├── component // a component use a provider and domain  
        │   └── widgets // a widget is dumb and is used only for simple data presentation using Flutter
        └── module_1_page.dart // Page widget, entry point for this module from the routing. We can have several pages.



## Data layer

The data layer is responsible for fetching data from any source (remote with API, local with Database). 
It is also responsible for parsing and serialization.

### API classes

API classes are used to contact network API (here, Firebase) to send and retrieve data from server.

### DTO classes

DTO classes are used to serialize and deserialize data received or sent to Firebase Firestore.
They are generated using the `freezed` and `json_annotation` packages.

### Repositories

Repositories are classes used to abstract data management from any source (remote with API, local with Database).
They are using providers to inject Api and Dao in repositories 



## Domain layer

This layer is responsible for the business logic of the app.
It contains domain models, that will be used into the UI layer, and use cases that interacts with the data layer repositories.

### Domain models

Domain models are used to represents data that will be used into the UI layer.

### Use cases

Use Cases represents a specific action or business operation that can be performed in the application.
They are using repositories to manage data from any source (remote with API, local with Database).


## UI Layer

The UI layer is responsible to display the data to the user.
It relies on repositories and use cases to get the data or update data after a user action.

### State Providers

The application uses Riverpod's StateNotifier pattern for managing state. This pattern consists of three main components:

1. **State Class**: An immutable class created with Freezed that represents the state.
2. **StateNotifier**: A class that manages the state and provides methods to modify it.
3. **Provider**: A Riverpod provider that exposes the StateNotifier to the UI.

### Page and Component

Pages and Components are Flutter widgets that listen to an immutable state object from Riverpod state notifiers
Pages widgets differ from components widgets because they are entry point for routing operations. 
Components widgets are used to display data and are not used for routing operations.

### Widgets

Widgets are dumb and are used only for simple data presentation using Flutter.

### Routing

Routing is the process of navigating between different pages in the application.
Only "page" widgets can be used for routing operations.

### Theming

Theming is the process of applying a theme to the application.
This application uses a well-structured theme system based on Flutter's ThemeExtension capability. 
The theming system allows for easy customization of colors, typography, and widget styles while maintaining consistency across the application.
This theme is defined in the `lib/core/ui/theme` folder.

### Internationalisation

Internationalisation is the process of translating the application into different languages.
It uses the "slang" package to manage translations.

The internationalisation is defined in the `i18n` folder.








