// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako_core/ako_core.dart';
import 'package:flutter/material.dart';

/// AkoSearchSelectionOptions is a wrapper for arguments to [AkoSearchSelectionSheet]
class AkoSearchSelectionOptions {
  Map<int, String> options;
  List<int> selectedOptions;
  Widget bottomSheetTitle;
  Widget clearButtonText;
  Widget submitButtonText;
  AkoSearchSelectionStyle? customStyle;
  AkoSearchFieldOptions? customFieldOptions;

  Function(List<int>)? onSelectionChanged;

  AkoSearchSelectionOptions(
      {this.options = const {},
      this.selectedOptions = const [],
      this.bottomSheetTitle = const Text(
        "Search",
        style: TextStyle(fontSize: 24),
      ),
      this.clearButtonText = const Text(
        "Clear filters",
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      this.submitButtonText = const Text("Apply"),
      this.customStyle,
      this.customFieldOptions,
      this.onSelectionChanged});

  AkoSearchSelectionStyle get style => customStyle ?? AkoSearchSelectionStyle();
  AkoSearchFieldOptions get fieldOptions =>
      customFieldOptions ?? AkoSearchFieldOptions();
}
