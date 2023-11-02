// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class AkoImageSourceStyle {
  Color topDragIndicatorColor;
  Color? bottomSheetBackgroundColor;
  Color buttonForegroundColor;
  RoundedRectangleBorder bottomSheetShape;
  BorderSide bottomButtonSeparator;
  EdgeInsets bottomButtonPadding;

  AkoImageSourceStyle({
    this.topDragIndicatorColor = Colors.grey,
    this.buttonForegroundColor = Colors.black,
    this.bottomSheetBackgroundColor,
    this.bottomButtonPadding = const EdgeInsets.all(8.0),
    this.bottomButtonSeparator = const BorderSide(color: Colors.grey, width: 1),
    this.bottomSheetShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
  });
}
