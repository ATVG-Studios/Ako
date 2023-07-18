// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoShowWhen is a widget that either shows a child widget or an empty SizedBox.<br>
/// When [condition] is true, the [child] widget is shown, otherwise a [SizedBox] is shown.
final class AkoShowWhen extends StatelessWidget {
  const AkoShowWhen({Key? key, required this.condition, required this.child}) : super(key: key);

  final bool condition;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if(condition) {
      return child ?? const SizedBox();
    }
    return const SizedBox();
  }
}
