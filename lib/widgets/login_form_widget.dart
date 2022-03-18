import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/input/password_input_field_widget.dart';

import 'buttons/button_widget.dart';
import 'input/input_field_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isActiveButton = false;

  bool email = false, password = false;

  void _checkEmpty() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() => isActiveButton = false);
    } else if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() => isActiveButton = true);
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(_checkEmpty);
    passwordController.addListener(_checkEmpty);
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text('In order to continue please log in.', style: TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 12),
                InputFieldWidget(label: 'Email', controller: emailController),
                const SizedBox(height: 18),
                PasswordInputFieldWidget(label: 'Password', controller: passwordController),
              ],
            ),
          ),
          ButtonWidget('Login', isActiveButton, emailController.text),
        ],
      ),
    );
  }
}
