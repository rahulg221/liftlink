import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfoDisplay extends StatefulWidget {
  final String username;
  final String photoUrl;
  final int followerCount;
  final int followingCount;
  final int activeStreak;
  final String bio;
  final bool isCurrentUser;

  const UserInfoDisplay({
    Key? key,
    required this.username,
    required this.photoUrl,
    required this.followerCount,
    required this.followingCount,
    required this.activeStreak,
    required this.bio,
    required this.isCurrentUser,
  }) : super(key: key);

  @override
  _UserInfoDisplayState createState() => _UserInfoDisplayState();
}

class _UserInfoDisplayState extends State<UserInfoDisplay> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 32, right: 32),
      child: Column(
        children: [
          _profilePicDisplay(widget.photoUrl, widget.isCurrentUser, theme),
          const SizedBox(height: 12),
          Text('@${widget.username}',
              style: theme.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
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
                widget.isCurrentUser ? 'Edit profile' : 'Follow',
                width,
                widget.isCurrentUser ? false : true,
              ),
              const SizedBox(width: 8),
              _button(
                theme,
                widget.isCurrentUser ? 'Share profile' : 'Message',
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
    return Container(
      width: (width - 100) * 0.5,
      height: 45,
      decoration: BoxDecoration(
        color:
            isPrimary ? theme.colorScheme.primary : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(
              color: isPrimary ? Colors.white : theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Widget _profilePicDisplay(
    String photoUrl, bool isCurrentUser, ThemeData theme) {
  return Stack(
    alignment: Alignment.center,
    children: [
      CircleAvatar(
        radius: 64,
        backgroundImage: NetworkImage(photoUrl),
      ),
      isCurrentUser
          ? Positioned(
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
                      color: Colors.black,
                      size: 15,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            )
          : Container(),
    ],
  );
}
