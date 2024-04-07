import 'package:fitness_app/reusable_components/chat_text_field_input.dart';
import 'package:fitness_app/screens/secondary/comments/comment_card.dart';
import 'package:fitness_app/models/comments.dart';
import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/comment_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  final Post data;
  final int commentCount;
  const CommentsScreen(
      {Key? key, required this.data, required this.commentCount})
      : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];
  int commentLimit = 10;
  int fetchedCommentCount = 0;

  String username = '';
  String uid = '';
  String profilePic = '';
  String comment = '';
  int postId = 0;

  bool _isLoading = false;

  Future<void> getComments() async {
    beginLoading();
    // Get the posts from the database
    List<Comment> newComments = await CommentMethods()
        .getComments(commentLimit, fetchedCommentCount, postId);

    setState(() {
      _comments.addAll(newComments);
      fetchedCommentCount = _comments.length;
    });

    stopLoading();
  }

  Future<void> uploadComment() async {
    beginLoading();

    // Validate the input fields
    if (_commentController.text.isEmpty) {
      stopLoading();
      return;
    }

    // Upload the post
    await CommentMethods().uploadComment(
        username, uid, _commentController.text, profilePic, postId);

    // Clear the comment field
    _commentController.clear();

    stopLoading();

    if (mounted) {
      UtilMethods.showSnackBar('Comment added!', context);
      Navigator.of(context).pop();
    }
  }

  void getInfo() {
    // Get the user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Set the user data
    username = userProvider.getUser.username;
    profilePic = userProvider.getUser.profilePic;
    uid = userProvider.getUser.uid;
    postId = widget.data.postId;
  }

  void beginLoading() {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  void stopLoading() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getInfo();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
        title: Text('${widget.commentCount} comments',
            style: theme.textTheme.bodyLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 22),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? Container(
              color: theme.colorScheme.surface,
              child: const Center(child: CircularProgressIndicator()))
          : Container(
              color: theme.colorScheme.surface,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _comments.length,
                      itemBuilder: (context, index) {
                        return CommentCard(data: _comments[index]);
                      },
                    ),
                  ),
                  ChatTextFieldInput(
                    textEditingController: _commentController,
                    hintText: 'Add a comment...',
                    onSend: uploadComment,
                  ),
                ],
              ),
            ),
    );
  }
}
