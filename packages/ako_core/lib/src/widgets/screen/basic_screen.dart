// Copyright 2023-2025 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoBasicScreen is a simple container widget that provides a padding around its child.
class AkoBasicScreen extends StatelessWidget {
  const AkoBasicScreen({
    super.key,
    required this.child,
    this.contentPadding = const EdgeInsets.all(16.0),
  });

  final Widget child;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: child,
    );
  }
}
