import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UtilMethods {
  // Show snackbar
  static void showSnackBar(String content, BuildContext context) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content, style: theme.textTheme.bodySmall),
    ));
  }

  // Navigate to screen
  static void navigateTo(Widget screenName, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screenName),
    );
  }

  static String getFormattedDate(DateTime parsedDate) {
    final DateTime now = DateTime.now();
    final int differenceInMinutes = now.difference(parsedDate).inMinutes;

    if (differenceInMinutes < 1) {
      return 'just now';
    } else if (differenceInMinutes < 60) {
      return '${differenceInMinutes}m ago';
    } else if (differenceInMinutes < 1440) {
      final int hours = differenceInMinutes ~/ 60;
      return '${hours}h ago';
    } else {
      final int days = differenceInMinutes ~/ 1440;
      return '${days}d ago';
    }
  }

  // Pick image from gallery or camera
  static Future<Uint8List?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    return null;
  }

  // Show partial screen
  static void showPartialScreen(
      Widget screenName, BuildContext context, double heightRatio) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: heightRatio, 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), 
             child: screenName, 
            ),
        );
      },
    );
  }

  static Future<File> createFileFromBytes(
      Uint8List bytes, String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$fileName';
    final file = File(filePath);

    try {
      await file.writeAsBytes(bytes, flush: true);
      return file;
    } catch (e) {
      throw Exception('Error creating file: $e');
    }
  }
}
