import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/add_post_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Profile', style: theme.textTheme.bodyLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              navigateTo(SettingsScreen(), context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text('Profile screen')),
    );
  }
}
