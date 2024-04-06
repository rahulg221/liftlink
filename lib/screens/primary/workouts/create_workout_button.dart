import 'package:fitness_app/screens/secondary/create_workout/create_workout_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.primary,
        onPressed: () async {
          UtilMethods.showPartialScreen(
              const CreateSessionScreen(), context, 0.45);
        },
        child: Icon(FontAwesomeIcons.plus, color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
