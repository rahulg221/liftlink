import 'package:fitness_app/firebase/auth_methods.dart';
import 'package:fitness_app/providers/theme_provider.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void signOut() async {
    await AuthMethods().signOut();

    if (mounted) {
      navigateTo(LoginScreen(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Settings', style: theme.textTheme.headlineSmall),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ],
        ),
        body: Center(
            child: GestureDetector(onTap: signOut, child: Text('Sign out'))));
  }
}
