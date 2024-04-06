import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/primary/feeds/feed_screen.dart';
import 'package:fitness_app/screens/primary/workouts/friends_screen.dart';
import 'package:fitness_app/screens/primary/messages/messages.dart';
import 'package:fitness_app/reusable_components/bottom_nav_bar.dart';
import 'package:fitness_app/screens/primary/profile/profile_screen.dart';
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

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // Refresh user provider with the authenticated user
    userProvider.refreshUser();
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
        children: const [
          FeedScreen(),
          FriendsScreen(),
          MessagesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        page: _page,
        pageController: pageController,
      ),
    );
  }
}
