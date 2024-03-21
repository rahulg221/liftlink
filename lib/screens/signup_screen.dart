import 'dart:typed_data';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/signin_screen.dart';
import 'package:fitness_app/supabase/auth_methods.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/components/primary_button.dart';
import 'package:fitness_app/components/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
  void signUpUser(String email, String password, String confirmPassword,
      String username, String bio, Uint8List profilePic) async {
    print('1');
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Validate the input fields
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        username.isEmpty ||
        bio.isEmpty) {
      UtilMethods.showSnackBar('Please fill in all fields', context);
      return;
    }

    print('2');
    if (password != confirmPassword) {
      UtilMethods.showSnackBar('Passwords do not match', context);
      return;
    }

    print('3');

    beginLoading();
    String res = await AuthMethods()
        .signUpEmailAndPassword(email, password, username, bio, profilePic!);

    print('4');
    if (res == 'Signed up successfully.') {
      print('5');

      // Sign in the user with the new credentials
      await AuthMethods().signInEmailAndPassword(email, password);

      stopLoading();

      // Refresh user provider with the authenticated user
      userProvider.refreshUser();

      // Clear the text fields
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _usernameController.clear();
      _bioController.clear();

      // Navigate to the home screen if (mounted)
      UtilMethods.navigateTo(const MobileScreenLayout(), context);
    } else {
      stopLoading();
      print('6');
      if (mounted) UtilMethods.showSnackBar(res, context);
      print(res);
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
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Text(
              'Create Account',
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
              onTap: () {
                signUpUser(
                    _emailController.text,
                    _passwordController.text,
                    _confirmPasswordController.text,
                    _usernameController.text,
                    _bioController.text,
                    profilePic!);
              },
              isLoading: _isLoading,
              text: 'Create account',
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
                  child: Text('Login.',
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
