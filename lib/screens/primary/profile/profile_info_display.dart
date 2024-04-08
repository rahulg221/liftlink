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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isDark = theme.colorScheme.brightness == Brightness.dark;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: isDark ? 0 : 6,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: isDark
                  ? theme.colorScheme.onBackground.withOpacity(0.3)
                  : Colors.transparent,
              width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _profilePicDisplay(widget.photoUrl, theme),
                  const SizedBox(width: 16),
                  Column(
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
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.7)),
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: (width - 64) * 0.62,
                      height: 45,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
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
                  const SizedBox(width: 8),
                  Container(
                    width: (width - 64) * 0.32,
                    height: 45,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.shareNodes,
                          ),
                          color: theme.colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePicDisplay(String photoUrl, ThemeData theme) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 40,
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
                  color: theme.colorScheme.secondary,
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
