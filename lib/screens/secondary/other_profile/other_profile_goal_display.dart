import 'package:flutter/material.dart';

class OtherProfileGoalDisplay extends StatefulWidget {
  @override
  _OtherProfileGoalDisplayState createState() =>
      _OtherProfileGoalDisplayState();
}

class _OtherProfileGoalDisplayState extends State<OtherProfileGoalDisplay> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: theme.colorScheme.brightness == Brightness.light ? 6 : 0,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circle("Bench Press 1RM", 225, 245, 275, width, theme),
                  _circle("Squat 1RM", 315, 375, 405, width, theme),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circle("Deadlift 5RM", 405, 425, 465, width, theme),
                  _circle("Weight gain", 160, 180, 200, width, theme),
                ],
              ),
            ],
          ),
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
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
      const SizedBox(height: 16),
      SizedBox(
        width: width * .27,
        height: width * .27,
        child: Stack(
          children: [
            Center(
                child: Text(
              '${goalName == 'Weight loss' || goalName == 'Weight gain' ? ((starting - current) / (starting - goal) * 100).toStringAsFixed(0) : ((current - starting) / (goal - starting) * 100).toStringAsFixed(0)}%',
              style: theme.textTheme.bodyLarge,
            )),
            SizedBox(
              width: width * .27,
              height: width * .27,
              child: CircularProgressIndicator(
                value: goalName == 'Weight loss' || goalName == 'Weight gain'
                    ? (starting - current) / (starting - goal)
                    : (current - starting) / (goal - starting),
                strokeWidth: 12,
                backgroundColor:
                    theme.colorScheme.onBackground.withOpacity(0.07),
                valueColor:
                    AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              ),
            ),
          ],
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
