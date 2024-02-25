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

    Icon? prefixIcon() {
      if (hintText.contains('Email')) {
        return Icon(Icons.email, size: 20);
      } else if (hintText.contains('Username')) {
        return Icon(Icons.person, size: 20);
      } else if (isPassword) {
        return Icon(Icons.lock, size: 20);
      }

      return null;
    }

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(12),
        filled: true,
        fillColor: isDark
            ? ColorPalette.darkSurfaceColor
            : ColorPalette.lightSurfaceColor,
        prefixIcon: prefixIcon(),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(Icons.visibility, size: 20),
                onPressed: () {
                  // Implement visibility toggle functionality here later
                },
              )
            : null,
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      //style: theme.textTheme.bodySmall,
    );
  }
}
