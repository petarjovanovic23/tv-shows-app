import 'package:flutter/material.dart';
import 'package:tv_shows/screens/auth/base_login_screen.dart';
import 'package:tv_shows/screens/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void switchScreen() =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterScreen()));

    return BaseLoginScreen(
      title: 'Login',
      description: 'In order to continue please log in.',
      buttonTitle: 'Login',
      showOtherButtonTitle: 'Create account',
      buttonPressed: () {},
      showOtherButtonPressed: switchScreen,
    );
  }
}
