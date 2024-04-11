import 'package:fitness_app/screens/primary/home/friend_sessions_screen.dart';
import 'package:fitness_app/screens/primary/home/my_gym_sessions_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendsListScreen extends StatefulWidget {
  const FriendsListScreen({Key? key}) : super(key: key);

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.chevronLeft,
              size: theme.iconTheme.size, color: theme.iconTheme.color),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Friends', style: theme.textTheme.headlineSmall),
      ),
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            TabBar(
              labelStyle: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: 'Inner Circle'),
                Tab(text: 'Friends'),
                Tab(text: 'Pending'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FriendSessionsScreen(),
                  FriendSessionsScreen(),
                  MyGymSessionsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
