import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutDay extends StatefulWidget {
  const WorkoutDay({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutDay> createState() => _WorkoutDayState();
}

class _WorkoutDayState extends State<WorkoutDay> {
  String workoutDay = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Day of the week",
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7)),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Monday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Monday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Monday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Tuesday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Tuesday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Tuesday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Wednesday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Wednesday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Wednesday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Thursday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Thursday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Thursday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Friday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Friday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Friday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Saturday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Saturday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Saturday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      //widget.onTap();
                      setState(() {
                        workoutDay = 'Sunday';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutDay == 'Sunday'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sunday',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
