import 'package:fitness_app/screens/following_screen.dart';
import 'package:fitness_app/screens/my_gym_screen.dart';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String currentFeed = 'Following';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home', style: theme.textTheme.bodyLarge),
          bottom: TabBar(
            labelStyle: theme.textTheme.bodyMedium,
            tabs: [
              Tab(
                text: 'Following',
              ),
              Tab(text: 'My Gym'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.magnifyingGlass,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {
                // navigateTo(SettingsScreen(), context); // Your navigation function
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [
            FollowingScreen(),
            MyGymScreen(),
          ],
        ),
      ),
    );
  }
}
