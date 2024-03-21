import 'package:fitness_app/screens/explore_screen.dart';
import 'package:fitness_app/screens/following_screen.dart';
import 'package:fitness_app/screens/my_gym_screen.dart';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Feed', style: theme.textTheme.headlineSmall),
          bottom: TabBar(
            labelStyle: theme.textTheme.bodyMedium,
            tabs: [
              const Tab(
                text: 'Following',
              ),
              const Tab(text: 'My Gym'),
              const Tab(text: 'Explore'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.magnifyingGlass,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.gear,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {
                UtilMethods.navigateTo(const SettingsScreen(), context);
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: const TabBarView(
          children: [
            FollowingScreen(),
            MyGymScreen(),
            ExploreScreen(),
          ],
        ),
      ),
    );
  }
}
