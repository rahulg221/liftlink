import 'package:fitness_app/providers/theme_provider.dart';
import 'package:fitness_app/screens/onboarding/sign_in/signin_screen.dart';
import 'package:fitness_app/supabase/auth_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void signOut() async {
    await AuthMethods().signOut();

    if (mounted) {
      UtilMethods.navigateTo(const SignInScreen(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text('Settings', style: theme.textTheme.headlineSmall),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);
              },
            ),
          ],
        ),
        body: Center(
            child: GestureDetector(onTap: signOut, child: Text('Sign out'))));
  }
}
