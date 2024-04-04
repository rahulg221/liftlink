import 'package:fitness_app/components/create_session_button.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/primary/sessions/friends_sessions.dart';
import 'package:fitness_app/screens/secondary/profile_screen.dart';
import 'package:fitness_app/screens/secondary/search_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  UtilMethods.navigateTo(const ProfileScreen(), context);
                },
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(userProvider.getUser.profilePic),
                  radius: 16,
                ),
              ),
            ],
          ),
          title: Text('Workout Sessions', style: theme.textTheme.headlineSmall),
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
