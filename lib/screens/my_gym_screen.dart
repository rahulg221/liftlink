import 'package:flutter/material.dart';

class MyGymScreen extends StatefulWidget {
  const MyGymScreen({Key? key}) : super(key: key);

  @override
  State<MyGymScreen> createState() => _MyGymScreenState();
}

class _MyGymScreenState extends State<MyGymScreen> {
  String currentFeed = 'My Gym';

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Center(child: Text('my Gym screen'))),
      ),
    );
  }
}
