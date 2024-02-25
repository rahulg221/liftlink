import 'package:fitness_app/utils/color_palette.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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

    return Container(
      /*
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
      ),*/
      child: SalomonBottomBar(
        currentIndex: page,
        onTap: (index) {
          pageController.jumpToPage(index);
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.house, size: iconSize),
              title: Text('Home',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.userGroup, size: iconSize),
              title: Text('Friends',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.dumbbell, size: iconSize),
              title: Text('Log',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.solidUser, size: iconSize),
              title: Text('Profile',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
        ],
      ),
    );
  }
}
