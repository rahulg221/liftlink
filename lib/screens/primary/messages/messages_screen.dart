import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/reusable_components/custom_app_bar.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isLoading = false;
  bool _isSearching = false;
  final FocusNode _searchFocusNode = FocusNode();

  void _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _isSearching = true;
      });

      _performSearch(_searchController.text);
    } else {
      setState(() {
        _searchResults.clear();
      });
    }
  }

  Future<void> _performSearch(String query) async {
    beginLoading();

    // Search for users
    await UserMethods().searchUsers(query).then((results) {
      setState(() {
        _searchResults = results;
      });
    });

    stopLoading();
  }

  beginLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  void updateSearchingState(bool isSearching) {
    setState(() {
      _isSearching = isSearching;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(
          searchController: _searchController,
          searchFocusNode: _searchFocusNode,
          isSearching: _isSearching,
          updateSearchingState: updateSearchingState,
        ),
        automaticallyImplyLeading: false,
      ),
      body: _isSearching
          ? _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final user = _searchResults[index];
                          return GestureDetector(
                            onTap: () {
                              UtilMethods.navigateTo(
                                user['id'] == userProvider.getUser.uid
                                    ? const MobileScreenLayout()
                                    : OtherProfileScreen(uid: user['id']),
                                context,
                              );
                            },
                            child: ListTile(
                              title: Text(user['username'],
                                  style: theme.textTheme.bodyMedium),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
          : Container(),
    );
  }
}
