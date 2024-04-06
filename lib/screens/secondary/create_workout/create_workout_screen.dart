import 'dart:typed_data';
import 'package:fitness_app/screens/secondary/create_workout/workout_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  bool isSwitched = false;

  Uint8List? postPic;

  DateTime dateTime = DateTime.now();

  String workoutTime = '';

  bool _friends = false;
  bool _myGym = false;

  double scale = 1.0;

  void getInfo() {}

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
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
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
        title: Text('New Workout', style: theme.textTheme.bodyLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 22),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        color: theme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Workout",
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7))),
              const SizedBox(height: 12),
              const WorkoutType(),
              const Expanded(
                child: SizedBox(),
              ),
              Text("Who can join",
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7))),
              Row(
                children: [
                  Icon(FontAwesomeIcons.userGroup,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                      size: 18),
                  const SizedBox(width: 12),
                  Text('Friends',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7))),
                  const Expanded(child: SizedBox()),
                  Transform.scale(
                    scale: scale,
                    child: Switch(
                      value: _friends,
                      onChanged: (value) {
                        setState(() {
                          _friends = value;
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
                  Icon(FontAwesomeIcons.userGroup,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                      size: 18),
                  const SizedBox(width: 12),
                  Text('My Gym',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7))),
                  const Expanded(child: SizedBox()),
                  Transform.scale(
                    scale: scale,
                    child: Switch(
                      value: _myGym,
                      onChanged: (value) {
                        setState(() {
                          _myGym = value;
                        });
                      },
                      activeTrackColor: theme.colorScheme.primary,
                      activeColor: theme.colorScheme.onPrimary,
                      inactiveThumbColor: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showDialog(
                        CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          initialDateTime: dateTime,
                          onDateTimeChanged: (DateTime newDateTime) {
                            setState(() {
                              dateTime = newDateTime;
                              workoutTime =
                                  DateFormat('hh:mm a').format(dateTime);
                            });
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: (width - 32) * 0.35,
                      height: 45,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.clock,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: (width - 32) * 0.63,
                      height: 45,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Create',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
