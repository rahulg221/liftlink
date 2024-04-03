import 'package:fitness_app/models/comments.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/other_profiles_screen.dart';
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

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Row(
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
                backgroundImage: NetworkImage(profilePic),
                radius: 13,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // Use Expanded to ensure the column takes up all available space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('@$username',
                                  style: theme.textTheme.bodySmall),
                              Text(' • ',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontSize: 25)),
                              Text(createdAt, style: theme.textTheme.bodySmall),
                            ],
                          ),
                          Text(
                            comment,
                            style: theme.textTheme.bodySmall,
                            softWrap: true,
                            overflow: TextOverflow
                                .visible, // Visible overflow can be removed if wrapping is working
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'Reply',
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
