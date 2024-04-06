import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadSliders extends StatefulWidget {
  UploadSliders({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadSliders> createState() => _UploadSlidersState();
}

class _UploadSlidersState extends State<UploadSliders> {
  bool _pr = false;
  bool _weightGain = false;
  bool _weightLoss = false;
  bool _friendsOnly = false;
  bool _savePost = false;

  double scale = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.medal,
                color: theme.colorScheme.onSurface.withOpacity(0.7), size: 18),
            const SizedBox(width: 12),
            Text('Personal Record',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: scale,
              child: Switch(
                value: _pr,
                onChanged: (value) {
                  setState(() {
                    _pr = value;
                  });
                },
                activeTrackColor: theme.colorScheme.primary,
                activeColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1,
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.arrowTrendDown,
                color: theme.colorScheme.onSurface.withOpacity(0.7), size: 18),
            const SizedBox(width: 12),
            Text('Weight loss',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: scale,
              child: Switch(
                value: _weightLoss,
                onChanged: (value) {
                  setState(() {
                    _weightLoss = value;
                  });
                },
                activeTrackColor: theme.colorScheme.primary,
                activeColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1,
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.arrowTrendUp,
                color: theme.colorScheme.onSurface.withOpacity(0.7), size: 18),
            const SizedBox(width: 12),
            Text('Weight gain',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: scale,
              child: Switch(
                value: _weightGain,
                onChanged: (value) {
                  setState(() {
                    _weightGain = value;
                  });
                },
                activeTrackColor: theme.colorScheme.primary,
                activeColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1,
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.userGroup,
                color: theme.colorScheme.onSurface.withOpacity(0.7), size: 18),
            const SizedBox(width: 12),
            Text('Followers only',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: scale,
              child: Switch(
                value: _friendsOnly,
                onChanged: (value) {
                  setState(() {
                    _friendsOnly = value;
                  });
                },
                activeTrackColor: theme.colorScheme.primary,
                activeColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1,
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.cloudArrowDown,
                color: theme.colorScheme.onSurface.withOpacity(0.7), size: 18),
            const SizedBox(width: 12),
            Text('Save to profile',
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7))),
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: scale,
              child: Switch(
                value: _savePost,
                onChanged: (value) {
                  setState(() {
                    _savePost = value;
                  });
                },
                activeTrackColor: theme.colorScheme.primary,
                activeColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
