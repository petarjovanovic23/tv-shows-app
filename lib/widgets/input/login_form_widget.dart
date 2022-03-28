import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/login_provider.dart';

import 'base_form_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.showOtherButtonTitle,
    required this.buttonPressed,
    required this.showOtherButtonPressed,
  }) : super(key: key);

  final String title, description, buttonTitle, showOtherButtonTitle;
  final VoidCallback buttonPressed, showOtherButtonPressed;

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = context.watch<LoginProvider>();
    return BaseFormWidget(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
      showOtherButtonTitle: showOtherButtonTitle,
      buttonPressed: buttonPressed,
      showOtherButtonPressed: showOtherButtonPressed,
      loginProvider: loginProvider,
    );
  }
}
