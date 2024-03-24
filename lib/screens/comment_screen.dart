import 'package:fitness_app/components/chat_text_field_input.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  String profilePic = '';

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Comments', style: theme.textTheme.headlineMedium),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(),
          ),
          Expanded(
            child: SizedBox(),
          ),
          ChatTextFieldInput(
            hintText: 'Write comment...',
            textEditingController: _commentController,
          ),
        ],
      ),
    );
  }
}
