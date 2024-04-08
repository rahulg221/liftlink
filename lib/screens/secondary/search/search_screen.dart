import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            CupertinoIcons.back,
            color: theme.colorScheme.onBackground,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: width - 100,
              height: 45,
              child: TextField(
                controller: _searchController,
                style: theme.textTheme.bodySmall,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for users...',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  hintStyle: theme.textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 15.0),
                ),
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(top: 8.0),
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
            },
          ),
        ],
      ),
      body: _isLoading
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
            ),
    );
  }
}
