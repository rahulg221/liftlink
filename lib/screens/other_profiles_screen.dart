import 'package:fitness_app/components/other_profile_info_display.dart';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String followedId = '';
  String curId = '';

  void getInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    beginLoading();
    // Get the user details
    final user = await DbMethods().getUserDetails(widget.uid);
    final curUser = userProvider.getUser;

    // Set the user data
    curId = curUser.uid;
    followedId = user.uid;
    username = user.username;
    photoUrl = user.profilePic;
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
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.back,
              color: theme.colorScheme.onBackground,
            ),
            onPressed: () {
              UtilMethods.navigateTo(const MobileScreenLayout(), context);
            },
          ),
          centerTitle: true,
          title: Text(username, style: theme.textTheme.headlineSmall),
        ),
        body: Align(
          alignment: Alignment.center,
          child: _isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      OtherProfileInfoDisplay(
                        username: username,
                        photoUrl: photoUrl,
                        followerCount: followerCount,
                        followingCount: followingCount,
                        activeStreak: activeStreak,
                        bio: bio,
                        followedId: followedId,
                        curId: curId,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
        ));
  }
}
