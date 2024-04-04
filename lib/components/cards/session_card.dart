import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionCard extends StatefulWidget {
  const SessionCard({
    super.key,
  });

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
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
    username = 'davidlaid';
    //profilePic = widget.data.profilePic;
    profilePic = dummyImage;
    workoutType = 'Chest and Back';
    workoutDay = 'Thursday';
    workoutTime = '6:00 PM';
    workoutLevel = 'Beginner';
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
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        width: width * 0.9,
        height: height * 0.21,
        decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(username, style: theme.textTheme.headlineSmall),
                      const Expanded(child: SizedBox()),
                      Text('$curUserCount/$totalUserCount',
                          style: theme.textTheme.bodySmall!.copyWith(
                              color: theme.colorScheme.onBackground
                                  .withOpacity(0.5))),
                    ],
                  ),
                  Text('$workoutLevel $workoutStyle',
                      style: theme.textTheme.bodySmall!.copyWith(
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.5))),
                ],
              ),
              const Expanded(child: SizedBox()),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.07),
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
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.07),
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
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.07),
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
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: width * 0.25,
                        height: height * 0.04,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text('Join',
                                style: theme.textTheme.bodySmall))),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: width * 0.25,
                        height: height * 0.04,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: theme.colorScheme.onBackground
                                  .withOpacity(0.3),
                              width: 1.5,
                            )),
                        child: Center(
                            child: Text('Message',
                                style: theme.textTheme.bodySmall))),
                  ),
                  const Expanded(child: SizedBox()),
                  CircleAvatar(
                    backgroundImage: NetworkImage(profilePic),
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundImage: NetworkImage(profilePic),
                    radius: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
