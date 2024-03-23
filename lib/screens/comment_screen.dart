import 'package:fitness_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage:
                      NetworkImage(userProvider.getUser.profilePic),
                  radius: 18),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8.0),
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${userProvider.getUser.username}',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  /*
                  await FirestoreMethods().postComment(
                      widget.snap['postId'],
                      _commentController.text,
                      user.uid,
                      user.username,
                      user.photoUrl);*/
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: Text('Post', style: theme.textTheme.bodyMedium),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
