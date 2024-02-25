import 'dart:typed_data';

import 'package:fitness_app/screens/upload_screen.dart';
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
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        onPressed: () async {
          Uint8List? image = await pickImage(ImageSource.camera);

          if (image != null) {
            showPostScreenModal(context, image);
          }
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: const Icon(FontAwesomeIcons.cameraRetro, size: 25),
      ),
    );
  }
}
