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

## [0.9.0] - 2024-08-13

### Added
* `tryOptionalOrElse` helper to resolve a optional future, catching exceptions
* `tryOrElse` helper to resolve a future, catching exceptions
* `fetchJsonAsOptional` helper to fetch and parse JSON data

## [0.8.0] - 2024-07-16

### Changed
* **BREAKING** Extracted AkoFutureOptional into `ako_optional` package

Going forward, this CHANGELOG only contains changes of the Ako Optional package.

## [0.5.0] - 2023-08-17

### Changed
* **BREAKING** Replaced all widgets with builders

## [0.4.0] - 2023-08-17

### Changed
* **BREAKING** Replaced all widgets with builders

## [0.3.0] - 2023-07-31

### Added
- `withError` on AkoFutureOptional for error handling

## [0.2.0] - 2023-07-18

### Added
- AkoFutureOptional, a widget to simplify usage of FutureBuilder with Optionals
- The `Optional` library is added as a dependency, and exported via `package:ako_core/optional.dart`

[unreleased]: https://github.com/ATVG-Studios/Ako/compare/v0.9.0...HEAD
[0.9.0]: https://github.com/ATVG-Studios/Ako/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/ATVG-Studios/Ako/compare/v0.7.1...v0.8.0
[0.5.0]: https://github.com/ATVG-Studios/Ako/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/ATVG-Studios/Ako/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/ATVG-Studios/Ako/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/ATVG-Studios/Ako/compare/v0.1.2...v0.2.0
