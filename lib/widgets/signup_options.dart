import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: 'apple',
          onPressed: () {},
          backgroundColor: isDark
              ? ColorPalette.darkAppleButtonColor
              : ColorPalette.lightAppleButtonColor,
          foregroundColor: isDark
              ? ColorPalette.darkAppleTextColor
              : ColorPalette.lightAppleTextColor,
          child: Icon(FontAwesomeIcons.apple,
              color: isDark ? Colors.black : Colors.white, size: 25),
          tooltip: 'Sign in with Apple',
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          heroTag: 'facebook',
          onPressed: () {},
          backgroundColor: isDark
              ? ColorPalette.darkFacebookButtonColor
              : ColorPalette.lightFacebookButtonColor,
          foregroundColor: isDark
              ? ColorPalette.darkFacebookTextColor
              : ColorPalette.lightFacebookTextColor,
          child: const Icon(FontAwesomeIcons.facebook, size: 25),
          tooltip: 'Sign in with Facebook',
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          heroTag: 'google',
          onPressed: () {},
          backgroundColor: isDark
              ? ColorPalette.darkGoogleButtonColor
              : ColorPalette.lightGoogleButtonColor,
          foregroundColor: isDark
              ? ColorPalette.darkGoogleTextColor
              : ColorPalette.lightGoogleTextColor,
          child: const Icon(FontAwesomeIcons.google, size: 25),
          tooltip: 'Sign in with Google',
        ),
      ],
    );
  }
}
