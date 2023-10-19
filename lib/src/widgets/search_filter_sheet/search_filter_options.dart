// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako/ako.dart';
import 'package:flutter/material.dart';

class AkoSearchFilterOptions {
  List<AkoSearchFilterSelection> filterSelections;
  Function()? onFilterUpdated;
  AkoSearchFilterOptionsStyle? customStyle;
  AkoSearchFieldOptions? customFieldOptions;
  Widget bottomSheetTitle;
  Widget clearButtonText;
  Widget submitButtonText;
  Widget showMoreText;

  AkoSearchFilterOptions({
    required this.filterSelections,
    this.bottomSheetTitle = const Text(
      "Filter",
      style: TextStyle(fontSize: 24),
    ),
    this.clearButtonText = const Text(
      "Clear filters",
      style: TextStyle(decoration: TextDecoration.underline),
    ),
    this.showMoreText = const Text("Mehr anzeigen"),
    this.submitButtonText = const Text("Apply"),
    this.customStyle,
    this.onFilterUpdated,
    this.customFieldOptions,
  });

  AkoSearchFilterOptionsStyle get style =>
      customStyle ?? AkoSearchFilterOptionsStyle();
}
