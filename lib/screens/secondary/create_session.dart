import 'dart:typed_data';
import 'package:fitness_app/components/session_day.dart';
import 'package:fitness_app/components/session_workout_type.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  bool isSwitched = false;

  Uint8List? postPic;

  String username = '';
  String profilePic = '';
  String uid = '';
  int streak = 0;

  void getInfo() {
    // Get the user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Set the user data
    username = userProvider.getUser.username;
    profilePic = userProvider.getUser.profilePic;
    uid = userProvider.getUser.uid;
  }

  Future<void> uploadPost() async {}

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
        title: Text('New session', style: theme.textTheme.bodyLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 22),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: theme.colorScheme.surface,
        child: const Column(
          children: [
            WorkoutType(),
            SizedBox(height: 12),
            WorkoutDay(),
          ],
        ),
      ),
    );
  }
}
