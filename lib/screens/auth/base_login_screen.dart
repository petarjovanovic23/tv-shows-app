import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/repository/NetworkingRepository.dart';
import 'package:tv_shows/widgets/input/base_form_widget.dart';

import '../../widgets/login_screen_top_part_widget.dart';

class BaseLoginScreen extends StatelessWidget {
  BaseLoginScreen({
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
  //
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => NetworkingRepository(Provider.of<AuthInfoHolder>(context)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const AuthScreenTopPartWidget(),
            const SizedBox(height: 80),
            // BaseFormWidget(),
            // LoginFormWidget(),
            BaseFormWidget(
              title: title,
              description: description,
              buttonTitle: buttonTitle,
              showOtherButtonTitle: showOtherButtonTitle,
              buttonPressed: buttonPressed,
              showOtherButtonPressed: showOtherButtonPressed,
            )
          ],
        ),
      ),
    );
  }
}
