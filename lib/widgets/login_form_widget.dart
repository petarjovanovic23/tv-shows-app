import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'input_field_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isActiveButton = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.47,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Login', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text('In order to continue please log in.', style: TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 12),
              InputFieldWidget(label: 'Email', controller: emailController, isPassword: false),
              const SizedBox(height: 18),
              InputFieldWidget(label: 'Password', controller: passwordController, isPassword: true),
            ],
          ),
        ),
        ButtonWidget('Login', isActiveButton),
      ],
    );
  }
}
