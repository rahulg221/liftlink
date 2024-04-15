import 'dart:typed_data';
import 'package:fitness_app/reusable_components/large_button.dart';
import 'package:fitness_app/screens/secondary/create_post/caption_input.dart';
import 'package:fitness_app/screens/secondary/create_post/create_post_switches.dart';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/post_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatefulWidget {
  final Uint8List? postPic;
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
    await PostMethods().uploadPost(
        postPic!, username, uid, profilePic, streak, _captionController.text);

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

  void clearImage() {
    if (mounted) {
      setState(() {
        postPic = null;
      });
    }
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
          title: Text('New post', style: theme.textTheme.headlineSmall),
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              UtilMethods.navigateTo(const MobileScreenLayout(), context);
            },
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    postPic == null
                                        ? const SizedBox()
                                        : SizedBox(
                                            height: height * 0.3,
                                            width: width * 0.44,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              child: Image.memory(postPic!,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                    const SizedBox(width: 8),
                                    CaptionInput(
                                      textEditingController: _captionController,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(FontAwesomeIcons.solidEye),
                                      const SizedBox(width: 12),
                                      Text('Privacy',
                                          style: theme.textTheme.bodyMedium),
                                      const Spacer(),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: theme.colorScheme.surface,
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            FontAwesomeIcons.angleRight,
                                            color: theme
                                                .colorScheme.onBackground
                                                .withOpacity(0.3),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Divider(
                                  color: theme.colorScheme.surface,
                                  thickness: 1.5,
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(FontAwesomeIcons.pen),
                                      const SizedBox(width: 12),
                                      Text('Update goals',
                                          style: theme.textTheme.bodyMedium),
                                      const Spacer(),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: theme.colorScheme.surface,
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            FontAwesomeIcons.angleRight,
                                            color: theme
                                                .colorScheme.onBackground
                                                .withOpacity(0.3),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Divider(
                                  color: theme.colorScheme.surface,
                                  thickness: 1.5,
                                ),
                                const SizedBox(height: 8),
                                UploadSwitches(),
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                    LargeButton(
                        isLoading: _isLoading, onTap: uploadPost, text: 'Post'),
                  ],
                ),
              ));
  }
}
