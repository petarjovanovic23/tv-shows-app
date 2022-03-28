import 'package:flutter/material.dart';
import 'package:tv_shows/providers/register_provider.dart';

import '../../providers/login_provider.dart';
import '../../providers/request_provider.dart';
import '../../widgets/input/login_form_widget.dart';
import '../../widgets/input/register_form_widget.dart';
import '../../widgets/login_screen_top_part_widget.dart';

class BaseLoginScreen extends StatelessWidget {
  BaseLoginScreen(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonTitle,
      required this.showOtherButtonTitle,
      required this.buttonPressed,
      required this.showOtherButtonPressed,
      required this.provider})
      : super(key: key);

  final String title, description, buttonTitle, showOtherButtonTitle;
  final VoidCallback buttonPressed, showOtherButtonPressed;
  final RequestProvider provider;

  @override
  //
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const AuthScreenTopPartWidget(),
          const SizedBox(height: 80),
          if (provider.runtimeType == RegisterProvider)
            RegisterFormWidget(
              title: title,
              description: description,
              buttonTitle: buttonTitle,
              showOtherButtonTitle: showOtherButtonTitle,
              buttonPressed: buttonPressed,
              showOtherButtonPressed: showOtherButtonPressed,
            )
          else
            LoginFormWidget(
              title: title,
              description: description,
              buttonTitle: buttonTitle,
              showOtherButtonTitle: showOtherButtonTitle,
              buttonPressed: buttonPressed,
              showOtherButtonPressed: showOtherButtonPressed,
            )
        ],
      ),
    );
  }
}
