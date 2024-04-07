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
            color: theme.iconTheme.color!.withOpacity(0.5));
      } else if (hintText.contains('Username')) {
        return Icon(Icons.person,
            color: theme.iconTheme.color!.withOpacity(0.5));
      } else if (hintText.contains('Bio')) {
        return Icon(Icons.edit, color: theme.iconTheme.color!.withOpacity(0.5));
      } else if (isPassword) {
        return Icon(Icons.lock, color: theme.iconTheme.color!.withOpacity(0.5));
      }

      return null;
    }

    return TextField(
      textAlign: TextAlign.start,
      textAlignVertical: textInputType == TextInputType.multiline
          ? TextAlignVertical.top
          : TextAlignVertical.center,
      maxLines: textInputType == TextInputType.multiline ? null : 1,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall!
            .copyWith(color: theme.colorScheme.onSurface),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: textInputType == TextInputType.multiline
            ? const EdgeInsets.only(left: 20, right: 8, top: 20, bottom: 80)
            : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        filled: true,
        fillColor: theme.colorScheme.onSurface.withOpacity(0.07),
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
      style: theme.textTheme.bodySmall!
          .copyWith(color: theme.colorScheme.onSurface),
    );
  }
}
