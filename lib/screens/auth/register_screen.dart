import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/providers/register_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/auth/login_screen.dart';

import 'base_login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void switchScreen() =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));

    return MultiProvider(
      providers: [
        Provider(create: (_) => NetworkingRepository(Provider.of<AuthInfoHolder>(context, listen: false))),
        ListenableProvider(create: (_) => RegisterProvider()),
      ],
      child: Builder(
        builder: (context) {
          RegisterProvider registerProvider = Provider.of<RegisterProvider>(context, listen: false);
          return BaseLoginScreen(
            title: 'Register',
            description: 'In order to continue please register.',
            buttonTitle: 'Register',
            showOtherButtonTitle: 'Sign in',
            buttonPressed: () => registerProvider.registerUser(context.read<NetworkingRepository>()),
            showOtherButtonPressed: switchScreen,
          );
        },
      ),
    );
  }
}
