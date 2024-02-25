import 'package:fitness_app/widgets/post_card.dart';
import 'package:flutter/material.dart';

class MyGymScreen extends StatefulWidget {
  const MyGymScreen({Key? key}) : super(key: key);

  @override
  _MyGymScreenState createState() => _MyGymScreenState();
}

class _MyGymScreenState extends State<MyGymScreen> {
  String currentFeed = 'My Gym';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              PostCard(),
              PostCard(),
              PostCard(),
              PostCard(),
              PostCard(),
            ],
          ),
        ),
      ),
    );
  }
}
