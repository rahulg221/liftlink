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
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: theme.colorScheme.brightness == Brightness.light ? 6 : 0,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _profilePicDisplay(widget.photoUrl, theme),
                    const SizedBox(width: 25),
                    _infoDisplay(theme, 'flics', '0'),
                    _infoDisplay(theme, 'friends', '${widget.followerCount}'),
                    _infoDisplay(theme, 'goals', '0'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.username,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.bio, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*
                    _button(
                      theme,
                      'Edit profile',
                      width,
                      false,
                    ),
                    const SizedBox(width: 8),
                    _button(
                      theme,
                      'Share profile',
                      width,
                      false,
                    ),*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoDisplay(
    ThemeData theme,
    String text,
    String count,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(count,
              style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary)),
          const SizedBox(width: 5),
          Text(text,
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7))),
        ],
      ),
    );
  }

  Widget _button(
    ThemeData theme,
    String text,
    double width,
    bool isPrimary,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: (width - 80) * 0.5,
        height: 45,
        decoration: BoxDecoration(
          color: isPrimary
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.bodySmall!.copyWith(
                color: isPrimary
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
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
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 13,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );
}
