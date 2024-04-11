import 'dart:ui';

import 'package:fitness_app/reusable_components/custom_container.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _profilePicDisplay(widget.photoUrl, theme),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@${widget.username}',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: width * 0.5,
                    child: Text(widget.bio,
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color:
                                theme.colorScheme.onSurface.withOpacity(0.7)),
                        softWrap: true),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onBackground.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Edit profile',
                        style: theme.textTheme.bodySmall!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onBackground.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Share profile',
                        style: theme.textTheme.bodySmall!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$curPts/$totalPts pts',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.7),
                    fontVariations: const <FontVariation>[
                      FontVariation('wght', 350),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  minHeight: 12,
                  value: (curPts / totalPts),
                  semanticsLabel: 'Progress indicator',
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'lvl. 9',
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.7),
                        fontVariations: const <FontVariation>[
                          FontVariation('wght', 350),
                        ],
                      ),
                    ),
                    Text(
                      'lvl. 10',
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.7),
                        fontVariations: const <FontVariation>[
                          FontVariation('wght', 350),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),*/
        ],
      ),
    );
  }

  Widget _profilePicDisplay(String photoUrl, ThemeData theme) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(photoUrl),
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
                  color: theme.scaffoldBackgroundColor,
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
                icon: const Icon(
                  FontAwesomeIcons.pen,
                  color: Colors.white,
                  size: 12,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
