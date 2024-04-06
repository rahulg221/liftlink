import 'package:flutter/material.dart';

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
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    workoutType = 'Chest & Back';
                  });
                },
                child: Container(
                  width: (width - 40) * 0.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: workoutType == 'Chest & Back'
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onBackground.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Chest & Back',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    workoutType = 'Shoulder & Arms';
                  });
                },
                child: Container(
                  width: (width - 40) * 0.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: workoutType == 'Shoulder & Arms'
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onBackground.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Shoulder & Arms',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    workoutType = 'Legs';
                  });
                },
                child: Container(
                  width: (width - 40) * 0.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: workoutType == 'Legs'
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onBackground.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Legs',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //widget.onTap();
                  setState(() {
                    workoutType = 'Core';
                  });
                },
                child: Container(
                  width: (width - 40) * 0.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: workoutType == 'Core'
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onBackground.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Core',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
