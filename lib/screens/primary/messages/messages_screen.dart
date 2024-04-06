import 'package:fitness_app/screens/secondary/search/search_screen.dart';
import 'package:fitness_app/screens/secondary/settings/settings_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Messages', style: theme.textTheme.headlineSmall),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.gear,
              size: theme.iconTheme.size, color: theme.iconTheme.color),
          onPressed: () {
            UtilMethods.navigateTo(const SettingsScreen(), context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.magnifyingGlass,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              UtilMethods.navigateTo(const SearchScreen(), context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: Text('Messaging screen')),
    );
  }
}
