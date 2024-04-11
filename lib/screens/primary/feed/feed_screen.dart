import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/reusable_components/app_bar.dart';
import 'package:fitness_app/screens/primary/feed/photo_button.dart';
import 'package:fitness_app/screens/primary/feed/explore_screen.dart';
import 'package:fitness_app/screens/primary/feed/following_screen.dart';
import 'package:fitness_app/screens/primary/feed/my_gym_screen.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
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

  void updateSearchingState(bool isSearching) {
    setState(() {
      _isSearching = isSearching;
    });
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
          isSearching: _isSearching,
          searchController: _searchController,
          searchFocusNode: _searchFocusNode,
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
          : DefaultTabController(
              length: 3, // Number of tabs
              child: Column(
                children: [
                  TabBar(
                    labelStyle: theme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: 'Friends'),
                      Tab(text: 'My Gym'),
                      Tab(text: 'Explore'),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        FollowingScreen(),
                        MyGymScreen(),
                        ExploreScreen()
                      ],
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: const PhotoButton(),
    );
  }
}
