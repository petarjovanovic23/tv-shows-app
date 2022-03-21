import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/repository/NetworkingRepository.dart';

import '../widgets/login_form_widget.dart';
import '../widgets/login_screen_top_part_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  //
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => NetworkingRepository(Provider.of<AuthInfoHolder>(context)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: const [
            LoginScreenTopPartWidget(),
            SizedBox(height: 80),
            LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}
