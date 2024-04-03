import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/comment_screen.dart';
import 'package:fitness_app/screens/other_profiles_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SessionCard extends StatefulWidget {
  final Session data;

  const SessionCard({super.key, required this.data});

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  String username = '';
  String profilePic = '';
  String postPic = '';
  String caption = '';
  int streak = 0;
  String createdAt = '';
  String uid = '';
  String curUserId = '';
  int postId = 0;
  String gymName = 'UCF Rwc';

  // Placeholders
  int likeCount = -1;
  int commentCount = -1;
  bool personalRecord = true;

  void getInfo() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    curUserId = userProvider.getUser.uid;

    username = widget.data.username;
    profilePic = widget.data.profilePic;

    final DateTime parsedDate = DateTime.parse(widget.data.createdAt);
    final String formattedDate = UtilMethods.getFormattedDate(parsedDate);
    createdAt = formattedDate;
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isWeb ? 160 : 16.0, vertical: isWeb ? 120 : 12.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (uid != curUserId) {
                              UtilMethods.navigateTo(
                                OtherProfileScreen(uid: uid),
                                context,
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(profilePic),
                            backgroundColor: theme.scaffoldBackgroundColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            children: [
                              Text(username, style: theme.textTheme.bodyMedium),
                              Text(' • ',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontSize: 30)),
                              Text(createdAt, style: theme.textTheme.bodySmall),
                            ],
                          ),
                        ),
                        const FaIcon(FontAwesomeIcons.ellipsisVertical,
                            size: 16),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
