// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoSearchFilterOptionsStyle is a wrapper for style to [AkoSearchFilterSheet]
class AkoSearchFilterOptionsStyle {
  Color topDragIndicatorColor;
  Color? bottomSheetBackgroundColor;
  Color badgeBackgroundColor;
  RoundedRectangleBorder bottomSheetShape;
  BorderSide bottomButtonSeparator;
  EdgeInsets bottomButtonPadding;
  ButtonStyle? clearButtonStyle;
  ButtonStyle? submitButtonStyle;

  AkoSearchFilterOptionsStyle({
    this.topDragIndicatorColor = Colors.grey,
    this.badgeBackgroundColor = Colors.grey,
    this.bottomSheetBackgroundColor,
    this.bottomButtonPadding = const EdgeInsets.all(8.0),
    this.bottomButtonSeparator = const BorderSide(color: Colors.grey, width: 1),
    this.bottomSheetShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    this.clearButtonStyle,
    this.submitButtonStyle,
  });
}
