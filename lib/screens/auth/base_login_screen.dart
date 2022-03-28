import 'package:flutter/material.dart';
import 'package:tv_shows/providers/login_provider.dart';
import 'package:tv_shows/providers/register_provider.dart';

import '../../widgets/input/login_form_widget.dart';
import '../../widgets/input/register_form_widget.dart';
import '../../widgets/login_screen_top_part_widget.dart';

class BaseLoginScreen extends StatelessWidget {
  const BaseLoginScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.showOtherButtonTitle,
    required this.buttonPressed,
    required this.showOtherButtonPressed,
    this.registerProvider,
    this.loginProvider,
  }) : super(key: key);

  final String title, description, buttonTitle, showOtherButtonTitle;
  final VoidCallback buttonPressed, showOtherButtonPressed;
  final RegisterProvider? registerProvider;
  final LoginProvider? loginProvider;

  Widget formWidget() {
    if (registerProvider != null) {
      return RegisterFormWidget(
        title: title,
        description: description,
        buttonTitle: buttonTitle,
        showOtherButtonTitle: showOtherButtonTitle,
        buttonPressed: buttonPressed,
        showOtherButtonPressed: showOtherButtonPressed,
      );
    }
    return LoginFormWidget(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
      showOtherButtonTitle: showOtherButtonTitle,
      buttonPressed: buttonPressed,
      showOtherButtonPressed: showOtherButtonPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const AuthScreenTopPartWidget(),
          const SizedBox(height: 80),
          formWidget(),
        ],
      ),
    );
  }
}
