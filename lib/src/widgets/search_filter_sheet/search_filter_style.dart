import 'package:flutter/material.dart';

class AkoSearchFilterOptionsStyle {
  Color topDragIndicatorColor;
  Color? bottomSheetBackgroundColor;
  Color badgeBackgroundColor;
  RoundedRectangleBorder bottomSheetShape;
  BorderSide bottomButtonSeparator;
  EdgeInsets bottomButtonPadding;
  ButtonStyle? clearButtonStyle;
  ButtonStyle? submitButtonStyle;

  AkoSearchFilterOptionsStyle({
    this.topDragIndicatorColor = Colors.grey,
    this.badgeBackgroundColor = Colors.grey,
    this.bottomSheetBackgroundColor,
    this.bottomButtonPadding = const EdgeInsets.all(8.0),
    this.bottomButtonSeparator = const BorderSide(color: Colors.grey, width: 1),
    this.bottomSheetShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    this.clearButtonStyle,
    this.submitButtonStyle,
  });
}
