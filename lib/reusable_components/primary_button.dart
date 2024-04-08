import 'dart:ui';

import 'package:flutter/material.dart';

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

    return SizedBox(
      width: 235,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: theme.colorScheme.onPrimary,
              )
            : Text(text,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontVariations: const <FontVariation>[
                    FontVariation('wght', 600),
                  ],
                )),
      ),
    );
  }
}
