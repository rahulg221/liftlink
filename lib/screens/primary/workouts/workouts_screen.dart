import 'dart:ui';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/reusable_components/app_bar.dart';
import 'package:fitness_app/reusable_components/custom_container.dart';
import 'package:fitness_app/screens/primary/workouts/friend_sessions_screen.dart';
import 'package:fitness_app/screens/primary/workouts/my_gym_sessions_screen.dart';
import 'package:fitness_app/screens/secondary/create_workout_session/create_workout_session_screen.dart';
import 'package:fitness_app/screens/secondary/other_profile/other_profiles_screen.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
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
    final width = MediaQuery.of(context).size.width;
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
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('My Goals',
                                style: theme.textTheme.headlineSmall),
                            Text('Edit goals',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontVariations: const <FontVariation>[
                                    FontVariation('wght', 350),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomContainer(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _goal('Bench Press', 225, 245, 275, theme),
                            const SizedBox(height: 8),
                            _goal('Deadlift', 315, 335, 395, theme),
                            const SizedBox(height: 8),
                            _goal('Squat', 225, 265, 295, theme),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Join a workout',
                                style: theme.textTheme.headlineSmall),
                            GestureDetector(
                              onTap: () {
                                UtilMethods.navigateTo(
                                    const CreateSessionScreen(), context);
                              },
                              child: Text('Add a workout',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.primary,
                                    fontVariations: const <FontVariation>[
                                      FontVariation('wght', 350),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          labelStyle: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          tabs: const [
                            Tab(text: 'Friends'),
                            Tab(text: 'My Gym'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              FriendSessionsScreen(),
                              MyGymSessionsScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

Widget _goal(String name, double startVal, double curVal, double goalVal,
    ThemeData theme) {
  double percentage = (curVal - startVal) / (goalVal - startVal);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onBackground,
              )),
          Text('${(percentage * 100).round()}%',
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              )),
        ],
      ),
      const SizedBox(height: 6),
      SizedBox(
          height: 10,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: percentage,
              valueColor:
                  AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
              backgroundColor: theme.colorScheme.onBackground.withOpacity(0.05),
            ),
          )),
      const SizedBox(height: 6),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$startVal lbs',
              style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                  fontVariations: const <FontVariation>[
                    FontVariation('wght', 350)
                  ])),
          Text('$goalVal lbs',
              style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                  fontVariations: const <FontVariation>[
                    FontVariation('wght', 350)
                  ])),
        ],
      ),
    ],
  );
}
