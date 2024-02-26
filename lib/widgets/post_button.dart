import 'dart:typed_data';

import 'package:fitness_app/screens/upload_screen.dart';
// ignore: unused_import
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.secondary,
        onPressed: () async {},
        child: Icon(FontAwesomeIcons.pencil,
            size: 24, color: theme.colorScheme.onSecondary),
      ),
    );
  }
}
