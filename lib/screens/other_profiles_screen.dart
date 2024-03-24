import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/components/user_info_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtherProfileScreen extends StatefulWidget {
  final String uid;
  const OtherProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  final ScrollController _scrollController = ScrollController();

  String username = '';
  String photoUrl = '';
  int followerCount = 0;
  int followingCount = 0;
  int activeStreak = 0;
  String bio = '';

  bool _isLoading = true;

  void getInfo() async {
    beginLoading();
    // Get the user details
    final user = await DbMethods().getUserDetails(widget.uid);

    // Set the user data
    username = user.username;
    photoUrl = user.profilePic;
    print(photoUrl);
    followerCount = user.followerCount;
    followingCount = user.followingCount;
    activeStreak = user.streak;
    bio = user.bio;

    stopLoading();
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
          centerTitle: true,
          title: Text(username, style: theme.textTheme.headlineMedium),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.gear,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {
                UtilMethods.navigateTo(const SettingsScreen(), context);
              },
            ),
          ],
        ),
        body: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
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
                    ],
                  ),
                ),
        ));
  }
}
