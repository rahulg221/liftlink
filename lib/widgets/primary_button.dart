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
        width: 225,
        height: 50,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: isDark
                      ? ColorPalette.darkPrimaryTextColor
                      : ColorPalette.lightPrimaryTextColor,
                ),
              )
            : Text(text,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: isDark
                      ? ColorPalette.darkPrimaryTextColor
                      : ColorPalette.lightPrimaryTextColor,
                  fontWeight: FontWeight.w600,
                )),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(26),
              ),
            ),
            color: isDark
                ? ColorPalette.darkPrimaryColor
                : ColorPalette.lightPrimaryColor),
      ),
    );
  }
}
