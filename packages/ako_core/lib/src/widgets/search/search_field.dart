// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// AkoSearchFieldOptions is a wrapper for arguments to [AkoSearchField]
class AkoSearchFieldOptions {
  AkoSearchFieldStyle? customStyle;
  Function(String)? onInputChanged;
  String searchHintText;

  AkoSearchFieldOptions({
    this.customStyle,
    this.onInputChanged,
    this.searchHintText = "Search",
  });

  AkoSearchFieldStyle get style => customStyle ?? AkoSearchFieldStyle();
}

/// AkoSearchFieldStyle is a wrapper for style of [AkoSearchField]
class AkoSearchFieldStyle {
  EdgeInsets paddingAroundField;
  EdgeInsets contentPadding;
  Color fieldCursorColor;
  Color? fieldFillColor;
  Color fieldClearIconColor;
  BorderRadius inputBorderRadius;
  BorderSide inputBorderStyle;

  AkoSearchFieldStyle({
    this.paddingAroundField = const EdgeInsets.all(12.0),
    this.contentPadding = const EdgeInsets.only(right: 15),
    this.fieldCursorColor = Colors.black,
    this.fieldFillColor,
    this.fieldClearIconColor = Colors.black,
    this.inputBorderRadius = const BorderRadius.all(Radius.circular(20)),
    this.inputBorderStyle = const BorderSide(width: 1, color: Colors.grey),
  });
}

/// AkoSearchField implements a simple search field
class AkoSearchField extends StatefulWidget {
  const AkoSearchField({super.key, required this.options});

  final AkoSearchFieldOptions options;

  @override
  State<AkoSearchField> createState() => _AkoSearchFieldState();
}

class _AkoSearchFieldState extends State<AkoSearchField> {
  final _controller = TextEditingController();

  void _onClearTap() {
    _controller.clear();
    widget.options.onInputChanged?.call("");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.options.style.paddingAroundField,
      child: TextFormField(
        controller: _controller,
        cursorColor: widget.options.style.fieldCursorColor,
        onChanged: (value) {
          widget.options.onInputChanged?.call(value);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.options.style.fieldFillColor,
          contentPadding: widget.options.style.contentPadding,
          hintText: widget.options.searchHintText,
          border: OutlineInputBorder(
            borderSide: widget.options.style.inputBorderStyle,
            borderRadius: widget.options.style.inputBorderRadius,
          ),
          prefixIcon: const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
          ),
          suffixIcon: GestureDetector(
            onTap: _onClearTap,
            child: Icon(Icons.clear,
                color: widget.options.style.fieldClearIconColor),
          ),
        ),
      ),
    );
  }
}
