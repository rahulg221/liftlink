import 'dart:typed_data';

import 'package:fitness_app/screens/upload_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  void showPostScreenModal(BuildContext context, Uint8List image) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height;

        return Container(
          height: height * 0.66,
          child: UploadScreen(image: image),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.secondary,
        onPressed: () async {
          Uint8List? image = await pickImage(ImageSource.camera);

          if (image != null) {
            showPostScreenModal(context, image);
          }
        },
        child: Icon(FontAwesomeIcons.cameraRetro,
            size: 24, color: theme.colorScheme.onSecondary),
      ),
    );
  }
}
