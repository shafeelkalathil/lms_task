import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class CustomTextSelectionTheme {
  CustomTextSelectionTheme._();

  static TextSelectionThemeData textSelectionThemeData = TextSelectionThemeData(
    cursorColor: orange,
    selectionColor: orange.withOpacity(0.3),
    selectionHandleColor: orange,
  );
}
