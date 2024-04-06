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
  String gymName = 'UCF Rwc';
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
    username = 'rafman14';
    //profilePic = widget.data.profilePic;
    profilePic = dummyImage;
    workoutType = 'Chest & Back';
    workoutDay = 'Thursday';
    workoutTime = '6:00 PM';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: theme.colorScheme.brightness == Brightness.light ? 6 : 0,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                        radius: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(username, style: theme.textTheme.headlineSmall),
                        Text('$workoutLevel $workoutStyle',
                            style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.colorScheme.onBackground
                                    .withOpacity(0.5))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: theme.colorScheme.onBackground
                                .withOpacity(0.07),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 12.0),
                          child: Text(workoutType,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              )),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: theme.colorScheme.onBackground
                                .withOpacity(0.07),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 12.0),
                          child: Text(workoutDay,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              )),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: theme.colorScheme.onBackground
                                .withOpacity(0.07),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 12.0),
                          child: Text(workoutTime,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: width * 0.35,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text('Join',
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(
                                              color:
                                                  theme.colorScheme.onPrimary,
                                              fontWeight: FontWeight.w600)))),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: width * 0.35,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onBackground
                                    .withOpacity(0.07),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text('Message',
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w600)))),
                        ),
                      ],
                    ),
                    Text(
                      '$curUserCount/$totalUserCount',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
