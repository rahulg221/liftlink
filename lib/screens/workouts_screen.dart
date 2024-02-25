import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({Key? key}) : super(key: key);

  @override
  _WorkoutsScreenState createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Workout Log", style: theme.textTheme.bodyLarge),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.magnifyingGlass,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              navigateTo(SettingsScreen(), context);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.gear,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              navigateTo(SettingsScreen(), context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: Text('Workouts screen')),
    );
  }
}
