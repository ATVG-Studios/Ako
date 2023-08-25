// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoResponsiveDevice is an Enum that can be used to identify a width.<br>
/// Any width from 0 to 480 is considered to be [mobile].<br>
/// Any width from 481 to 1024 is considered to be [tablet].<br>
/// Any width from 1025 to infinity is considered to be [desktop].<br>
/// All numbers above are inclusive.
enum AkoResponsiveDevice {
  mobile(0),
  tablet(481),
  desktop(1025);

  const AkoResponsiveDevice(this.minWidth);

  final double minWidth;

  bool isMobile() {
    return AkoResponsiveDevice.isWidthMobile(minWidth);
  }

  bool isTablet() {
    return AkoResponsiveDevice.isWidthTablet(minWidth);
  }

  bool isDesktop() {
    return AkoResponsiveDevice.isWidthDesktop(minWidth);
  }

  static bool isWidthMobile(double width) {
    return width >= AkoResponsiveDevice.mobile.minWidth;
  }

  static bool isWidthTablet(double width) {
    return width >= AkoResponsiveDevice.tablet.minWidth;
  }

  static bool isWidthDesktop(double width) {
    return width >= AkoResponsiveDevice.desktop.minWidth;
  }

  static getLayoutFromWidth(double width) {
    if (AkoResponsiveDevice.isWidthDesktop(width)) {
      return AkoResponsiveDevice.desktop;
    }
    if (AkoResponsiveDevice.isWidthTablet(width)) {
      return AkoResponsiveDevice.tablet;
    }
    if (AkoResponsiveDevice.isWidthMobile(width)) {
      return AkoResponsiveDevice.mobile;
    }
  }

  static getLayoutFromConstraints(BoxConstraints constraints) {
    return AkoResponsiveDevice.getLayoutFromWidth(constraints.maxWidth);
  }

  static getLayoutFromContext(BuildContext context) {
    return AkoResponsiveDevice.getLayoutFromWidth(
        MediaQuery.of(context).size.width);
  }

  static getForConstraint(BoxConstraints constraints,
      {mobile, tablet, desktop}) {
    final layout = AkoResponsiveDevice.getLayoutFromConstraints(constraints);
    return AkoResponsiveDevice.getForLayout(layout,
        mobile: mobile, tablet: tablet, desktop: desktop);
  }

  static getForContext(BuildContext context, {mobile, tablet, desktop}) {
    final layout = AkoResponsiveDevice.getLayoutFromContext(context);
    return AkoResponsiveDevice.getForLayout(layout,
        mobile: mobile, tablet: tablet, desktop: desktop);
  }

  static getForLayout(AkoResponsiveDevice layout, {mobile, tablet, desktop}) {
    if (layout.isDesktop()) {
      return desktop;
    }
    if (layout.isTablet()) {
      return tablet;
    }
    if (layout.isMobile()) {
      return mobile;
    }
  }
}
