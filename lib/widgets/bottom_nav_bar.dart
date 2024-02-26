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
      items: [
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

/* NOTCH BAR
BottomAppBar(
        height: 60,
        color: theme.scaffoldBackgroundColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(FontAwesomeIcons.house,
                    color: widget.page == 0
                        ? theme.colorScheme.primary
                        : theme.iconTheme.color!.withOpacity(0.5)),
                onPressed: () {
                  widget.pageController.jumpToPage(0);
                  setState(() {
                    widget.page = 0;
                  });
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.userGroup,
                    color: widget.page == 1
                        ? theme.colorScheme.primary
                        : theme.iconTheme.color!.withOpacity(0.5)),
                onPressed: () {
                  widget.pageController.jumpToPage(1);
                  setState(() {
                    widget.page = 1;
                  });
                }),
            SizedBox(width: 48), // The gap for the FloatingActionButton
            IconButton(
                icon: Icon(FontAwesomeIcons.solidMessage,
                    color: widget.page == 2
                        ? theme.colorScheme.primary
                        : theme.iconTheme.color!.withOpacity(0.5)),
                onPressed: () {
                  widget.pageController.jumpToPage(2);
                  setState(() {
                    widget.page = 2;
                  });
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.solidUser,
                    color: widget.page == 3
                        ? theme.colorScheme.primary
                        : theme.iconTheme.color!.withOpacity(0.5)),
                onPressed: () {
                  widget.pageController.jumpToPage(3);
                  setState(() {
                    widget.page = 3;
                  });
                }),
          ],
        ));*/


/* SALOMON BAR
SalomonBottomBar(
        currentIndex: page,
        onTap: (index) {
          pageController.jumpToPage(index);
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.house, size: iconSize),
              title: Text('Home',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.userGroup, size: iconSize),
              title: Text('Friends',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.solidMessage, size: iconSize),
              title: Text('Messages',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.solidUser, size: iconSize),
              title: Text('Profile',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.primary)),
              selectedColor: theme.colorScheme.primary),
        ],
      ), */