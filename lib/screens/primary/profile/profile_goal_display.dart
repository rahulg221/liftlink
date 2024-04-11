import 'package:fitness_app/reusable_components/custom_container.dart';
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

    return CustomContainer(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circle("Bench Press 5RM", 225, 245, 275, width, theme),
                _circle("Bicep Curl 10RM", 15, 25, 35, width, theme),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circle("Barbell Row 8RPM", 105, 155, 165, width, theme),
                _circle("Weight loss", 250, 180, 160, width, theme),
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
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
      const SizedBox(height: 16),
      SizedBox(
        width: width * .3,
        height: width * .3,
        child: Stack(
          children: [
            Center(
                child: Text(
              '${goalName == 'Weight loss' || goalName == 'Weight gain' ? ((starting - current) / (starting - goal) * 100).toStringAsFixed(0) : ((current - starting) / (goal - starting) * 100).toStringAsFixed(0)}%',
              style: theme.textTheme.bodyLarge,
            )),
            SizedBox(
              width: width * .3,
              height: width * .3,
              child: CircularProgressIndicator(
                value: goalName == 'Weight loss' || goalName == 'Weight gain'
                    ? (starting - current) / (starting - goal)
                    : (current - starting) / (goal - starting),
                strokeWidth: 12,
                backgroundColor:
                    theme.colorScheme.onBackground.withOpacity(0.07),
                valueColor:
                    AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
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
