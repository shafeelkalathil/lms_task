import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class CustomExpansionTileTheme {
  CustomExpansionTileTheme._();

  static final expansionTileTheme = ExpansionTileThemeData(
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: silverChalice.shade100),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: silverChalice.shade100),
    ),
    backgroundColor: const Color(0xfffafafa),
    iconColor: silverChalice.shade700,
    textColor: silverChalice.shade700,
    collapsedIconColor: silverChalice.shade700,
    collapsedTextColor: silverChalice.shade700,
  );
}
