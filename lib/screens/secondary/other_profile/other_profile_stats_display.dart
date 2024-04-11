import 'package:fitness_app/reusable_components/custom_container.dart';
import 'package:flutter/material.dart';

class OtherProfileStatsDisplay extends StatefulWidget {
  @override
  _OtherProfileStatsDisplayState createState() =>
      _OtherProfileStatsDisplayState();
}

class _OtherProfileStatsDisplayState extends State<OtherProfileStatsDisplay> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            _statDisplay(theme, 'posts', 3, width),
            _statDisplay(theme, 'friends', 16, width),
          ],
        ),
        Row(
          children: [
            _statDisplay(theme, 'level', 12, width),
            _statDisplay(theme, 'goals', 4, width),
          ],
        ),
      ],
    );
  }
}

Widget _statDisplay(
    ThemeData theme, String statName, int statValue, double width) {
  return Expanded(
    child: CustomContainer(
      width: width,
      child: Column(
        children: [
          Text(
            statName,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
          ),
          Center(
              child: Text('$statValue',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: theme.colorScheme.primary))),
        ],
      ),
    ),
  );
}
