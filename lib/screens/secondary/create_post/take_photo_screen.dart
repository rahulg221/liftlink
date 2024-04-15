import 'dart:typed_data';

import 'package:fitness_app/screens/secondary/create_post/create_post_screen.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoScreen extends StatefulWidget {
  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  void _redirect() async {
    Uint8List? image = await UtilMethods.pickImage(ImageSource.camera);

    if (context.mounted) {
      UtilMethods.navigateTo(CreatePostScreen(postPic: image!), context);
    }
  }

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
    );
  }
}
