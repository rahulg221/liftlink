import 'package:flutter/material.dart';

class ProfileStatsDisplay extends StatefulWidget {
  @override
  _ProfileStatsDisplayState createState() => _ProfileStatsDisplayState();
}

class _ProfileStatsDisplayState extends State<ProfileStatsDisplay> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final isDark = theme.colorScheme.brightness == Brightness.dark;

    return Column(
      children: [
        Row(
          children: [
            _statDisplay(theme, 'posts', 3, width, isDark),
            _statDisplay(theme, 'friends', 16, width, isDark),
          ],
        ),
        Row(
          children: [
            _statDisplay(theme, 'level', 9, width, isDark),
            _statDisplay(theme, 'goals', 4, width, isDark),
          ],
        ),
      ],
    );
  }
}

Widget _statDisplay(ThemeData theme, String statName, int statValue,
    double width, bool isDark) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    elevation: isDark ? 0 : 6,
    shadowColor: Colors.grey.withOpacity(0.5),
    child: Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            color: isDark
                ? theme.colorScheme.onBackground.withOpacity(0.3)
                : Colors.transparent,
            width: 1.5),
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
