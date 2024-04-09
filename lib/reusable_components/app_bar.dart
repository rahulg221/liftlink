import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/primary/profile/profile_screen.dart';
import 'package:fitness_app/screens/secondary/settings/settings_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  Function(bool) updateSearchingState;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<dynamic> searchResults = [];
  bool isLoading = false;

  CustomAppBar({
    Key? key,
    required this.updateSearchingState,
    required this.isSearching,
    required this.searchController,
    required this.searchFocusNode,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              widget.isSearching
                  ? CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Icon(
                        CupertinoIcons.back,
                        color: theme.colorScheme.onBackground,
                      ),
                      onPressed: () {
                        if (widget.isSearching) {
                          setState(() {
                            widget.updateSearchingState(false);
                            widget.isSearching = false;
                            widget.searchController.clear();
                            widget.searchFocusNode.unfocus();
                          });
                        }
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        FontAwesomeIcons.userGroup,
                        size: theme.iconTheme.size,
                        color: theme.iconTheme.color,
                      ),
                      onPressed: () {
                        UtilMethods.navigateTo(const SettingsScreen(), context);
                      },
                    ),
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: TextField(
                    focusNode: widget.searchFocusNode,
                    onTap: () {
                      setState(() {
                        widget.isSearching = true;
                      });
                    },
                    controller: widget.searchController,
                    style: theme.textTheme.bodySmall,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,
                          size: 15),
                      hintText: 'Search for users...',
                      filled: true,
                      fillColor: theme.colorScheme.surface,
                      hintStyle: theme.textTheme.bodySmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            UtilMethods.navigateTo(const ProfileScreen(), context);
          },
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(userProvider.getUser.profilePic),
            backgroundColor: theme.scaffoldBackgroundColor,
          ),
        ),
      ],
    );
  }
}
