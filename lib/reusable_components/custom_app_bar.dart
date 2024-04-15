import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/primary/profile/profile_screen.dart';
import 'package:fitness_app/screens/secondary/friends/friends_list_screen.dart';
import 'package:fitness_app/screens/secondary/settings/settings_screen.dart';
import 'package:fitness_app/supabase/user_methods.dart';
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
  /*
  void _onSearchChanged() {
    if (widget.searchController.text.isNotEmpty) {
      setState(() {
        widget.isSearching = true;
      });

      _performSearch(widget.searchController.text);
    } else {
      setState(() {
        widget.searchResults.clear();
      });
    }
  }

  Future<void> _performSearch(String query) async {
    beginLoading();

    // Search for users
    await UserMethods().searchUsers(query).then((results) {
      setState(() {
        widget.searchResults = results;
      });
    });

    stopLoading();
  }

  void updateSearchingState(bool isSearching) {
    setState(() {
      widget.isSearching = isSearching;
    });
  }

  beginLoading() {
    setState(() {
      widget.isLoading = true;
    });
  }

  stopLoading() {
    setState(() {
      widget.isLoading = false;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Row(
      children: [
        Row(
          children: [
            widget.isSearching
                ? const SizedBox.shrink()
                : IconButton(
                    icon: Icon(
                      FontAwesomeIcons.userGroup,
                      size: theme.iconTheme.size,
                      color: theme.iconTheme.color,
                    ),
                    onPressed: () {
                      UtilMethods.navigateTo(
                          const FriendsListScreen(), context);
                    },
                  ),
            SizedBox(
              width: widget.isSearching ? (width * 0.75) : (width * 0.66),
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
                  prefixIcon:
                      const Icon(FontAwesomeIcons.magnifyingGlass, size: 15),
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
          ],
        ),
        const SizedBox(width: 12),
        widget.isSearching
            ? GestureDetector(
                onTap: () {
                  if (widget.isSearching) {
                    setState(() {
                      widget.updateSearchingState(false);
                      widget.isSearching = false;
                      widget.searchController.clear();
                      widget.searchFocusNode.unfocus();
                    });
                  }
                },
                child: Text('Cancel',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.colorScheme.primary)),
              )
            : GestureDetector(
                onTap: () {
                  UtilMethods.navigateTo(const ProfileScreen(), context);
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage:
                      NetworkImage(userProvider.getUser.profilePic),
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
      ],
    );
  }
}
