import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/widgets/post_card.dart';
import 'package:flutter/material.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  String currentFeed = 'Following';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Center(child: Text('Following screen'))),
      ),
    );
  }
}
