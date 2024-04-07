import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/comments/comment_screen.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final Post data;

  const PostCard({super.key, required this.data});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
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
    postPic = widget.data.postPic;
    caption = widget.data.caption;
    postId = widget.data.postId;
    uid = widget.data.uid;
    commentCount = widget.data.commentCount;
    likeCount = widget.data.likeCount;

    final DateTime parsedDate = DateTime.parse(widget.data.createdAt);
    final String formattedDate = UtilMethods.getFormattedDate(parsedDate);

    createdAt = formattedDate;
    streak = widget.data.streak;
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

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Column(
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
                                  Text(username,
                                      style: theme.textTheme.bodyMedium),
                                  Text(
                                    '  •  ',
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  Text(createdAt,
                                      style: theme.textTheme.bodySmall),
                                ],
                              ),
                            ),
                            const FaIcon(FontAwesomeIcons.ellipsisVertical,
                                size: 16),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$caption',
                              style: theme.textTheme.bodyMedium,
                            )),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onDoubleTap: () {},
                          child: SizedBox(
                            height: height * 0.5,
                            width: width - 32,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.network(postPic, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(FontAwesomeIcons.heart,
                                    color: theme.colorScheme.primary, size: 21),
                                const SizedBox(width: 8),
                                Text(
                                  '$likeCount likes',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                UtilMethods.showPartialScreen(
                                    CommentsScreen(
                                        data: widget.data,
                                        commentCount: commentCount),
                                    context,
                                    0.75);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(FontAwesomeIcons.commentDots,
                                      color: theme.colorScheme.primary,
                                      size: 21),
                                  const SizedBox(width: 8),
                                  Text(
                                    '$commentCount comments',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
