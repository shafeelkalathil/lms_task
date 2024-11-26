import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../utils/styles/text_style.dart';

class CustomListTileTheme {
  CustomListTileTheme._();

  static ListTileThemeData listTileThemeData = ListTileThemeData(
    horizontalTitleGap: 2,
    titleTextStyle: subtitle2.copyWith(color: silverChalice.shade800),
  );
}
