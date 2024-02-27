import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/feed_screen.dart';
import 'package:fitness_app/screens/friends_screen.dart';
import 'package:fitness_app/screens/profile_screen.dart';
import 'package:fitness_app/screens/upload_screen.dart';
import 'package:fitness_app/screens/workout_log_screen.dart';
import 'package:fitness_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void pageUpdate(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          FeedScreen(),
          FriendsScreen(),
          UploadScreen(),
          WorkoutLogScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        page: _page,
        pageController: pageController,
      ),
      //floatingActionButton: const PostButton(),
    );
  }
}
