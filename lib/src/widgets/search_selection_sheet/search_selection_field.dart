// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako/ako.dart';
import 'package:flutter/material.dart';

/// AkoSearchSelectionField is a form field for a dropdown input like usage.
class AkoSearchSelectionField extends StatelessWidget {
  const AkoSearchSelectionField(
      {super.key,
      required this.textEditingController,
      required this.labelText,
      required this.options});

  final TextEditingController textEditingController;
  final String labelText;
  final AkoSearchSelectionOptions options;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Icon(Icons.keyboard_capslock),
        ),
      ),
      readOnly: true,
      onTap: () {
        AkoSearchSelection(
          options: options,
        ).showBottomSheet(context);
      },
    );
  }
}
