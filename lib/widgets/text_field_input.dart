import 'package:fitness_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPassword = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: isDark
              ? ColorPalette.darkSurfaceColor
              : ColorPalette.lightSurfaceColor),
      keyboardType: textInputType,
      obscureText: isPassword,
      style: theme.textTheme.bodySmall,
    );
  }
}
