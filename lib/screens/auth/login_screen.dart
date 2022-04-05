import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/providers/login_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/auth/base_login_screen.dart';
import 'package:tv_shows/screens/auth/register_screen.dart';
import 'package:tv_shows/widgets/modals/error_modal.dart';

import '../../providers/provider_listener.dart';
import '../welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void switchScreen() => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const RegisterScreen()));

    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: ProviderListener<LoginProvider>(
        listener: (context, loginProvider) {
          loginProvider.state.maybeWhen(
            orElse: () {},
            success: (user) {
              return Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(user.email),
                ),
              );
            },
            failure: (exception) => showDialog(
                context: context, builder: (context) => ErrorModal(context)),
          );
        },
        child: Builder(
          builder: (context) {
            LoginProvider loginProvider = context.read<LoginProvider>();
            return BaseLoginScreen(
              title: 'Login',
              description: 'In order to continue please log in.',
              buttonTitle: 'Login',
              showOtherButtonTitle: 'Create account',
              buttonPressed: () =>
                  loginProvider.loginUser(context.read<NetworkingRepository>()),
              showOtherButtonPressed: switchScreen,
              loginProvider: loginProvider,
            );
          },
        ),
      ),
    );
  }
}
