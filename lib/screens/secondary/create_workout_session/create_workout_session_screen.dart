import 'dart:ui';

import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/session_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  bool _isLoading = false;

  String profilePicUrl = '';
  String username = '';
  String workoutType = 'Chest & Back';
  String workoutDateTime = '';
  String uid = '';
  bool friendsCanSee = false;
  bool myGymCanSee = false;

  String workoutTime = '';
  DateTime temp = DateTime.now();

  double scale = 1.0;

  String formattedDate = '';
  String formattedTime = '';

  void getInfo() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    profilePicUrl = userProvider.getUser.profilePic;
    username = userProvider.getUser.username;
    uid = userProvider.getUser.uid;
  }

  Future<void> createGroup() async {
    beginLoading();

    if (workoutType.isEmpty || workoutDateTime.isEmpty) {
      // Show an error message if any of the inputs are not used
      UtilMethods.showSnackBar(
          'Please select a workout type and time.', context);
      stopLoading();
      return;
    }

    await SessionMethods().createSession(uid, username, profilePicUrl,
        workoutType, workoutDateTime, friendsCanSee, myGymCanSee);

    stopLoading();

    if (mounted) {
      Navigator.of(context).pop();
      UtilMethods.showSnackBar('Group created successfully', context);
    }
  }

  void beginLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  void _showDialog(Widget child, ThemeData theme) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: theme.colorScheme.surface,
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
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

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('New workout session', style: theme.textTheme.headlineSmall),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.back,
              color: theme.colorScheme.onBackground,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text('Choose a workout',
                        style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 24),
                    Container(
                      height: 85,
                      width: width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: theme.colorScheme.onSurface.withOpacity(0.3),
                            width: 1.5),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text('Push', style: theme.textTheme.bodyLarge),
                              const Spacer(),
                              Transform.scale(
                                scale: 1.2,
                                child: Radio(
                                  value: 'Push',
                                  groupValue: workoutType,
                                  onChanged: (value) {
                                    setState(() {
                                      workoutType = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 85,
                      width: width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: theme.colorScheme.onSurface.withOpacity(0.3),
                            width: 1.5),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text('Pull', style: theme.textTheme.bodyLarge),
                              const Spacer(),
                              Transform.scale(
                                scale: 1.2,
                                child: Radio(
                                  value: 'Pull',
                                  groupValue: workoutType,
                                  onChanged: (value) {
                                    setState(() {
                                      workoutType = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 85,
                      width: width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: theme.colorScheme.onSurface.withOpacity(0.3),
                            width: 1.5),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text('Legs', style: theme.textTheme.bodyLarge),
                              const Spacer(),
                              Transform.scale(
                                scale: 1.2,
                                child: Radio(
                                  value: 'Legs',
                                  groupValue: workoutType,
                                  onChanged: (value) {
                                    setState(() {
                                      workoutType = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text('Choose date and time',
                        style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.calendar,
                            color: theme.colorScheme.onSurface, size: 40),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedDate,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontVariations: const <FontVariation>[
                                    FontVariation(
                                      'wght',
                                      500,
                                    ),
                                  ]),
                            ),
                            Text(
                              formattedTime,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            _showDialog(
                              CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.dateAndTime,
                                initialDateTime: temp,
                                onDateTimeChanged: (DateTime dateTime) {
                                  setState(() {
                                    temp = dateTime;
                                    formattedDate = DateFormat("EEE, MMM d")
                                        .format(dateTime);
                                    formattedTime =
                                        DateFormat("h:mm a").format(dateTime);
                                    workoutDateTime = dateTime.toString();
                                  });
                                },
                              ),
                              theme,
                            );
                          },
                          icon: const Icon(FontAwesomeIcons.pen),
                          color: theme.colorScheme.onSurface,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text('Who can join', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.userGroup,
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                            size: 18),
                        const SizedBox(width: 12),
                        Text('Friends',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.7))),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.2,
                          child: Switch(
                            value: friendsCanSee,
                            onChanged: (value) {
                              setState(() {
                                friendsCanSee = value;
                              });
                            },
                            activeTrackColor: theme.colorScheme.primary,
                            activeColor: theme.colorScheme.onPrimary,
                            inactiveThumbColor: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.peopleGroup,
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                            size: 18),
                        const SizedBox(width: 12),
                        Text('My Gym',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.7))),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.2,
                          child: Switch(
                            value: myGymCanSee,
                            onChanged: (value) {
                              setState(() {
                                myGymCanSee = value;
                              });
                            },
                            activeTrackColor: theme.colorScheme.primary,
                            activeColor: theme.colorScheme.onPrimary,
                            inactiveThumbColor: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: createGroup,
                      child: Container(
                        width: width - 32,
                        height: 55,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Create',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontVariations: const <FontVariation>[
                                  FontVariation('wght', 600),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
