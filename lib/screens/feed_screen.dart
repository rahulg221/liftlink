import 'package:fitness_app/screens/explore_screen.dart';
import 'package:fitness_app/screens/following_screen.dart';
import 'package:fitness_app/screens/my_gym_screen.dart';
import 'package:fitness_app/screens/search_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/screens/settings_screen.dart';

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
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.gear,
              size: theme.iconTheme.size,
              color: theme.iconTheme.color,
            ),
            onPressed: () {
              UtilMethods.navigateTo(const SettingsScreen(), context);
            },
          ),
          title: TabBar(
            labelStyle: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: 'Following'),
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
            FollowingScreen(),
            MyGymScreen(),
          ],
        ),
      ),
    );
  }
}
