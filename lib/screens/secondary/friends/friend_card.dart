import 'dart:ui';

import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendCard extends StatefulWidget {
  final String username;
  final String profilePicUrl;
  final String userId2;

  const FriendCard(
      {Key? key,
      required this.username,
      required this.profilePicUrl,
      required this.userId2})
      : super(key: key);
  @override
  _FriendCardState createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  UtilMethods.navigateTo(
                      OtherProfileScreen(uid: widget.userId2), context);
                },
                child: CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(widget.profilePicUrl)),
              ),
              const SizedBox(width: 16),
              Text(widget.username,
                  style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Accept friend request
                  UserMethods()
                      .acceptFriend(userProvider.getUser.uid, widget.userId2);
                },
                child: Container(
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: Text(
                      'Accept',
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontVariations: const <FontVariation>[
                            FontVariation('wght', 550)
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
              thickness: 1.5,
              color: theme.colorScheme.onSurface.withOpacity(0.1)),
        ],
      ),
    );
  }
}
