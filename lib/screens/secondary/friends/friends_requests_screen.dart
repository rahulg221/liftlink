import 'package:fitness_app/models/user.dart' as model;
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/friends/friend_card.dart';
import 'package:fitness_app/supabase/user_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendRequestsScreen extends StatefulWidget {
  @override
  _FriendRequestsScreenState createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  final List<model.User> _friendRequests = [];

  bool _isLoading = false;

  void getFriendSessions() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final uid = userProvider.getUser.uid;

    if (_isLoading) return;

    beginLoading();
    // Get the sessions from the database
    List<model.User> newFriendRequests =
        await UserMethods().getFriendRequests(uid);

    _friendRequests.addAll(newFriendRequests);

    stopLoading();
  }

  void beginLoading() {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  void stopLoading() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getFriendSessions();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: _friendRequests.isNotEmpty
                    ? ListView.builder(
                        itemCount: _friendRequests.length,
                        itemBuilder: (context, index) {
                          return FriendCard(
                            username: _friendRequests[index].username,
                            profilePicUrl: _friendRequests[index].profilePic,
                            userId2: _friendRequests[index].uid,
                          );
                        })
                    : Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text('No incoming friend requests.',
                            style: theme.textTheme.bodySmall),
                      ),
              ),
            ],
          );
  }
}
