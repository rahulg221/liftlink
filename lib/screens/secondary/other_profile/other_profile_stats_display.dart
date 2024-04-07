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
            _statDisplay(theme, 'goals completed', 4, width),
            _statDisplay(theme, 'avg. daily steps', 5695, width),
          ],
        ),
      ],
    );
  }
}

Widget _statDisplay(
    ThemeData theme, String statName, int statValue, double width) {
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
      width: (width - 48) * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              statName,
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7)),
            ),
            Center(
                child: Text('$statValue',
                    style: theme.textTheme.headlineLarge!
                        .copyWith(color: theme.colorScheme.primary))),
          ],
        ),
      ),
    ),
  );
}
