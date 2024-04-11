import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  final double width;

  const CustomContainer({
    Key? key,
    required this.child,
    required this.width,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: widget.width,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
            /*border: Border.all(
              color: theme.colorScheme.onBackground.withOpacity(0.1),
              width: 1,
            ),*/
          ),
          padding: const EdgeInsets.all(12.0),
          child: widget.child,
        ),
      ),
    );
  }
}
