import 'package:fitness_app/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
        ),
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GNav(
                    rippleColor: Colors.grey[700]!,
                    gap: 8,
                    activeColor: isDark
                        ? ColorPalette.darkPrimaryColor
                        : ColorPalette.lightPrimaryColor,
                    iconSize: 22,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: isDark
                        ? ColorPalette.darkNavBarColor
                        : ColorPalette.lightNavBarColor,
                    color: ColorPalette.iconColor,
                    selectedIndex: page,
                    onTabChange: (index) {
                      pageController.jumpToPage(index);
                    },
                    tabs: [
                      const GButton(
                        icon: FontAwesomeIcons.house,
                        text: 'Feed',
                      ),
                      const GButton(
                        icon: FontAwesomeIcons.userGroup,
                        text: 'Friends',
                      ),
                      const GButton(
                        icon: FontAwesomeIcons.dumbbell,
                        text: 'Log',
                      ),
                      const GButton(
                        icon: FontAwesomeIcons.solidUser,
                        text: 'Profile',
                      )
                    ]))));
  }
}
