import 'dart:ui';
import 'package:fitness_app/models/session.dart' as model;
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
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
  String gymName = '';
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

    // Create a new DateFormat for the desired output
    DateFormat formatter = DateFormat("EEE, h:mm a");

    // Format the DateTime object to a string
    String formattedDate = formatter.format(parsedDate);

    return formattedDate;
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
                      radius: 35,
                      backgroundImage: NetworkImage(profilePic),
                      backgroundColor: theme.scaffoldBackgroundColor,
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
                        formattedDateTime,
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
