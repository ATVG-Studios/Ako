# Ako Flutter Widgets

Ako is a collection of generic Flutter widgets, extensions and utilities.

## Ako Components

Here is a list of the components provided by Ako.  
***NOTE:** This list might not be complete.*

### Extensions

| Name                           | Description                                       | Since |
|--------------------------------|---------------------------------------------------|-------|
| BuildContext.showSnackBar      | Shows a Snackbar with default white on green text | 0.0.1 |
| BuildContext.showErrorSnackBar | Shows a Snackbar with default white on red text   | 0.0.1 |

### Utils

| Name    | Description           | Since |
|---------|-----------------------|-------|
| AkoPair | A simple `Pair<A, B>` | 0.6.0 |

### Widgets

| Name                    | Description                                                                                | Since |
|-------------------------|--------------------------------------------------------------------------------------------|-------|
| AkoShowEither           | A Widget to show either one or another widget based on a condition (build-time evaluation) | 0.0.1 |
| AkoShowWhen             | A Widget similar to Visibility (build-time evaluation)                                     | 0.0.1 |
| AkoResponsiveLayout     | A Widget for building Mobile, Tablet and Desktop UIs                                       | 0.0.1 |
| AkoFakeSearchField      | Button that looks like a Search field                                                      | 0.1.0 |
| AkoFuture               | A FutureBuilder with an easier API                                                         | 0.2.0 |
| AkoFutureOptional       | AkoFuture with Optional<T> as type                                                         | 0.2.0 |
| AkoSearchField          | Prebuild Search field (used by AkoSearchSelectionSheet)                                    | 0.6.0 |
| AkoSearchSelectionSheet | 'TripAdvisor Search Filter'-like multi-selection bottom sheet                              | 0.6.0 |
| AkoBadge                | A simple Badge Widget                                                                      | 0.6.0 |
| AkoSearchFilterSheet    | 'TripAdvisor Filter'-like bottom sheet                                                     | 0.7.0 |
| AkoImageSourceSheet     | A bottom sheet where the user selects one of two image sources                             | 0.7.0 |

### External Dependencies

| Name     | Description                                                              | Since |
|----------|--------------------------------------------------------------------------|-------|
| Optional | Ako depends on `optional` and exports it via `package:ako/optional.dart` | 0.2.0 |

# License

Copyright 2023 the Ako authors (https://pub.dev/packages/ako).  
Ako is free software licensed under the Mozilla Public License, version 2.0.
