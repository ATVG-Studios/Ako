// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako_map/src/widgets/osm/bottom_sheet_options.dart';
import 'package:flutter/material.dart';

export 'bottom_sheet_options.dart';

/// AkoOsmBottomSheet is shows a OSMFlutter Map inside of a resizable bottom sheet.
class AkoOsmBottomSheet {
  final AkoOsmBottomSheetOptions options;
  AkoOsmBottomSheet({required this.options});

  Future<T?> showBottomSheet<T>(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: false,
      enableDrag: false,
      useSafeArea: true,
      builder: (context) {
        return BottomSheet(
          onClosing: () {
            Navigator.of(context).pop();
          },
          enableDrag: false,
          showDragHandle: false,
          dragHandleSize: const Size(0, 0),
          builder: (context) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 13,
                    right: 13,
                    top: 0,
                    bottom: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(options.textMapTitle),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: options.map,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
