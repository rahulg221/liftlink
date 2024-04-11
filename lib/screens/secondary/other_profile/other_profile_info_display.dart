import 'package:fitness_app/reusable_components/custom_container.dart';
import 'package:fitness_app/supabase/user_methods.dart';
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

  int curPts = 900;
  int totalPts = 1000;

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
    setState(() {
      _followed = true;
    });

    // Follow the user
    await UserMethods().followUser(widget.followedId, widget.curId);
  }

  // Not implemented
  void unfollowUser() async {
    setState(() {
      _followed = false;
    });
    // Unfollow the user
    await UserMethods().unfollowUser(widget.followedId, widget.curId);
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

    return CustomContainer(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(widget.photoUrl),
                    backgroundColor: theme.scaffoldBackgroundColor,
                  ),
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
                onTap: () {
                  if (!_followed) {
                    followUser();
                  } else if (_followed) {
                    unfollowUser();
                  }
                },
                child: Container(
                  width: width * 0.4,
                  height: 45,
                  decoration: BoxDecoration(
                    color: _isLoading
                        ? theme.colorScheme.onBackground.withOpacity(0.05)
                        : _followed
                            ? theme.colorScheme.onBackground.withOpacity(0.05)
                            : theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Text(
                            _followed ? 'Remove Friend' : 'Add Friend',
                            style: theme.textTheme.bodySmall!.copyWith(
                                color: _followed
                                    ? theme.colorScheme.onSurface
                                    : theme.colorScheme.onPrimary,
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
}
