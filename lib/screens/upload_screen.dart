import 'dart:typed_data';
import 'package:fitness_app/screens/create_post.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  void takePhoto() async {
    Uint8List? image = await UtilMethods.pickImage(ImageSource.camera);

    if (mounted) {
      UtilMethods.navigateTo(CreatePostScreen(postPic: image!), context);
    }
  }

  @override
  void initState() {
    super.initState();
    takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
