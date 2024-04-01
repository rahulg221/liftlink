import 'dart:typed_data';
import 'package:fitness_app/components/caption_input.dart';
import 'package:fitness_app/components/upload_to_bar.dart';
import 'package:fitness_app/components/upload_to_sliders.dart';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatefulWidget {
  final Uint8List postPic;
  const CreatePostScreen({super.key, required this.postPic});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _captionController = TextEditingController();
  bool isSwitched = false;
  bool _isLoading = false;

  Uint8List? postPic;

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
    postPic = widget.postPic;
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
    await DbMethods().uploadPost(widget.postPic, username, uid, profilePic,
        streak, _captionController.text);

    // Clear the caption field
    _captionController.clear();

    // Clear the image
    clearImage();

    stopLoading();

    if (mounted) {
      UtilMethods.showSnackBar('Post uploaded!', context);
      UtilMethods.navigateTo(const MobileScreenLayout(), context);
    }
  }

  void takePhoto() async {
    Uint8List? image = await UtilMethods.pickImage(ImageSource.camera);

    setState(() {
      postPic = image!;
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
      //widget.postPic = null;
    });
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Create post', style: theme.textTheme.headlineSmall),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.back,
              color: theme.colorScheme.onBackground,
            ),
            onPressed: () {
              UtilMethods.navigateTo(const MobileScreenLayout(), context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: height *
                                      0.252, // Find a way to make this same height as caption input
                                  width: width * 0.4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.memory(widget.postPic,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                CaptionInput(
                                  textEditingController: _captionController,
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            const UploadBar(),
                            const SizedBox(height: 16),
                            UploadSliders(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: takePhoto,
                    child: Container(
                      width: (width - 32) * 0.46,
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Retake',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: uploadPost,
                    child: Container(
                      width: (width - 32) * 0.46,
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                'Post',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
