import 'dart:ui';

import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({
    super.key,
  });

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  String username = '';
  String profilePic = '';
  String uid = '';
  String curUserId = '';
  String gymName = 'UCF Gym';
  String workoutType = '';
  String workoutLevel = '';
  String workoutTime = '';
  String workoutDay = '';
  String workoutStyle = '';
  int curUserCount = 0;
  int totalUserCount = 0;

  void getInfo() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    curUserId = userProvider.getUser.uid;

    //username = widget.data.username;
    username = 'rahulg221';
    //profilePic = widget.data.profilePic;
    profilePic = dummyImage;
    workoutType = 'Chest & Back';
    workoutDay = 'Thursday';
    workoutTime = 'Tues, 6:00 PM';
    workoutLevel = 'Intermediate';
    workoutStyle = 'Bodybuilder';
    curUserCount = 2;
    totalUserCount = 3;

    //final DateTime parsedDate = DateTime.parse(widget.data.createdAt);
    //final String formattedDate = UtilMethods.getFormattedDate(parsedDate);
    //createdAt = formattedDate;
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      UtilMethods.navigateTo(
                        OtherProfileScreen(uid: uid),
                        context,
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profilePic),
                      radius: 35,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontVariations: const <FontVariation>[
                          FontVariation(
                            'wght',
                            500,
                          ),
                        ]),
                      ),
                      Text(
                        workoutType,
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color:
                                theme.colorScheme.onSurface.withOpacity(0.7)),
                      ),
                      Text(
                        workoutTime,
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                            fontVariations: const <FontVariation>[
                              FontVariation(
                                'wght',
                                350,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text('Join',
                            style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.w600)))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: theme.colorScheme.surface,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
