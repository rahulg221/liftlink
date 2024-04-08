import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadSwitches extends StatefulWidget {
  UploadSwitches({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadSwitches> createState() => _UploadSwitchesState();
}

class _UploadSwitchesState extends State<UploadSwitches> {
  bool _displayPR = false;
  bool _allowComments = false;
  bool _savePost = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.medal,
                color: theme.colorScheme.onSurface.withOpacity(0.7)),
            const SizedBox(width: 12),
            Text('Display progress',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: 1.2,
              child: Switch(
                value: _displayPR,
                onChanged: (value) {
                  setState(() {
                    _displayPR = value;
                  });
                },
                activeTrackColor: theme.colorScheme.secondary,
                activeColor: theme.colorScheme.onSecondary,
                inactiveThumbColor: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1.5,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.solidComment,
                color: theme.colorScheme.onSurface.withOpacity(0.7)),
            const SizedBox(width: 12),
            Text('Allow comments',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: 1.2,
              child: Switch(
                value: _allowComments,
                onChanged: (value) {
                  setState(() {
                    _allowComments = value;
                  });
                },
                activeTrackColor: theme.colorScheme.secondary,
                activeColor: theme.colorScheme.onSecondary,
                inactiveThumbColor: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1.5,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(FontAwesomeIcons.cloudArrowDown,
                color: theme.colorScheme.onSurface.withOpacity(0.7)),
            const SizedBox(width: 12),
            Text('Save to profile',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: 1.2,
              child: Switch(
                value: _savePost,
                onChanged: (value) {
                  setState(() {
                    _savePost = value;
                  });
                },
                activeTrackColor: theme.colorScheme.secondary,
                activeColor: theme.colorScheme.onSecondary,
                inactiveThumbColor: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1.5,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
