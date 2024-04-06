import 'package:flutter/material.dart';

class ProfileGoalDisplay extends StatefulWidget {
  @override
  _ProfileGoalDisplayState createState() => _ProfileGoalDisplayState();
}

class _ProfileGoalDisplayState extends State<ProfileGoalDisplay> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circle("Bench Press", 225, 245, 275, width, theme),
                _circle("Squats", 315, 375, 405, width, theme),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circle("Deadlift", 405, 425, 465, width, theme),
                _circle("Weight gain", 160, 180, 200, width, theme),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _circle(String goalName, double starting, double current, double goal,
    double width, ThemeData theme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(goalName,
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
      const SizedBox(height: 16),
      SizedBox(
        width: width * .27,
        height: width * .27,
        child: CircularProgressIndicator(
          value: goalName == 'Weight loss' || goalName == 'Weight gain'
              ? (starting - current) / (starting - goal)
              : (current - starting) / (goal - starting),
          strokeWidth: 10,
          backgroundColor: theme.colorScheme.onBackground.withOpacity(0.07),
          valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
        ),
      ),
      const SizedBox(height: 16),
      Text('Starting: $starting lbs',
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
      Text('Current: $current lbs',
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
      Text('Goal: $goal lbs',
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
    ],
  );
}
