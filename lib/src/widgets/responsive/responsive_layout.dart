// Written by the Ako Authors:
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../utils/responsive_device.dart';

/// AkoResponsiveLayout provides a simple mechanism to show a mobile, tablet or desktop layout.<br>
/// This widget uses a [LayoutBuilder] to get the available width for the widget,<br>
/// then [AkoResponsiveDevice] is used to decide which widget is shown.<br>
/// When one of the widgets is missing, a [Placeholder] is shown instead.
class AkoResponsiveLayout extends StatelessWidget {
  const AkoResponsiveLayout({Key? key, this.desktop, this.tablet, this.mobile}) : super(key: key);

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final layout = AkoResponsiveDevice.getLayoutFromConstraints(constraints);
          if(layout.isDesktop()) {
            return desktop ?? const Placeholder();
          }
          if(layout.isTablet()) {
            return tablet ?? const Placeholder();
          }
          return mobile ?? const Placeholder();
        },
    );
  }
}
