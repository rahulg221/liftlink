import 'package:fitness_app/layouts/mobile_screen_layout.dart';
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

  // Placeholders
  int likeCount = 16;
  int commentCount = 3;
  bool personalRecord = true;

  void getInfo() {
    username = widget.data.username;
    profilePic = widget.data.profilePic;
    postPic = widget.data.postPic;
    caption = widget.data.caption;
    uid = widget.data.uid;

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
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        UtilMethods.navigateTo(
                          uid == userProvider.getUser.uid
                              ? const MobileScreenLayout()
                              : OtherProfileScreen(uid: uid),
                          context,
                        );
                      },
                      child: CircleAvatar(
                        radius: 17,
                        backgroundImage: NetworkImage(profilePic),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(username, style: theme.textTheme.bodyMedium),
                              Text(createdAt,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withOpacity(0.7)))
                            ],
                          )),
                    ),
                    personalRecord
                        ? ElevatedButton.icon(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.medal,
                                color: theme.colorScheme.primary, size: 18),
                            label: Text('PR',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              elevation: 0,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              GestureDetector(
                onDoubleTap: () {},
                child: SizedBox(
                  height: height * 0.5,
                  width: width - 32,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(postPic, fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.solidHeart,
                          color: theme.colorScheme.primary, size: 20),
                      label: Text('$likeCount',
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 0,
                      ),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                      onPressed: () {
                        UtilMethods.navigateTo(
                            CommentsScreen(data: widget.data), context);
                      },
                      icon: FaIcon(FontAwesomeIcons.solidComment,
                          color: theme.colorScheme.primary, size: 20),
                      label: Text('$commentCount',
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 0,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    ElevatedButton.icon(
                      onPressed: () {
                        UtilMethods.showSnackBar(
                            '$username has a consistency score of $streak!',
                            context);
                      },
                      icon: FaIcon(FontAwesomeIcons.boltLightning,
                          color: theme.colorScheme.primary, size: 20),
                      label: Text('$streak',
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
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
                                        .withOpacity(0.8))),
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
