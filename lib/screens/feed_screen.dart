import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String currentFeed = 'Following';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: DropdownButton<String>(
          dropdownColor: theme.colorScheme.secondary,
          value: currentFeed,
          onChanged: (String? newValue) {
            setState(() {
              currentFeed = newValue!;
            });
          },
          underline: Container(),
          items: <String>['Following', 'My Gym', 'Explore']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
            );
          }).toList(),
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.magnifyingGlass,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              navigateTo(SettingsScreen(), context);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.gear,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              navigateTo(SettingsScreen(), context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostCard(),
            PostCard(),
            PostCard(),
            PostCard(),
          ],
        ),
      ),
    );
  }
}
