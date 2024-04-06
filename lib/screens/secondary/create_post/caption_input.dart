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
      width: width * .45,
      height: height * 0.3,
      child: TextField(
        expands: true,
        controller: widget.textEditingController,
        keyboardType: TextInputType.multiline,
        style: theme.textTheme.bodySmall!,
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Share progress...',
          hintStyle: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
          contentPadding: EdgeInsets.only(
              left: 10, right: 10, top: 10, bottom: height * .75),
          fillColor: theme.colorScheme.surface,
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
