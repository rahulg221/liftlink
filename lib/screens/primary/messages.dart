import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/secondary/profile_screen.dart';
import 'package:fitness_app/screens/secondary/search_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Messages', style: theme.textTheme.headlineSmall),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                UtilMethods.navigateTo(const ProfileScreen(), context);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(userProvider.getUser.profilePic),
                radius: 16,
              ),
            ),
          ],
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
