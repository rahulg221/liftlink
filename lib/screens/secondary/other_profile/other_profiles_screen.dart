import 'package:fitness_app/screens/secondary/other_profile/other_profile_goal_display.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profile_info_display.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profile_stats_display.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
  String userId2 = '';
  String curId = '';

  void getInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    beginLoading();
    // Get the user details
    final user = await UserMethods().getUserDetails(widget.uid);
    final curUser = userProvider.getUser;

    // Set the user data
    curId = curUser.uid;
    userId2 = user.uid;
    username = user.username;
    photoUrl = user.profilePic;
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
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text('@$username', style: theme.textTheme.headlineSmall),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      OtherProfileInfoDisplay(
                        username: username,
                        photoUrl: photoUrl,
                        bio: bio,
                        userId2: userId2,
                        curId: curId,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Stats',
                              style: theme.textTheme.headlineSmall),
                        ),
                      ),
                      const SizedBox(height: 12),
                      OtherProfileStatsDisplay(),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Current Goals',
                              style: theme.textTheme.headlineSmall),
                        ),
                      ),
                      const SizedBox(height: 12),
                      OtherProfileGoalDisplay(),
                    ],
                  ),
                ),
        ));
  }
}
