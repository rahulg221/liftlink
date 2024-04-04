import 'dart:typed_data';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/screens/onboarding/signin_screen.dart';
import 'package:fitness_app/supabase/auth_methods.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/components/primary_button.dart';
import 'package:fitness_app/components/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  bool _isLoading = false;

  Uint8List? profilePic;

  // Sign up user function
  Future<void> signUpUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;
    String bio = _bioController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validate the input fields
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        username.isEmpty ||
        bio.isEmpty) {
      // Show an error message if any of the fields are empty
      UtilMethods.showSnackBar('Please fill in all fields', context);
      return;
    }

    if (password != confirmPassword) {
      // Show an error message if the passwords do not match
      UtilMethods.showSnackBar('Passwords do not match', context);
      return;
    }

    beginLoading();

    String res = await AuthMethods()
        .signUpEmailAndPassword(email, password, username, bio, profilePic!);

    if (res == 'success') {
      // Sign in the user with the new credentials
      await AuthMethods().signInEmailAndPassword(email, password);

      stopLoading();

      // Clear the text fields
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _usernameController.clear();
      _bioController.clear();

      // Navigate to the home screen
      if (mounted) UtilMethods.navigateTo(const MobileScreenLayout(), context);
    } else if (res == 'auth-exception') {
      stopLoading();

      // Show an error message if there was an error signing up
      if (mounted) {
        UtilMethods.showSnackBar('There was an error signing up.', context);
      }
    } else if (res == 'unexpected-error') {
      stopLoading();

      // Show an error message if an unexpected error occurred
      if (mounted) {
        UtilMethods.showSnackBar('An unexpected error occurred.', context);
      }
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

  // Select profile picture for sign up function
  void selectProfilePic() async {
    Uint8List? image = await UtilMethods.pickImage(ImageSource.gallery);

    setState(() {
      profilePic = image;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _confirmPasswordController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            left: isWeb ? 320 : 32, right: isWeb ? 320 : 32, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Text(
              'Sign up',
              style: theme.textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                profilePic == null
                    ? const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(dummyImage),
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(profilePic!),
                      ),
                Positioned(
                  bottom: -5, // Position at the bottom of the profile picture
                  right: -5, // Position to the right of the profile picture
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.black,
                          size: 15,
                        ),
                        onPressed: () {
                          selectProfilePic();
                        },
                        padding: EdgeInsets
                            .zero, // Removes default padding around the icon button
                        constraints:
                            const BoxConstraints(), // Removes default size constraints
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            TextFieldInput(
              hintText: 'Username',
              textInputType: TextInputType.text,
              textEditingController: _usernameController,
              isPassword: false,
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              hintText: 'Bio',
              textInputType: TextInputType.text,
              textEditingController: _bioController,
              isPassword: false,
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              textEditingController: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              hintText: 'Confirm Password',
              textInputType: TextInputType.visiblePassword,
              textEditingController: _confirmPasswordController,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              onTap: signUpUser,
              isLoading: _isLoading,
              text: 'Sign up',
            ),
            const SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',
                    style: theme.textTheme.bodySmall),
                GestureDetector(
                  onTap: () {
                    UtilMethods.navigateTo(const SignInScreen(), context);
                  },
                  child: Text('Sign in.',
                      style: theme.textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
