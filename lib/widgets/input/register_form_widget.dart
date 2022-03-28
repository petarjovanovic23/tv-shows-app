import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/register_provider.dart';

import 'base_form_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
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
    RegisterProvider registerProvider = context.watch<RegisterProvider>();
    return BaseFormWidget(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
      showOtherButtonTitle: showOtherButtonTitle,
      buttonPressed: buttonPressed,
      showOtherButtonPressed: showOtherButtonPressed,
      registerProvider: registerProvider,
    );
  }
}
