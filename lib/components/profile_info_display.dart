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
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 32, right: 32),
      child: Column(
        children: [
          _profilePicDisplay(widget.photoUrl, theme),
          const SizedBox(height: 12),
          Text('@${widget.username}',
              style: theme.textTheme.headlineSmall!
                  ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _infoDisplay(theme, 'followers', '${widget.followerCount}'),
              const SizedBox(width: 8),
              _infoDisplay(theme, 'following', '${widget.followingCount}'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(widget.bio, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _infoDisplay(
    ThemeData theme,
    String text,
    String count,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(count,
              style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary)),
          const SizedBox(width: 5),
          Text(text,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.colorScheme.primary)),
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
        width: (width - 100) * 0.5,
        height: 45,
        decoration: BoxDecoration(
          color:
              isPrimary ? theme.colorScheme.primary : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium!.copyWith(
                color: isPrimary ? Colors.white : theme.colorScheme.onSurface,
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
        radius: 55,
        backgroundImage: NetworkImage(photoUrl),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      Positioned(
        bottom: -5, // Position at the bottom of the profile picture
        right: -5, // Position to the right of the profile picture
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 34,
              height: 34,
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
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 17,
              ),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    ],
  );
}
