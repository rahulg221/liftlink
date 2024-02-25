import 'package:fitness_app/providers/theme_provider.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/widgets/primary_button.dart';
import 'package:fitness_app/widgets/text_field_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool _agreedToTerms = false;

  void signInUser() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const LoginScreen()),
    );
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
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
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
              'Create Account',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),
            TextFieldInput(
              hintText: 'Username',
              textInputType: TextInputType.visiblePassword,
              textEditingController: _passwordController,
              isPassword: true,
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
            const SizedBox(height: 10),
            const SizedBox(height: 30),
            PrimaryButton(
              onTap: signInUser,
              isLoading: _isLoading,
              text: 'Register',
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',
                    style: theme.textTheme.bodySmall),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
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
