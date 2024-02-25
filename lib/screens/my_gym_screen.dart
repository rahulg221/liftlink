import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/post_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyGymScreen extends StatefulWidget {
  const MyGymScreen({Key? key}) : super(key: key);

  @override
  _MyGymScreenState createState() => _MyGymScreenState();
}

class _MyGymScreenState extends State<MyGymScreen> {
  String currentFeed = 'My Gym';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
