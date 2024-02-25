import 'package:fitness_app/providers/theme_provider.dart';
import 'package:fitness_app/screens/signup_screen.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/primary_button.dart';
import 'package:fitness_app/widgets/signup_options.dart';
import 'package:fitness_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool _isLoading = false;

  void loginUser() {
    // Empty function
  }

  void forgotPassword() {
    // Empty function
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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6,
                size: theme.iconTheme.size, color: theme.iconTheme.color),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Text(
              'Welcome',
              style: theme.textTheme.headlineLarge,
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
              onTap: forgotPassword,
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
              onTap: loginUser,
              isLoading: _isLoading,
              text: 'Login',
            ),
            const SizedBox(height: 30),
            Text('Or sign in with', style: theme.textTheme.bodySmall),
            const SizedBox(height: 30),
            // Other sign in options
            const SignInOptions(),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: theme.textTheme.bodySmall),
                GestureDetector(
                  onTap: () {
                    navigateTo(SignUpScreen(), context);
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
