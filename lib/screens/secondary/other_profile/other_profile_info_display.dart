import 'package:fitness_app/supabase/user_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        await UserMethods().doesFollowUser(widget.curId, widget.followedId);

    setState(() {
      _followed = res;
    });
    stopLoading();
  }

  void followUser() async {
    // Follow the user
    await UserMethods().followUser(widget.followedId, widget.curId);

    setState(() {
      _followed = true;
    });
  }

  // Not implemented
  void unfollowUser() async {
    // Unfollow the user
    await UserMethods().unfollowUser(widget.followedId, widget.curId);

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
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: theme.colorScheme.brightness == Brightness.light ? 6 : 0,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(25),
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
              const SizedBox(height: 12),
              _userTags(theme, 'Beginner', 'Powerlifter', 'UCF'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _button(
                    theme,
                    _followed ? 'Remove friend' : 'Add friend',
                    width,
                    _followed ? false : true,
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
            ],
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
      onTap: () {
        if (text == 'Add friend') {
          followUser();
        } else if (text == 'Remove friend') {
          unfollowUser();
        }
      },
      child: Container(
        width: (width - 80) * 0.5,
        height: 45,
        decoration: BoxDecoration(
          color: _isLoading
              ? theme.colorScheme.surface
              : isPrimary
                  ? _followed
                      ? theme.colorScheme.onBackground.withOpacity(0.07)
                      : theme.colorScheme.primary
                  : theme.colorScheme.onBackground.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Text(
                  text,
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: isPrimary
                          ? _followed
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

Widget _userTags(
    ThemeData theme, String expLevel, String lifterType, String gymName) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.onBackground.withOpacity(0.07),
              borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            child: Text(expLevel,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary,
                )),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.onBackground.withOpacity(0.07),
              borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            child: Text(lifterType,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary,
                )),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.onBackground.withOpacity(0.07),
              borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            child: Text(gymName,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary,
                )),
          ),
        ),
      ],
    ),
  );
}

Widget _profilePicDisplay(String photoUrl, ThemeData theme) {
  return CircleAvatar(
    radius: 45,
    backgroundImage: NetworkImage(photoUrl),
    backgroundColor: theme.scaffoldBackgroundColor,
  );
}
