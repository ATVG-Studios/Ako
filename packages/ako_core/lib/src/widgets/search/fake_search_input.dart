// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoFakeSearchField is a widget that shows a search box like button.<br>
/// [hintText] is the text shown inside the box.<br>
/// [clickAction] is a [GestureTapCallback] triggered on user tap.
class AkoFakeSearchField extends StatelessWidget {
  const AkoFakeSearchField(
      {super.key, required this.hintText, required this.clickAction});

  final String hintText;
  final GestureTapCallback clickAction;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (event) {
        clickAction.call();
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onTap: clickAction,
              enabled: false,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: clickAction,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          )),
    );
  }
}
