import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/components/log_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutLogScreen extends StatefulWidget {
  const WorkoutLogScreen({Key? key}) : super(key: key);

  @override
  _WorkoutLogScreenState createState() => _WorkoutLogScreenState();
}

class _WorkoutLogScreenState extends State<WorkoutLogScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Log", style: theme.textTheme.headlineSmall),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.magnifyingGlass,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              UtilMethods.navigateTo(SettingsScreen(), context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: Text('Workout log screen')),
      floatingActionButton: const LogButton(),
    );
  }
}
