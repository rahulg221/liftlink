import 'package:fitness_app/utils/color_palette.dart';
import 'package:fitness_app/utils/constants.dart';
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

    Icon? prefixIcon() {
      if (hintText.contains('Email')) {
        return Icon(Icons.email,
            size: theme.iconTheme.size,
            color: theme.iconTheme.color!.withOpacity(0.5));
      } else if (hintText.contains('Username')) {
        return Icon(Icons.person,
            size: theme.iconTheme.size,
            color: theme.iconTheme.color!.withOpacity(0.5));
      } else if (isPassword) {
        return Icon(Icons.lock,
            size: theme.iconTheme.size,
            color: theme.iconTheme.color!.withOpacity(0.5));
      }

      return null;
    }

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall!
            .copyWith(color: theme.colorScheme.onSurface),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(12),
        filled: true,
        fillColor: theme.colorScheme.surface,
        prefixIcon: prefixIcon(),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(Icons.visibility,
                    size: theme.iconTheme.size,
                    color: theme.iconTheme.color!.withOpacity(0.5)),
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
