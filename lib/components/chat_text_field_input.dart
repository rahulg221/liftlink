import 'package:fitness_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatTextFieldInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Future<void> Function() onSend;

  const ChatTextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.onSend,
  }) : super(key: key);

  @override
  State<ChatTextFieldInput> createState() => _ChatTextFieldInputState();
}

class _ChatTextFieldInputState extends State<ChatTextFieldInput> {
  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // Add a listener to the textEditingController to update send button visibility
    widget.textEditingController.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();

    // Remove the listener when the widget is disposed
    widget.textEditingController.removeListener(refresh);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundImage:
                      NetworkImage(userProvider.getUser.profilePic),
                  radius: 23),
              const SizedBox(width: 5),
              Expanded(
                child: TextField(
                  controller: widget.textEditingController,
                  style: theme.textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
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
          widget.textEditingController.text.isNotEmpty
              ? Container(
                  width: 45,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.arrowUp,
                        color: theme.iconTheme.color, size: 18),
                    onPressed: widget.onSend,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
