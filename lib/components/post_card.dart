import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/comment_screen.dart';
import 'package:fitness_app/screens/other_profiles_screen.dart';
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                            radius: 21,
                            backgroundImage: NetworkImage(profilePic),
                            backgroundColor: theme.scaffoldBackgroundColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(username, style: theme.textTheme.bodyLarge),
                              Text(createdAt,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withOpacity(0.7)))
                            ],
                          ),
                        ),
                        /*
                        personalRecord
                            ? ElevatedButton.icon(
                                onPressed: () {},
                                icon: FaIcon(FontAwesomeIcons.medal,
                                    color: theme.colorScheme.secondary,
                                    size: 18),
                                label: Text('PR',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.secondary)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.secondary
                                      .withOpacity(0.4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  elevation: 10,
                                ),
                              )
                            : Container(),*/
                      ],
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$caption',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onDoubleTap: () {},
                      child: SizedBox(
                        height: height * 0.4,
                        width: width - 32,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(postPic, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(FontAwesomeIcons.heart,
                                color: theme.colorScheme.primary, size: 24),
                            const SizedBox(width: 8),
                            Text(
                              '$likeCount likes',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            UtilMethods.showPartialScreen(
                                CommentsScreen(data: widget.data),
                                context,
                                0.75);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(FontAwesomeIcons.commentDots,
                                  color: theme.colorScheme.primary, size: 24),
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
              ),
              //const SizedBox(height: 5),
            ],
          ),
        ),
        Divider(
          color: theme.colorScheme.surface,
          thickness: 1,
        ),
      ],
    );
  }
}
