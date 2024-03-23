import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/screens/comment_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  final Post data;

  const PostCard({super.key, required this.data});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  String username = '';
  String profilePic = '';
  String postPic = '';
  String caption = '';
  int streak = 0;
  String createdAt = '';

  int likeCount = 1934;
  int commentCount = 95;

  String getFormattedDate(DateTime parsedDate) {
    final DateTime now = DateTime.now();
    final int differenceInMinutes = now.difference(parsedDate).inMinutes;

    if (differenceInMinutes < 1) {
      return 'Just now';
    } else if (differenceInMinutes < 60) {
      return '$differenceInMinutes mins ago';
    } else if (differenceInMinutes < 1440) {
      final int hours = differenceInMinutes ~/ 60;
      return '$hours hrs ago';
    } else {
      final int days = differenceInMinutes ~/ 1440;
      return '$days days ago';
    }
  }

  void getInfo() {
    username = widget.data.username;
    profilePic = widget.data.profilePic;
    postPic = widget.data.postPic;
    caption = widget.data.caption;

    final DateTime parsedDate = DateTime.parse(widget.data.createdAt);
    final String formattedDate = getFormattedDate(parsedDate);

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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ).copyWith(right: 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(profilePic),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(username, style: theme.textTheme.bodyMedium),
                              Text(createdAt, style: theme.textTheme.bodySmall!)
                            ],
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        UtilMethods.showSnackBar(
                            'Your streak is how many days you have gone to the gym without missing more than one day in a row.',
                            context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.bolt,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text('$streak', style: theme.textTheme.bodyMedium),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              Stack(
                children: [
                  GestureDetector(
                    onDoubleTap: () async {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.5,
                          width: width - width * 0.06,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(postPic, fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.45,
                            left: width * 0.1,
                            right: width * 0.05,
                            bottom: height * 0.02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Handle sign in with Apple
                                },
                                icon: FaIcon(FontAwesomeIcons.heart,
                                    color: theme.colorScheme.primary, size: 20),
                                label: Text('$likeCount',
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: theme.colorScheme.primary)),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton.icon(
                                onPressed: () {
                                  UtilMethods.navigateTo(
                                      CommentsScreen(snap: widget.data),
                                      context);
                                },
                                icon: FaIcon(FontAwesomeIcons.comment,
                                    color: theme.colorScheme.primary, size: 20),
                                label: Text('$commentCount',
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: theme.colorScheme.primary)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: username,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: ' $caption',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(0.7))),
                          ],
                        ),
                      ),
                    ),
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
