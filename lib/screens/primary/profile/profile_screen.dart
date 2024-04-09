import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/primary/profile/profile_goal_display.dart';
import 'package:fitness_app/screens/primary/profile/profile_stats_display.dart';
import 'package:fitness_app/screens/secondary/settings/settings_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/screens/primary/profile/profile_info_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();

  String username = '';
  String photoUrl = '';
  int followerCount = 0;
  int followingCount = 0;
  int activeStreak = 0;
  String bio = '';

  bool _isLoading = false;

  void getInfo() {
    // Get the user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Set the user data
    username = userProvider.getUser.username;
    photoUrl = userProvider.getUser.profilePic;
    followerCount = userProvider.getUser.followerCount;
    followingCount = userProvider.getUser.followingCount;
    activeStreak = userProvider.getUser.streak;
    bio = userProvider.getUser.bio;
  }

  void beginLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Profile', style: theme.textTheme.headlineSmall),
          centerTitle: true,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.back,
              color: theme.colorScheme.onBackground,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
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
        body: Align(
          alignment: Alignment.topCenter,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ProfileInfoDisplay(
                          username: username,
                          photoUrl: photoUrl,
                          followerCount: followerCount,
                          followingCount: followingCount,
                          activeStreak: activeStreak,
                          bio: bio,
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Stats',
                                style: theme.textTheme.headlineSmall),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ProfileStatsDisplay(),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Current Goals',
                                  style: theme.textTheme.headlineSmall),
                              Container(
                                width: 35,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15,
                                    ),
                                    onPressed: () {},
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        ProfileGoalDisplay(),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
