import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogButton extends StatelessWidget {
  const LogButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.primary,
        onPressed: () async {},
        child:
            Icon(FontAwesomeIcons.pencil, color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
