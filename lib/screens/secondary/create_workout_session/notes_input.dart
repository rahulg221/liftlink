import 'package:flutter/material.dart';

class NotesInput extends StatefulWidget {
  final TextEditingController textEditingController;

  const NotesInput({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _NotesInputState createState() => _NotesInputState();
}

class _NotesInputState extends State<NotesInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width - 32,
      height: height * 0.15,
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        expands: true,
        controller: widget.textEditingController,
        keyboardType: TextInputType.multiline,
        style: theme.textTheme.bodyMedium!
            .copyWith(color: theme.colorScheme.onSurface),
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Give a few details about your workout...',
          hintStyle: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.onSurface),
          contentPadding: const EdgeInsets.all(16.0),
          fillColor: theme.scaffoldBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: theme.colorScheme.onSurface, width: 1.5),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                width: 1.5),
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: theme.colorScheme.secondary, width: 2.0),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
