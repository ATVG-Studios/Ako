# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

---

## [0.1.2] - 2023-06-14

### Changed
- Create importable splits, `package:ako/extensions.dart`, `package:ako/utils.dart` and `package:ako/widgets.dart`
- `package:ako/ako.dart` still exports all other splits for a single import.

## [0.1.1] - 2023-06-13

- No API changes

## [0.1.0] - 2023-06-13

- No API changes

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
