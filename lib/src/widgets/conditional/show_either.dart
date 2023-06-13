// Written by the Ako Authors:
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoShowEither is a widget that shows one of two widgets based on a condition.<br>
/// When [condition] is true the [onTrue] widget is shown, when it is false the [onFalse] widget is shown.
final class AkoShowEither extends StatelessWidget {
  const AkoShowEither({Key? key, required this.condition, required this.onTrue, required this.onFalse}) : super(key: key);

  final bool condition;
  final Widget onTrue;
  final Widget onFalse;

  @override
  Widget build(BuildContext context) {
    if(condition) {
      return onTrue;
    }
    return onFalse;
  }
}
