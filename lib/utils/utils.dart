import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UtilMethods {
  static void showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
    ));
  }

  static void navigateTo(Widget screenName, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screenName),
    );
  }

  static Future<Uint8List?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    return null;
  }

  static void showPartialScreen(
      Widget screenName, BuildContext context, double heightRatio) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: heightRatio, // Percentage of screen height
          child: screenName,
        );
      },
    );
  }
}
