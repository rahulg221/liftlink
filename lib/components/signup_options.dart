import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          width: 225,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle sign in with Google
            },
            icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
            label:
                Text('Sign in with Google', style: theme.textTheme.bodySmall),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.darkGoogleButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: 225,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle sign in with Apple
            },
            icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
            label: Text('Sign in with Apple',
                style:
                    theme.textTheme.bodySmall!.copyWith(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.darkAppleButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
