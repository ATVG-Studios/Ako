# Ako Flutter Widgets

Ako is a collection of generic Flutter widgets, extensions and utilities.

## Ako Packages

Ako is split into multiple packages.

Each of these packages has a different use case.

| Name         | Usage                      | Dependencies           |
|--------------|----------------------------|------------------------|
| ako          | Single-Import Meta Package | ako_core, ako_optional |
| ako_core     | Core Widgets and Utils     | none                   |
| ako_optional | Widgets for Optional<T>    | ako_core, optional     |

### Pre-Package-Split API Compatibility

If you are already using Ako `< 0.8.0`, then updating the Ako Package to `>= 0.8.0`  
will cause the installation of a Single-Import Meta Package.

The Package at `ako` simply depends on all other packages, and exports their public API.

We made sure that this does not affect existing applications.

### Migration to Packages

While we wanted to keep Ako from having dependencies, we have found reasons why it should have dependencies.  
Mainly so that we can create a bigger collection of reusable components.

Now we have made this split so that we can have new packages with additional dependencies.

The new `ako_core` package will stay dependency-free, only requiring Flutter.  
The `ako` package as become a meta page, which depends on all other ako packages, and their respective dependencies.

In the long term, we recommend replacing the `ako` meta package with a selection of ako packages needed.

## Ako Components

Please see the components table of the other Ako packages for detail.

# License

Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).  
Ako is free software licensed under the Mozilla Public License, version 2.0.
