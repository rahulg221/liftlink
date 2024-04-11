import 'dart:ui';

import 'package:fitness_app/reusable_components/custom_container.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInfoDisplay extends StatefulWidget {
  final String username;
  final String photoUrl;
  final int followerCount;
  final int followingCount;
  final int activeStreak;
  final String bio;

  const ProfileInfoDisplay({
    Key? key,
    required this.username,
    required this.photoUrl,
    required this.followerCount,
    required this.followingCount,
    required this.activeStreak,
    required this.bio,
  }) : super(key: key);

  @override
  _ProfileInfoDisplayState createState() => _ProfileInfoDisplayState();
}

class _ProfileInfoDisplayState extends State<ProfileInfoDisplay> {
  int curPts = 300;
  int totalPts = 1000;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return CustomContainer(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  _profilePicDisplay(widget.photoUrl, theme),
                  const SizedBox(height: 12),
                  Text(
                    widget.username,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: width - 48,
                    child: Center(
                      child: Text(widget.bio,
                          style: theme.textTheme.bodySmall!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7)),
                          softWrap: true),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: width * 0.4,
                  height: 45,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Invite Friends',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePicDisplay(String photoUrl, ThemeData theme) {
    return Container(
      width: 122,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
          width: 3.5,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(dummyImage),
            backgroundColor: theme.scaffoldBackgroundColor,
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.plus,
                    color: theme.colorScheme.onPrimary,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
