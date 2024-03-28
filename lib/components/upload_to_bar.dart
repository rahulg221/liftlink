import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadBar extends StatefulWidget {
  const UploadBar({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadBar> createState() => _UploadBarState();
}

class _UploadBarState extends State<UploadBar> {
  bool _followingPressed = false;
  bool _myGymPressed = false;
  bool _explorePressed = false;
  bool _closeFriendsPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.dumbbell,
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    size: 18),
                const SizedBox(width: 12),
                Text("Today's Workout",
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7))),
              ],
            )),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    _followingPressed = !_followingPressed;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 35,
                  decoration: BoxDecoration(
                    color: _followingPressed
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Push',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    _myGymPressed = !_myGymPressed;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 35,
                  decoration: BoxDecoration(
                    color: _myGymPressed
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Pull',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    _explorePressed = !_explorePressed;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 35,
                  decoration: BoxDecoration(
                    color: _explorePressed
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Legs',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    _closeFriendsPressed = !_closeFriendsPressed;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 35,
                  decoration: BoxDecoration(
                    color: _closeFriendsPressed
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Cardio',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
