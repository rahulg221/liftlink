import 'package:fitness_app/screens/primary/workouts/create_workout_button.dart';
import 'package:fitness_app/screens/primary/workouts/friends_workouts.dart';
import 'package:fitness_app/screens/secondary/search/search_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Workouts', style: theme.textTheme.headlineSmall),
          bottom: TabBar(
            labelStyle: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: 'Gym Bros'),
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
        body: const TabBarView(
          children: [
            FriendsSessionsScreen(),
            FriendsSessionsScreen(),
            FriendsSessionsScreen(),
          ],
        ),
        floatingActionButton: const RequestButton(),
      ),
    );
  }
}
