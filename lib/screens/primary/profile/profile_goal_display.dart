import 'dart:ui';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _goal('Bench Press', 225, 245, 275, theme),
          const SizedBox(height: 8),
          _goal('Deadlift', 315, 335, 395, theme),
          const SizedBox(height: 8),
          _goal('Squat', 225, 265, 295, theme),
        ],
      ),
    );
  }
}

Widget _goal(String name, double startVal, double curVal, double goalVal,
    ThemeData theme) {
  double percentage = (curVal - startVal) / (goalVal - startVal);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onBackground,
              )),
          Text('${(percentage * 100).round()}%',
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              )),
        ],
      ),
      const SizedBox(height: 6),
      SizedBox(
          height: 10,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: percentage,
              valueColor:
                  AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
              backgroundColor: theme.colorScheme.onBackground.withOpacity(0.05),
            ),
          )),
      const SizedBox(height: 6),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${startVal.round()} lbs',
              style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                  fontVariations: const <FontVariation>[
                    FontVariation('wght', 350)
                  ])),
          Text('${startVal.round()} lbs',
              style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                  fontVariations: const <FontVariation>[
                    FontVariation('wght', 350)
                  ])),
        ],
      ),
    ],
  );
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
