import 'package:flutter/material.dart';
import 'package:tv_shows/providers/register_provider.dart';
import 'package:tv_shows/widgets/buttons/base_button_widget.dart';

import '../../providers/login_provider.dart';
import 'input_field_widget.dart';
import 'password_input_field_widget.dart';

class BaseFormWidget extends StatefulWidget {
  BaseFormWidget({
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
  RegisterProvider? registerProvider;
  LoginProvider? loginProvider;

  @override
  State<BaseFormWidget> createState() => _BaseFormWidgetState();
}

class _BaseFormWidgetState extends State<BaseFormWidget> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isActiveButton = false;

  bool email = false, password = false;

  void _checkEmpty() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() => isActiveButton = false);
    } else if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (widget.loginProvider != null) {
        widget.loginProvider!.setInfo(emailController.text, passwordController.text);
      } else {
        widget.registerProvider!.setInfo(emailController.text, passwordController.text);
      }
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
                Text(widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(widget.description, style: const TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 12),
                InputFieldWidget(label: 'Email', controller: emailController),
                const SizedBox(height: 18),
                PasswordInputFieldWidget(label: 'Password', controller: passwordController),
                const SizedBox(height: 18),
                Center(
                  child: GestureDetector(
                    onTap: widget.showOtherButtonPressed,
                    child: Text(
                      widget.showOtherButtonTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          widget.registerProvider != null
              ? BaseButtonWidget(widget.buttonTitle, isActiveButton, emailController.text, widget.buttonPressed,
                  widget.registerProvider)
              : BaseButtonWidget(
                  widget.buttonTitle, isActiveButton, emailController.text, widget.buttonPressed, widget.loginProvider),
        ],
      ),
    );
  }
}
