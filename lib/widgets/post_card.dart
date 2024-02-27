import 'package:fitness_app/firebase/firestore_methods.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/comment_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/like_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final snap;

  const PostCard({super.key, required this.snap});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

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
                      backgroundImage: NetworkImage(widget.snap['profilePic']),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.snap['username'],
                                  style: theme.textTheme.bodyMedium),
                            ],
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        showSnackBar(
                            'Your streak is how many days you have gone to the gym without missing more than one day in a row.',
                            context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.bolt,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text('${userProvider.getUser.streak}',
                        style: theme.textTheme.bodyMedium),
                    SizedBox(width: 10),
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
                      child: Image.network(widget.snap['photoUrl'],
                          fit: BoxFit.cover),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isLikeAnimating ? 1.0 : 0.0,
                      child: LikeAnimation(
                        child: const Icon(Icons.favorite,
                            color: Colors.white, size: 120),
                        isAnimating: isLikeAnimating,
                        duration: const Duration(milliseconds: 400),
                        onEnd: () {
                          setState(() {
                            isLikeAnimating = false;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  LikeAnimation(
                    isAnimating:
                        widget.snap['likes'].contains(userProvider.getUser.uid),
                    smallLike: true,
                    child: IconButton(
                      onPressed: () async {
                        await FirestoreMethods().likePost(widget.snap['postId'],
                            userProvider.getUser.uid, widget.snap['likes']);
                        setState(() {
                          isLikeAnimating = true;
                        });
                      },
                      icon: widget.snap['likes']
                              .contains(userProvider.getUser.uid)
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        navigateTo(CommentsScreen(snap: widget.snap), context);
                      },
                      icon: Icon(FontAwesomeIcons.comment)),
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
                      '${widget.snap['likes'].length} likes',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.snap['username'],
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: ' ${widget.snap['caption']}',
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
                          DateFormat.yMMMd()
                              .format(widget.snap['datePublished'].toDate()),
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
