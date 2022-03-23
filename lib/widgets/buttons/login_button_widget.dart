import 'package:flutter/material.dart';
import 'package:tv_shows/screens/welcome_screen.dart';
import 'package:tv_shows/widgets/buttons/button_widget.dart';

class LoginButton extends StatelessWidget {
  LoginButton(this.title, this.isActiveButton, this.userEmail, {Key? key}) : super(key: key);
  String title;
  bool isActiveButton;
  String userEmail;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      title,
      isActiveButton,
      userEmail,
          () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomeScreen(userEmail))),
    );
  }
}
