import 'package:fitness_app/screens/primary/feeds/photo_button.dart';
import 'package:fitness_app/screens/primary/feeds/explore_screen.dart';
import 'package:fitness_app/screens/primary/feeds/following_screen.dart';
import 'package:fitness_app/screens/primary/feeds/my_gym_screen.dart';
import 'package:fitness_app/screens/secondary/search/search_screen.dart';
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
          title: TabBar(
            labelStyle: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: 'Friends'),
              Tab(text: 'My Gym'),
              Tab(text: 'Explore'),
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
          children: [FollowingScreen(), MyGymScreen(), ExploreScreen()],
        ),
        floatingActionButton: const PhotoButton(),
      ),
    );
  }
}
