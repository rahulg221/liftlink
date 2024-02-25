import 'package:fitness_app/screens/following_screen.dart';
import 'package:fitness_app/screens/my_gym_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
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
              Tab(
                text: 'Following',
              ),
              Tab(text: 'My Gym'),
              Tab(text: 'Explore'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.magnifyingGlass,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {},
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [
            FollowingScreen(),
            MyGymScreen(),
            MyGymScreen(),
          ],
        ),
      ),
    );
  }
}
