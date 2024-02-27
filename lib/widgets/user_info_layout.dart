import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfoLayout extends StatefulWidget {
  final String username;
  final String photoUrl;
  final int followerCount;
  final int followingCount;
  final int activeStreak;
  final String bio;

  const UserInfoLayout(
      {Key? key,
      required this.username,
      required this.photoUrl,
      required this.followerCount,
      required this.followingCount,
      required this.activeStreak,
      required this.bio})
      : super(key: key);

  @override
  _UserInfoLayoutState createState() => _UserInfoLayoutState();
}

class _UserInfoLayoutState extends State<UserInfoLayout> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 75.0, left: 30, right: 30),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(widget.photoUrl),
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
                        color: Colors.black,
                        size: 15,
                      ),
                      onPressed: () {
                        // Define what happens when the button is pressed
                      },
                      padding: EdgeInsets
                          .zero, // Removes default padding around the icon button
                      constraints:
                          const BoxConstraints(), // Removes default size constraints
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text('@${widget.username}',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          // Followers, Following, and Streak rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Followers
              Column(
                children: [
                  Text('${widget.followerCount}',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text('followers', style: theme.textTheme.bodyMedium),
                ],
              ),
              // Following
              Column(
                children: [
                  Text('${widget.followingCount}',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text('following', style: theme.textTheme.bodyMedium),
                ],
              ),
              // Streak
              Column(
                children: [
                  Text('${widget.activeStreak}',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text('streak', style: theme.textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          // Edit Profile and Share Profile buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(theme, 'Edit profile'),
              _buildButton(theme, 'Share profile'),
            ],
          ),
          SizedBox(height: 20),
          Text(widget.bio, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildButton(ThemeData theme, String text) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onSurface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
