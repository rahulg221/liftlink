import 'package:flutter/material.dart';

class CaptionInput extends StatefulWidget {
  final TextEditingController textEditingController;

  const CaptionInput({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _CaptionInputState createState() => _CaptionInputState();
}

class _CaptionInputState extends State<CaptionInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * .44,
      height: height * 0.3,
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
          hintText: 'Share progress...',
          hintStyle: theme.textTheme.bodyMedium!
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
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                width: 1.5),
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: theme.colorScheme.primary, width: 2.0),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
