// Copyright 2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako_map/flutter_osm_plugin.dart';

/// AkoOsmBottomSheetOptions provides configuration for AkoOsmBottomSheet.
class AkoOsmBottomSheetOptions {
  final OSMFlutter map;
  final String textMapTitle;

  AkoOsmBottomSheetOptions({required this.map, this.textMapTitle = "Map"});
}
