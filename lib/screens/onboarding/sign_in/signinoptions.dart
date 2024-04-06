import 'package:flutter/material.dart';
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
            icon: FaIcon(FontAwesomeIcons.google,
                color: theme.colorScheme.onBackground),
            label: Text('Sign in with Google',
                style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onBackground)),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: BorderSide(
                    color: theme.colorScheme.onBackground.withOpacity(0.3),
                    width: 1.5),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 225,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle sign in with Apple
            },
            icon: FaIcon(FontAwesomeIcons.apple,
                color: theme.colorScheme.onBackground),
            label: Text('Sign in with Apple',
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w600)),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: BorderSide(
                    color: theme.colorScheme.onBackground.withOpacity(0.3),
                    width: 1.5),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}
