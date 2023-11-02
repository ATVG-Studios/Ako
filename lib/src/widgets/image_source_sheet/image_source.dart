// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'image_source_options.dart';
import 'image_source_sheet.dart';
import 'image_source_style.dart';

export 'image_source_options.dart';
export 'image_source_sheet.dart';
export 'image_source_style.dart';

class AkoImageSource {
  AkoImageSourceOptions options;
  AkoImageSource({required this.options});

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
            return AkoImageSourceSheet(
                options: options
            );
          },
        );
      },
    );
  }
}
