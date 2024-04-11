import 'dart:ui';

import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;
  final String text;

  const LargeButton({
    Key? key,
    required this.isLoading,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          color: theme.scaffoldBackgroundColor,
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            width: width - 32,
            height: 55,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(text,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontVariations: const <FontVariation>[
                      FontVariation('wght', 600),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
