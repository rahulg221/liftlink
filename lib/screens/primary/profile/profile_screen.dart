import 'dart:ui';

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
  int friendCount = 0;
  String bio = '';

  bool _isLoading = false;

  void getInfo() {
    // Get the user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Set the user data
    username = userProvider.getUser.username;
    photoUrl = userProvider.getUser.profilePic;
    friendCount = userProvider.getUser.friendCount;
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
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.chevronLeft,
              size: theme.iconTheme.size, color: theme.iconTheme.color),
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    ProfileInfoDisplay(
                      username: username,
                      photoUrl: photoUrl,
                      bio: bio,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text('Stats', style: theme.textTheme.headlineSmall),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ProfileStatsDisplay(),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Goals',
                              style: theme.textTheme.headlineSmall),
                          Text('Edit goals',
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.colorScheme.primary,
                                fontVariations: const <FontVariation>[
                                  FontVariation('wght', 450),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ProfileGoalDisplay(),
                  ],
                ),
              ),
            ),
    );
  }
}
