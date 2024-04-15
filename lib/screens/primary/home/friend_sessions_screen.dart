import 'package:fitness_app/models/session.dart' as model;
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/primary/home/session_card.dart';
import 'package:fitness_app/supabase/session_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendSessionsScreen extends StatefulWidget {
  @override
  _FriendSessionsScreenState createState() => _FriendSessionsScreenState();
}

class _FriendSessionsScreenState extends State<FriendSessionsScreen> {
  final List<model.Session> _sessions = [];
  int sessionLimit = 10;
  int fetchedSessionCount = 0;

  bool _isLoading = false;

  void getFriendSessions() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final uid = userProvider.getUser.uid;

    if (_isLoading) return;

    beginLoading();
    // Get the sessions from the database
    List<model.Session> newSessions = await SessionMethods()
        .getFriendSessions(uid, sessionLimit, fetchedSessionCount);

    _sessions.addAll(newSessions);
    fetchedSessionCount = _sessions.length;

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
                child: _sessions.isNotEmpty
                    ? ListView.builder(
                        itemCount: _sessions.length,
                        itemBuilder: (context, index) {
                          return SessionCard(
                            data: _sessions[index],
                          );
                        })
                    : Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Column(
                          children: [
                            Text('No available workouts to join.',
                                style: theme.textTheme.bodySmall),
                            const SizedBox(height: 4),
                            Text('Add a workout and invite friends to join!',
                                style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
              ),
            ],
          );
  }
}
