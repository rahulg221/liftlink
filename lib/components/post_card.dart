import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/screens/comment_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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

  void getInfo() {
    username = widget.data.username;
    profilePic = widget.data.profilePic;
    postPic = widget.data.postPic;
    caption = widget.data.caption;

    final DateTime parsedDate = DateTime.parse(widget.data.createdAt);
    final String formattedDate = DateFormat('MM/dd/yy').format(parsedDate);

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
              GestureDetector(
                onDoubleTap: () async {},
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      child: Image.network(postPic, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        UtilMethods.navigateTo(
                            CommentsScreen(snap: widget.data), context);
                      },
                      icon: const Icon(FontAwesomeIcons.comment)),
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
                    Text(
                      '5 likes',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: username,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: ' $caption',
                                style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Text(
                        'View all 5 comments',
                        style: theme.textTheme.bodyMedium,
                      )),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          createdAt,
                          style: theme.textTheme.bodyMedium,
                        )),
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
