import 'dart:io';
import 'dart:typed_data';
import 'package:fitness_app/widgets/primary_button.dart';
import 'package:fitness_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatelessWidget {
  final Uint8List image;
  final TextEditingController _captionController = TextEditingController();

  final bool _isLoading = false;

  UploadScreen({super.key, required this.image});

  void uploadPost() {
    // Empty function
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              child: Image.memory(image, fit: BoxFit.cover),
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
