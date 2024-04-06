import 'package:fitness_app/reusable_components/primary_button.dart';
import 'package:fitness_app/reusable_components/text_field_input.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _resetEmailController = TextEditingController();
  bool _isLoading = false;

  void resetPassword() async {}

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          centerTitle: true,
          title: Text('Forgot password?', style: theme.textTheme.headlineSmall),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              TextFieldInput(
                  textEditingController: _resetEmailController,
                  hintText: 'Enter your email address',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 30),
              Center(
                  child: PrimaryButton(
                isLoading: _isLoading,
                onTap: resetPassword,
                text: 'Send me a reset link',
              )),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ));
  }
}
