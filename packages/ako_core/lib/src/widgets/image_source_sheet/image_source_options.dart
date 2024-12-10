// Copyright 2023-2025 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'image_source_style.dart';

typedef AkoImageSourceAction = void Function();

/// AkoImageSourceOptions is a wrapper for arguments to [AkoImageSourceSheet]
class AkoImageSourceOptions {
  AkoImageSourceStyle? customStyle;
  Widget galleryActionText;
  Icon galleryActionIcon;
  AkoImageSourceAction galleryAction;
  Widget cameraActionText;
  Icon cameraActionIcon;
  AkoImageSourceAction cameraAction;

  AkoImageSourceOptions({
    required this.galleryAction,
    required this.cameraAction,
    this.galleryActionText = const Text("Gallery"),
    this.galleryActionIcon = const Icon(
      Icons.photo_library,
      size: 40,
    ),
    this.cameraActionText = const Text("Camera"),
    this.cameraActionIcon = const Icon(
      Icons.camera,
      size: 40,
    ),
    this.customStyle,
  });

  AkoImageSourceStyle get style => customStyle ?? AkoImageSourceStyle();
}
