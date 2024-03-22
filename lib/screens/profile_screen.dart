import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/components/user_info_display.dart';
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

  void getProfileInfo() {
    // Get the user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Refresh the user data
    userProvider.refreshUser();

    // Set the user data
    username = userProvider.getUser.username;
    photoUrl = userProvider.getUser.photoUrl;
    followerCount = userProvider.getUser.followerCount;
    followingCount = userProvider.getUser.followingCount;
    activeStreak = userProvider.getUser.streak;
    bio = userProvider.getUser.bio;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getProfileInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile', style: theme.textTheme.headlineSmall),
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
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                UserInfoDisplay(
                    username: username,
                    photoUrl: photoUrl,
                    followerCount: followerCount,
                    followingCount: followingCount,
                    activeStreak: activeStreak,
                    bio: bio),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.cameraRetro,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
