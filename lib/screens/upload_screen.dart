import 'dart:typed_data';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/components/primary_button.dart';
import 'package:fitness_app/components/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _captionController = TextEditingController();
  bool isSwitched = false;
  Uint8List? postPic;
  bool _isLoading = false;

  String username = '';
  String profilePic = '';
  String uid = '';
  int streak = 0;

  void getInfo() {
    // Get the user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Set the user data
    username = userProvider.getUser.username;
    profilePic = userProvider.getUser.profilePic;
    uid = userProvider.getUser.uid;
    streak = userProvider.getUser.streak;
  }

  Future<void> uploadPost() async {
    beginLoading();

    // Validate the input fields
    if (_captionController.text.isEmpty) {
      // Show an error message if the caption field is empty
      UtilMethods.showSnackBar('Please fill in the caption', context);
      stopLoading();
      return;
    }

    // Upload the post
    await DbMethods().uploadPost(
        postPic!, username, uid, profilePic, streak, _captionController.text);

    // Clear the caption field
    _captionController.clear();

    // Clear the image
    clearImage();

    stopLoading();
  }

  void takePhoto() async {
    Uint8List? image = await UtilMethods.pickImage(ImageSource.camera);

    setState(() {
      postPic = image;
    });
  }

  void beginLoading() {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  void stopLoading() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void clearImage() {
    setState(() {
      postPic = null;
    });
  }

  @override
  void initState() {
    super.initState();
    getInfo();
    takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Upload', style: theme.textTheme.headlineMedium),
        ),
        body: postPic != null
            ? Column(
                children: [
                  const Expanded(child: SizedBox()),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.5,
                          width: width - 32,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.memory(postPic!, fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              TextFieldInput(
                                textInputType: TextInputType.multiline,
                                textEditingController: _captionController,
                                hintText: 'Write a caption',
                                isPassword: false,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  PrimaryButton(
                      isLoading: _isLoading, onTap: uploadPost, text: 'Post'),
                  const SizedBox(height: 16),
                ],
              )
            : Text('Error', style: theme.textTheme.bodySmall));
  }
}
