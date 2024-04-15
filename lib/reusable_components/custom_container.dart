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
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16.0),
        child: widget.child,
      ),
    );
  }
}
