import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;
  final String text;

  const PrimaryButton({
    Key? key,
    required this.isLoading,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 275,
        height: 50,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: isDark
                      ? ColorPalette.darkPrimaryTextColor
                      : ColorPalette.lightPrimaryTextColor,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: isDark
                      ? ColorPalette.darkPrimaryTextColor
                      : ColorPalette.lightPrimaryTextColor,
                ),
              ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            color: isDark
                ? ColorPalette.darkPrimaryColor
                : ColorPalette.lightPrimaryColor),
      ),
    );
  }
}
