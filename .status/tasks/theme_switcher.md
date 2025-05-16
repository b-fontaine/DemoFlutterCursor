
# Task : Add a theme switcher

Status: Pending
Priority: High
Dependencies: None

## Requirements
- Add a widget button to the settings page to display the current theme and to toggle the theme
- The choice of theme is saved in the device storage

## Acceptance criteria
- The widget use a Switcher widget from the material library
- The Switcher have two state : on and off
- When the switcher is on, the theme is light
- When the switcher is off, the theme is dark
- The widget describe clearly to the user how to use it
- The theme is saved in the device storage
- The theme is loaded from the device storage
- The theme is applied to the app

## Technical notes
- Use classes in `lib/core/ui/theme` to manage the theme

