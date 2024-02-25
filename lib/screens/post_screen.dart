import 'dart:io';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/primary_button.dart';
import 'package:fitness_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatelessWidget {
  final XFile imageFile;
  final TextEditingController _captionController = TextEditingController();

  final bool _isLoading = false;

  PostScreen({super.key, required this.imageFile});

  void uploadPost() {
    // Empty function
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Upload Post',
            style: theme.textTheme.bodyLarge,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: Container()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.file(File(imageFile.path), fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextFieldInput(
                    textInputType: TextInputType.text,
                    textEditingController: _captionController,
                    hintText: 'Write a caption',
                    isPassword: false,
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                      isLoading: _isLoading, onTap: uploadPost, text: 'Post')
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
