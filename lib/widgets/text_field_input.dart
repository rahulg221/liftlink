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
    final _theme = Theme.of(context);

    Color _fillColor = _theme.brightness == Brightness.dark
        ? ColorPalette.darkSurfaceColor
        : ColorPalette.lightSurfaceColor;

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(16),
        filled: true,
        fillColor: _fillColor,
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      style: _theme.textTheme.bodySmall,
    );
  }
}
