import 'dart:ui';
import 'package:fitness_app/models/session.dart' as model;
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/create_workout_session/join_session_screen.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SessionCard extends StatefulWidget {
  final model.Session data;

  const SessionCard({super.key, required this.data});

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  String username = '';
  String profilePic = '';
  String uid = '';
  String curUserId = '';
  String gymName = 'Crunch Fitness';
  String workoutType = '';
  String workoutLevel = '';
  String workoutStyle = '';
  String workoutDateTime = '';
  String formattedDateTime = '';
  int curUserCount = 0;
  int totalUserCount = 0;

  void getInfo() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    curUserId = userProvider.getUser.uid;

    username = widget.data.username;
    profilePic = widget.data.profilePic;
    workoutType = widget.data.workoutType;
    uid = widget.data.uid;

    workoutDateTime = widget.data.workoutDateTime;
    formattedDateTime = formatDateTime(workoutDateTime);

    curUserCount = widget.data.curCapacity;
    totalUserCount = widget.data.maxCapacity;
  }

  String formatDateTime(String workoutDateTime) {
    // Parse the ISO string to a DateTime object
    DateTime parsedDate = DateTime.parse(workoutDateTime);

    // Get the current date and time
    DateTime now = DateTime.now();
    // Create date objects for comparison (ignoring time)
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime tomorrow = DateTime(today.year, today.month, today.day + 1);

    // Compare and decide what to display
    if (DateTime(parsedDate.year, parsedDate.month, parsedDate.day) == today) {
      return "Today, ${DateFormat('h:mm a').format(parsedDate)}";
    } else if (DateTime(parsedDate.year, parsedDate.month, parsedDate.day) ==
        tomorrow) {
      return "Tmr, ${DateFormat('h:mm a').format(parsedDate)}";
    } else {
      // Create a new DateFormat for the desired output if not today or tomorrow
      DateFormat formatter = DateFormat("EEE, h:mm a");
      return formatter.format(parsedDate);
    }
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
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        radius: 23,
                        backgroundImage: NetworkImage(profilePic),
                        backgroundColor: theme.scaffoldBackgroundColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontVariations: const <FontVariation>[
                            FontVariation(
                              'wght',
                              500,
                            ),
                          ]),
                        ),
                        Text(
                          '$workoutType Workout',
                          style: theme.textTheme.bodySmall!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7)),
                        ),
                        Text(
                          formattedDateTime,
                          style: theme.textTheme.bodySmall!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.surface,
                  ),
                  child: IconButton(
                    onPressed: () {
                      UtilMethods.navigateTo(
                        JoinSession(),
                        context,
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.angleRight,
                      color: theme.colorScheme.onBackground.withOpacity(0.3),
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: theme.colorScheme.surface,
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
