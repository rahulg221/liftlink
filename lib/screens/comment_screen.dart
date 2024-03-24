import 'package:fitness_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Comments', style: theme.textTheme.headlineMedium),
      ),
      body: Center(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage:
                      NetworkImage(userProvider.getUser.profilePic),
                  radius: 20),
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                  controller: _commentController,
                  style: theme.textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: 'Write comment...',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    hintStyle: theme.textTheme.bodySmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
