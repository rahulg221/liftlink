import 'package:fitness_app/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

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
                      backgroundImage: NetworkImage(
                          'https://yt3.ggpht.com/a/AATXAJys4iWQrsJfwRh04ebNI0eRn7Ghh4pamA57t45B=s900-c-k-c0xffffffff-no-rj-mo'),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('davidlaid123',
                                  style: theme.textTheme.bodyMedium),
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
                      icon: Icon(FontAwesomeIcons.ellipsisVertical,
                          color: ColorPalette.iconColor),
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
                      child: Image.network(
                          'https://yt3.ggpht.com/a/AATXAJys4iWQrsJfwRh04ebNI0eRn7Ghh4pamA57t45B=s900-c-k-c0xffffffff-no-rj-mo',
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {},
                      icon: Icon(FontAwesomeIcons.solidHeart,
                          color: ColorPalette.darkPrimaryColor)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.comment,
                        color: ColorPalette.iconColor),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.share,
                        color: ColorPalette.iconColor),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.bookmark,
                            color: ColorPalette.iconColor),
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
                      '231 likes',
                      style: theme.textTheme.bodySmall,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'davidlaid123',
                                style: theme.textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark ? Colors.white : Colors.black)),
                            TextSpan(
                                text: ' Sick chest day today',
                                style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'View all 200 comments',
                            style: theme.textTheme.bodySmall,
                          )),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          '2/25/2024',
                          style: theme.textTheme.bodySmall,
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
