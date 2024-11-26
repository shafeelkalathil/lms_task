import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../utils/styles/text_style.dart';
import 'custom_theme/app_bar_theme.dart';
import 'custom_theme/expansion_tile_theme.dart';
import 'custom_theme/list_tile_theme.dart';
import 'custom_theme/text_selection_theme.dart';
import 'custom_theme/textformfield_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: orange,
    useMaterial3: true,
    fontFamily: 'Raleway',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: AppTextFromFieldTheme.lightDecoration,
    appBarTheme: CustomAppBarTheme.appBarTheme,
    expansionTileTheme: CustomExpansionTileTheme.expansionTileTheme,
    listTileTheme: CustomListTileTheme.listTileThemeData,
    textSelectionTheme: CustomTextSelectionTheme.textSelectionThemeData,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: silverChalice.shade300, width: 0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: silverChalice.shade800,
        backgroundColor: const Color(0xffffffff),
        textStyle: subtitle1,
      ),
    ),
  );
}
