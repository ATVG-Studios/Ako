// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'image_source_options.dart';

/// AkoImageSourceSheet is a bottom sheet for selecting one of two image sources.
class AkoImageSourceSheet extends StatefulWidget {
  const AkoImageSourceSheet({super.key, required this.options});

  final AkoImageSourceOptions options;

  @override
  State<AkoImageSourceSheet> createState() => _AkoImageSourceSheetState();
}

class _AkoImageSourceSheetState extends State<AkoImageSourceSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.15,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 3,
                  color: widget.options.style.topDragIndicatorColor),
            ),
            Padding(
              padding: widget.options.style.bottomButtonPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        widget.options.galleryAction();
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  widget.options.style.buttonForegroundColor)),
                      child: Column(
                        children: [
                          widget.options.galleryActionIcon,
                          widget.options.galleryActionText
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        widget.options.cameraAction();
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  widget.options.style.buttonForegroundColor)),
                      child: Column(
                        children: [
                          widget.options.cameraActionIcon,
                          widget.options.cameraActionText
                        ],
                      )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
