import 'dart:typed_data';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/primary_button.dart';
import 'package:fitness_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _captionController = TextEditingController();
  bool isSwitched = false;
  Uint8List? image;
  final bool _isLoading = false;

  void takePhoto() async {
    Uint8List? newImage = await pickImage(ImageSource.camera);

    setState(() {
      image = newImage;
    });
  }

  void uploadPost() {
    // Empty function
  }

  @override
  void initState() {
    super.initState();
    takePhoto();
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
        ),
        body: image != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.2),
                    SizedBox(
                      height: height * 0.35,
                      width: double.infinity,
                      child: Image.memory(image!, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Save '),
                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    // You can also perform any action on state change here
                                  });
                                },
                                activeTrackColor: theme.colorScheme.primary,
                                activeColor: theme.colorScheme.onPrimary,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFieldInput(
                            textInputType: TextInputType.multiline,
                            textEditingController: _captionController,
                            hintText: 'Write a caption',
                            isPassword: false,
                          ),
                          SizedBox(height: 20),
                          PrimaryButton(
                              isLoading: _isLoading,
                              onTap: uploadPost,
                              text: 'Post'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : Text('Error', style: theme.textTheme.bodySmall));
  }
}
