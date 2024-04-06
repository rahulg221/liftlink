import 'package:fitness_app/screens/primary/workouts/workout_card.dart';
import 'package:flutter/material.dart';

class FriendsSessionsScreen extends StatefulWidget {
  const FriendsSessionsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsSessionsScreen> createState() => _FriendsSessionsState();
}

class _FriendsSessionsState extends State<FriendsSessionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            WorkoutCard(),
            WorkoutCard(),
          ],
        ),
      ),
    ));
  }
}
