import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/forgot_password_screen.dart';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/screens/signup_screen.dart';
import 'package:fitness_app/supabase/auth_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:fitness_app/components/primary_button.dart';
import 'package:fitness_app/components/signinoptions.dart';
import 'package:fitness_app/components/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool _isLoading = false;

  void signInUser(String email, String password) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // Validate the input fields
    if (email.isEmpty || password.isEmpty || !email.contains('@')) {
      // Show an error message if any of the fields are empty
      UtilMethods.showSnackBar('Please fill in all fields', context);
      return;
    }

    String res = await AuthMethods().signInEmailAndPassword(email, password);

    if (res == 'Signed in successfully.') {
      userProvider.refreshUser();

      if (mounted) UtilMethods.navigateTo(const MobileScreenLayout(), context);
    } else {
      if (mounted) UtilMethods.showSnackBar(res, context);
    }

    // Clear the text fields
    _emailController.clear();
    _passwordController.clear();
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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.gear,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              UtilMethods.navigateTo(const SettingsScreen(), context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Text(
              'Welcome',
              style: theme.textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              'Please sign in to continue.',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                UtilMethods.showPartialScreen(
                    const ForgotPasswordScreen(), context, 0.33);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              onTap: () {
                signInUser(_emailController.text, _passwordController.text);
              },
              isLoading: _isLoading,
              text: 'Sign in',
            ),
            const SizedBox(height: 30),
            Text('Or sign in with', style: theme.textTheme.bodySmall),
            const SizedBox(height: 30),
            // Other sign in options
            const SignInOptions(),
            const SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: theme.textTheme.bodySmall),
                GestureDetector(
                  onTap: () {
                    UtilMethods.navigateTo(const SignUpScreen(), context);
                  },
                  child: Text('Sign up.',
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
