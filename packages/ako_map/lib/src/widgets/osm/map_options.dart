// Copyright 2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

/// AkoOsmMapOptions provides configuration for AkoOsmMap.
class AkoOsmMapOptions {
  final bool allowBottomSheet;
  final String textSheetTitle;
  final String textMapNotFound;
  final String textMapOpenSheet;

  AkoOsmMapOptions({
    this.allowBottomSheet = true,
    this.textSheetTitle = "Map",
    this.textMapNotFound = "Map could not be loaded.",
    this.textMapOpenSheet = "double-tap to open map",
  });
}
