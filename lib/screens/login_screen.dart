import 'package:flutter/material.dart';

import '../widgets/login_form_widget.dart';
import '../widgets/login_top_part_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff52368C),
      body: Column(
        children: const [
          LoginTopPartWidget(),
          SizedBox(height: 80),
          LoginFormWidget(),
        ],
      ),
    );
  }
}
