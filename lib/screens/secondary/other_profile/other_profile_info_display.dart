import 'package:fitness_app/supabase/user_methods.dart';
import 'package:flutter/material.dart';

class OtherProfileInfoDisplay extends StatefulWidget {
  final String username;
  final String photoUrl;
  final String bio;
  final String userId2;
  final String curId;

  const OtherProfileInfoDisplay({
    Key? key,
    required this.username,
    required this.photoUrl,
    required this.bio,
    required this.userId2,
    required this.curId,
  }) : super(key: key);

  @override
  _OtherProfileInfoDisplayState createState() =>
      _OtherProfileInfoDisplayState();
}

class _OtherProfileInfoDisplayState extends State<OtherProfileInfoDisplay> {
  String status = '';
  bool _isLoading = false;

  int curPts = 900;
  int totalPts = 1000;

  @override
  void initState() {
    super.initState();

    // Check if the user is already followed

    getFriendshipStatus();
  }

  void getFriendshipStatus() async {
    beginLoading();

    String res =
        await UserMethods().getFriendshipStatus(widget.curId, widget.userId2);

    setState(() {
      status = res;
    });

    stopLoading();
  }

  void addFriend() async {
    setState(() {
      status = 'pending';
    });

    // Add user as friend
    await UserMethods().addFriend(widget.curId, widget.userId2);
  }

  // Not implemented
  void removeFriend() async {
    setState(() {
      status = 'none';
    });

    // Remove user as friend
    await UserMethods().removeFriend(widget.curId, widget.userId2);
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

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(widget.photoUrl),
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.username,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: width - 48,
                  child: Center(
                    child: Text(widget.bio,
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color:
                                theme.colorScheme.onSurface.withOpacity(0.7)),
                        softWrap: true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (status == 'none' || status == 'denied') {
                      addFriend();
                    } else if (status == 'accepted') {
                      removeFriend();
                    }
                  },
                  child: Container(
                    width: (width - 24) * 0.46,
                    height: 45,
                    decoration: BoxDecoration(
                      color: _isLoading
                          ? theme.colorScheme.surface
                          : (status == 'accepted' || status == 'pending')
                              ? theme.colorScheme.surface
                              : theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Text(
                              status == 'none'
                                  ? 'Add friend'
                                  : status == 'accepted'
                                      ? 'Remove friend'
                                      : status == 'pending'
                                          ? 'Pending'
                                          : 'Add friend',
                              style: theme.textTheme.bodySmall!.copyWith(
                                  color: (status == 'accepted' ||
                                          status == 'pending')
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
          ],
        ),
      ),
    );
  }
}
