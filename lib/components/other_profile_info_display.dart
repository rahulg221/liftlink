import 'package:fitness_app/supabase/db_methods.dart';
import 'package:flutter/material.dart';

class OtherProfileInfoDisplay extends StatefulWidget {
  final String username;
  final String photoUrl;
  final int followerCount;
  final int followingCount;
  final int activeStreak;
  final String bio;
  final String followedId;
  final String curId;

  const OtherProfileInfoDisplay({
    Key? key,
    required this.username,
    required this.photoUrl,
    required this.followerCount,
    required this.followingCount,
    required this.activeStreak,
    required this.bio,
    required this.followedId,
    required this.curId,
  }) : super(key: key);

  @override
  _OtherProfileInfoDisplayState createState() =>
      _OtherProfileInfoDisplayState();
}

class _OtherProfileInfoDisplayState extends State<OtherProfileInfoDisplay> {
  bool _followed = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Check if the user is already followed

    doesFollow();
  }

  void doesFollow() async {
    beginLoading();
    bool res =
        await DbMethods().doesFollowUser(widget.curId, widget.followedId);

    setState(() {
      _followed = res;
    });
    stopLoading();
  }

  void followUser() async {
    // Follow the user
    await DbMethods().followUser(widget.followedId, widget.curId);

    setState(() {
      _followed = true;
    });
  }

  // Not implemented
  void unfollowUser() async {
    // Unfollow the user
    await DbMethods().unfollowUser(widget.followedId, widget.curId);

    setState(() {
      _followed = false;
    });
  }

  void beginLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

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
                _followed ? 'Unfollow' : 'Follow',
                width,
                true,
              ),
              const SizedBox(width: 8),
              _button(
                theme,
                'Message',
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
      onTap: () {
        if (text == 'Follow') {
          followUser();
        } else if (text == 'Unfollow') {
          unfollowUser();
        }
      },
      child: Container(
        width: (width - 100) * 0.5,
        height: 45,
        decoration: BoxDecoration(
          color: _isLoading
              ? theme.colorScheme.surface
              : isPrimary
                  ? _followed
                      ? theme.colorScheme.surface
                      : theme.colorScheme.primary
                  : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Text(
                  text,
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: isPrimary
                          ? Colors.white
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
  return CircleAvatar(
    radius: 55,
    backgroundImage: NetworkImage(photoUrl),
    backgroundColor: theme.scaffoldBackgroundColor,
  );
}
