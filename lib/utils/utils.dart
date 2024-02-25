import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content, style: Theme.of(context).textTheme.bodySmall),
    duration: Duration(seconds: 3),
  ));
}

navigateTo(Widget screenName, BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => screenName),
  );
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
}
