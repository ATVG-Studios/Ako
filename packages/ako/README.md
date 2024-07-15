# Ako Flutter Widgets

Ako is a collection of generic Flutter widgets, extensions and utilities.

## Ako Packages

Ako is split into multiple packages.

Each of these packages has a different use case.

| Name         | Usage                      | Dependencies       |
|--------------|----------------------------|--------------------|
| ako          | Single-Import Meta Package | none               |
| ako_core     | Core Widgets and Utils     | none               |
| ako_optional | Widgets for Optional<T>    | ako_core, optional |

### Pre-Package-Split API Compatibility

If you are already using Ako `< 0.8.0`, then updating the Ako Package to `>= 0.8.0`  
will cause the installation of a Single-Import Meta Package.

The Package at `ako` simply depends on all other packages, and exports their public API.

We made sure that this does not effect existing applications.

### Migration to Packages

In the long term, we recommend moving from the `ako` meta package to the separate packages.

We are made the split because we wanted to make new packages that have heavier dependencies.  
As importing everything, including what you don't need, is not a great idea.

## Ako Components

Please see the components table of the other Ako packages for detail.

# License

Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).  
Ako is free software licensed under the Mozilla Public License, version 2.0.
