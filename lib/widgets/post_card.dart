import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String username = 'davidlaid321';
  String photoUrl = dummyImage;
  String caption = 'Sick chest day today';
  String date = '12/25/24';
  int likeCount = 25;
  int commentCount = 12;

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
                      backgroundImage: NetworkImage(dummyImage),
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                ]
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          // Define what happens when you tap this item
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                      ),
                                    )
                                    .toList(), // Convert the Iterable returned by map to a List
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.ellipsisVertical,
                      ),
                    )
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
                      child: Image.network(photoUrl, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {},
                      icon:
                          Icon(FontAwesomeIcons.solidHeart, color: Colors.red)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.comment,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.bookmark,
                        ),
                        onPressed: () {},
                      ),
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
                    Text(
                      '$likeCount likes',
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
                                text: ' ${caption}',
                                style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'View all $commentCount comments',
                            style: theme.textTheme.bodyMedium,
                          )),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          '2/25/2024',
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
