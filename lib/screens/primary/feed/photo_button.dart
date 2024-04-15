import 'dart:typed_data';
import 'package:fitness_app/screens/secondary/create_post/create_post_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PhotoButton extends StatelessWidget {
  const PhotoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
        backgroundColor: theme.colorScheme.surface,
        onPressed: () async {},
        child: Icon(FontAwesomeIcons.cameraRetro,
            color: theme.colorScheme.primary),
      ),
    );
  }
}
