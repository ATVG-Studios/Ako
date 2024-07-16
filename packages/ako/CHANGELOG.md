# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

<!--
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security
-->

## [0.8.0] - 2024-07-16

### Changed
* Split Ako into separate packages, making this a meta package
* Updated ako packages to latest versions

Going forward, this CHANGELOG only contains changes of the Ako meta package.

## [0.7.1] - 2024-04-11

### Added
* showSnackBar has a new optional parameter `displayDuration` with default of 4 seconds
* showSnackBar has a new optional parameter `showCloseIcon` with default true
* showErrorSnackBar has a new optional parameter `displayDuration` with default of 4 seconds
* showErrorSnackBar has a new optional parameter `showCloseIcon` with default false

## [0.7.0] - 2023-11-14

### Added
* AkoBadgeStyle has `paddingInside` for text padding with a default of `4`
* AkoSearchSelection.showBottomSheet now returns the result of `showModalBottomSheet`
* AkoSearchFilter, a TripAdvisor inspired filter bottom sheet

### Changed
* Increase AkoBadge `largeSize` default to `26`

### Fixed
* AkoBadge now shows the empty text when the label list is empty

## [0.6.1] - 2023-09-22

### Fixed
* Implement actual search in AkoSearchSelectionSheet

## [0.6.0] - 2023-09-08

### Added
* AkoBadge, a widget for displaying a list of badges
* AkoBadgeLabel, a class used as input to AkoBadge
* AkoBadgeStyle, a class for styling AkoBadge
* AkoPair, a simple Pair class (2 element Tuple)
* AkoSearchSelectionSheet, a TripAdvisor inspired multi-select search bottom-sheet
* AkoSearchSelectionStyle, a class for styling AkoSearchSelectionSheet
* AkoSearchSelectionOptions, a class for configuring AkoSearchSelectionSheet
* AkoSearchSelection, a class to launch AkoSearchSelectionSheet with AkoSearchSelectionOptions
* AkoSearchField, a simple input field
* AkoSearchFieldStyle, a class for styling AkoSearchField
* AkoSearchFieldOptions, a class for configuring AkoSearchField

## [0.5.0] - 2023-08-17

### Changed
* **BREAKING** Replaced all widgets with builders

## [0.4.0] - 2023-08-17

### Changed
* **BREAKING** Replaced all widgets with builders

## [0.3.0] - 2023-07-31

### Added
- `withError` on AkoFuture and AkoFutureOptional for error handling

## [0.2.0] - 2023-07-18

### Added
- AkoFuture, a widget to simplify usage of FutureBuilder
- AkoFutureOptional, a widget to simplify usage of FutureBuilder with Optionals
- The `Optional` library is added as a dependency, and exported via `package:ako_core/optional.dart`

### Changed
- `child` of AkoShowWhen is now optional, an empty sized box is shown if null

## [0.1.2] - 2023-06-14

### Changed
- Create importable splits, `package:ako_core/extensions.dart`, `package:ako_core/utils.dart` and `package:ako_core/widgets.dart`
- `package:ako_core/ako_core.dart` still exports all other splits for a single import.

## [0.1.1] - 2023-06-13

- No API changes

## [0.1.0] - 2023-06-13

### Added
- AkoFakeSearchField, a widget that looks like a search field but behaves like a button

## [0.0.3] - 2023-06-13

### Added
- AkoShowSnackBar, an extension to BuildContext for showing snack bars

### Changed
- Internal change, move all files into `src/` to keep them private
- All comments have proper line breaks

## [0.0.2] - 2023-06-13

### Changed
- Internal changes

## [0.0.1] - 2023-06-13

### Added
- AkoShowEither, a widget to show one of two widgets based on a condition
- AkoShowWhen, a widget to show a widget based on a condition
- AkoResponsiveLayout, a widget to show a mobile, tablet or desktop widget based on available width
- AkoResponsiveDevice, a enum helper to decide which width is mobile, tablet or desktop

[unreleased]: https://github.com/ATVG-Studios/Ako/compare/v0.8.0...HEAD
[0.8.0]: https://github.com/ATVG-Studios/Ako/compare/v0.7.1...v0.8.0
[0.7.1]: https://github.com/ATVG-Studios/Ako/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/ATVG-Studios/Ako/compare/v0.6.1...v0.7.0
[0.6.1]: https://github.com/ATVG-Studios/Ako/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/ATVG-Studios/Ako/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/ATVG-Studios/Ako/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/ATVG-Studios/Ako/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/ATVG-Studios/Ako/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/ATVG-Studios/Ako/compare/v0.1.2...v0.2.0
[0.1.2]: https://github.com/ATVG-Studios/Ako/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/ATVG-Studios/Ako/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/ATVG-Studios/Ako/compare/v0.0.3...v0.1.0
[0.0.3]: https://github.com/ATVG-Studios/Ako/commit/784764baaaa17eaeefcdeb6367cfe4b9fc56ef7d
[0.0.2]: https://github.com/ATVG-Studios/Ako/commit/784764baaaa17eaeefcdeb6367cfe4b9fc56ef7d
[0.0.1]: https://github.com/ATVG-Studios/Ako/commit/784764baaaa17eaeefcdeb6367cfe4b9fc56ef7d
