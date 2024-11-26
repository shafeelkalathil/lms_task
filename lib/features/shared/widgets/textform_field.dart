
import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.suffixOnTap,
    this.prefixOnTap,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    super.key,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? suffixOnTap;
  final VoidCallback? prefixOnTap;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: validator != null ? null : 44,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: subtitle2.copyWith(color: silverChalice.shade800),
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: readOnly,
          fillColor: readOnly ? silverChalice.shade100 : Colors.transparent,
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: suffixOnTap,
                    child: suffixIcon,
                  ),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: prefixOnTap,
                    child: prefixIcon,
                  ),
                )
              : null,
        ),
        onTap: onTap,
        readOnly: readOnly,
      ),
    );
  }
}
