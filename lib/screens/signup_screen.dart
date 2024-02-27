import 'dart:typed_data';

import 'package:fitness_app/firebase/auth_methods.dart';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/primary_button.dart';
import 'package:fitness_app/widgets/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isLoading = false;

  Uint8List? _image;

  // Sign up user function
  void signUpUser() async {
    // User provider instance to set user details after logging in
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // Begin loading animation
    setState(() {
      _isLoading = true;
    });

    if (_image == null) {
      showSnackBar('Profile picture not found.', context);

      setState(() {
        _isLoading = false;
      });
    } else if (_passwordController.text != _confirmPasswordController.text) {
      showSnackBar('Passwords do not match.', context);

      setState(() {
        _isLoading = false;
      });
    } else {
      // Call Firebase sign up function
      String res = await AuthMethods().signUpUser(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          profilePicture: _image!);

      // Finish loading animation
      setState(() {
        _isLoading = false;
      });

      if (res != 'success') {
        showSnackBar(res, context);
      } else {
        // Upon successful login refresh user to save all user details to our User provider - helps minimize reading data everytime we need user info
        await userProvider.refreshUser();
        navigateTo(const MobileScreenLayout(), context);
      }
    }
  }

  // Select profile picture for sign up function
  void selectProfilePic() async {
    Uint8List image = await pickImage(ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _confirmPasswordController.dispose();
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
                _image == null
                    ? const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(dummyImage),
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
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
                          color: theme.colorScheme.secondary,
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
                    navigateTo(const LoginScreen(), context);
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
