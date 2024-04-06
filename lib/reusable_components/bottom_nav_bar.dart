import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final PageController pageController;
  final int page;

  const BottomNavBar({
    Key? key,
    required this.pageController,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoTabBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      activeColor: theme.colorScheme.primary,
      inactiveColor: Colors.grey,
      currentIndex: page,
      onTap: (index) {
        pageController.jumpToPage(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.house, size: iconSize),
          label: null,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userGroup, size: iconSize),
          label: null,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidMessage, size: iconSize),
          label: null,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidUser, size: iconSize),
          label: null,
        ),
      ],
    );
  }
}
