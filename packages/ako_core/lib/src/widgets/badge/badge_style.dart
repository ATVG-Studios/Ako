// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoBadgeStyle is used to style [AkoBadge].
class AkoBadgeStyle {
  final TextStyle textStyle;
  final Color backgroundColor;
  final double largeSize;
  final EdgeInsets paddingAround;
  final EdgeInsets paddingInside;

  AkoBadgeStyle({
    this.textStyle = const TextStyle(fontSize: 12),
    this.backgroundColor = Colors.grey,
    this.largeSize = 26,
    this.paddingAround = const EdgeInsets.all(2.0),
    this.paddingInside = const EdgeInsets.all(4.0),
  });
}
