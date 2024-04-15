import 'dart:ui';
import 'package:fitness_app/models/comments.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  final Comment data;

  const CommentCard({Key? key, required this.data}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  String username = '';
  String profilePic = '';
  String comment = '';
  String createdAt = '';
  String uid = '';
  String curUserId = '';

  void getInfo() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    curUserId = userProvider.getUser.uid;

    username = widget.data.username;
    profilePic = widget.data.profilePic;
    comment = widget.data.comment;
    uid = widget.data.uid;

    final DateTime parsedDate = DateTime.parse(widget.data.createdAt);
    final String formattedDate = UtilMethods.getFormattedDate(parsedDate, true);

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

    return Container(
        padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profilePic),
                  radius: 20,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontVariations: const <FontVariation>[
                            FontVariation('wght', 500),
                          ],
                        )),
                    const SizedBox(height: 2),
                    Text(
                      comment,
                      style: theme.textTheme.bodySmall,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          createdAt,
                          style: theme.textTheme.bodySmall!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7),
                              fontVariations: const <FontVariation>[
                                FontVariation('wght', 300)
                              ]),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Reply',
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
