// Copyright 2023-2025 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';

/// AkoPlatform provides a easy way to find out what the current device platform is.
class AkoPlatform {
  static final List<TargetPlatform> _desktopPlatforms = [
    TargetPlatform.linux,
    TargetPlatform.macOS,
    TargetPlatform.windows,
    TargetPlatform.fuchsia,
  ];
  static final List<TargetPlatform> _mobilePlatforms = [
    TargetPlatform.android,
    TargetPlatform.iOS,
  ];

  static TargetPlatform get currentPlatform => defaultTargetPlatform;
  static bool get isWeb => kIsWeb;
  static bool get isMobile =>
      !kIsWeb && _mobilePlatforms.contains(defaultTargetPlatform);
  static bool get isDesktop =>
      !kIsWeb && _desktopPlatforms.contains(defaultTargetPlatform);
  static bool get isAndroid => isPlatform(TargetPlatform.android);
  static bool get isIOS => isPlatform(TargetPlatform.iOS);

  static bool isPlatform(TargetPlatform target) {
    return !kIsWeb && defaultTargetPlatform == target;
  }
}
