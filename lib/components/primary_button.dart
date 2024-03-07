import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;
  final String text;
  final bool invert;

  const PrimaryButton({
    Key? key,
    required this.isLoading,
    required this.onTap,
    required this.text,
    this.invert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 225,
        height: 50,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                    color: theme.colorScheme.onPrimary),
              )
            : Text(text,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: invert
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onPrimary,
                )),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: ShapeDecoration(
          color: invert
              ? theme.scaffoldBackgroundColor
              : theme.colorScheme.primary,
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
            side: BorderSide(
              color: invert ? theme.colorScheme.primary : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
