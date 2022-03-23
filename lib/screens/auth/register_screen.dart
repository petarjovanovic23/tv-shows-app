import 'package:flutter/material.dart';
import 'package:tv_shows/screens/auth/login_screen.dart';

import 'base_login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void switchScreen() =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));

    return BaseLoginScreen(
      title: 'Register',
      description: 'In order to continue please register.',
      buttonTitle: 'Register',
      showOtherButtonTitle: 'Sign in',
      buttonPressed: () {},
      showOtherButtonPressed: switchScreen,
    );
  }
}
