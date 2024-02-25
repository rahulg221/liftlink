import 'package:fitness_app/screens/post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(seconds: 3),
  ));
}

navigateTo(Widget screenName, BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => screenName),
  );
}

pickImage() async {
  final ImagePicker imagePicker = ImagePicker();

  final XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);

  if (photo != null) {
    return photo;
  }

  return null;
}

void showPostScreenModal(BuildContext context, XFile imageFile) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final height = MediaQuery.of(context).size.height;

      return Container(
        height: height * 0.66,
        child: PostScreen(imageFile: imageFile),
      );
    },
  );
}
