import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutType extends StatefulWidget {
  const WorkoutType({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutType> createState() => _WorkoutTypeState();
}

class _WorkoutTypeState extends State<WorkoutType> {
  String workoutType = '';

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
              "Today's Workout",
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
                        workoutType = 'Push';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutType == 'Push'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Push',
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
                        workoutType = 'Pull';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutType == 'Pull'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Pull',
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
                        workoutType = 'Legs';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutType == 'Legs'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Legs',
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
                        workoutType = 'Cardio';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 35,
                      decoration: BoxDecoration(
                        color: workoutType == 'Cardio'
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onBackground.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Cardio',
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
