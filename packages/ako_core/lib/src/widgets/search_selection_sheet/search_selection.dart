// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'search_selection_options.dart';
import 'search_selection_sheet.dart';

export 'search_selection_field.dart';
export 'search_selection_options.dart';
export 'search_selection_sheet.dart';
export 'search_selection_style.dart';

/// AkoSearchSelection is a way to launch the [AkoSearchSelectionSheet] with [AkoSearchSelectionOptions]
class AkoSearchSelection {
  AkoSearchSelectionOptions options;

  AkoSearchSelection({required this.options});

  Future<T?> showBottomSheet<T>(BuildContext context) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: options.style.bottomSheetShape,
      backgroundColor: options.style.bottomSheetBackgroundColor,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AkoSearchSelectionSheet(
              options: options,
            );
          },
        );
      },
    );
  }
}
