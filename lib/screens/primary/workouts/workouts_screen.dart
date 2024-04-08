import 'package:fitness_app/screens/primary/workouts/create_workout_button.dart';
import 'package:fitness_app/screens/primary/workouts/friend_sessions_screen.dart';
import 'package:fitness_app/screens/primary/workouts/my_gym_sessions_screen.dart';
import 'package:fitness_app/screens/secondary/search/search_screen.dart';
import 'package:fitness_app/screens/secondary/settings/settings_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Workout Sessions', style: theme.textTheme.headlineSmall),
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.userGroup,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              UtilMethods.navigateTo(const SettingsScreen(), context);
            },
          ),
          bottom: TabBar(
            labelStyle: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: 'Friends'),
              Tab(text: 'My Gym'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: theme.iconTheme.size,
                color: theme.iconTheme.color,
              ),
              onPressed: () {
                UtilMethods.navigateTo(const SearchScreen(), context);
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [
            FriendSessionsScreen(),
            MyGymSessionsScreen(),
          ],
        ),
        floatingActionButton: const RequestButton(),
      ),
    );
  }
}
