import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../utils/styles/text_style.dart';

class AppTextFromFieldTheme {
  AppTextFromFieldTheme._();

  static InputDecorationTheme lightDecoration = InputDecorationTheme(
    errorMaxLines: 3,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
    prefixIconColor: silverChalice.shade300,
    suffixIconColor: silverChalice.shade300,
    labelStyle: subtitle2.copyWith(color: silverChalice.shade300),
    hintStyle: subtitle2.copyWith(color: silverChalice.shade300),
    errorStyle: subtitle2.copyWith(color: silverChalice.shade300),
    floatingLabelStyle: subtitle2.copyWith(color: silverChalice.shade300),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: silverChalice.shade100),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: silverChalice.shade100),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: silverChalice.shade100),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );
}
