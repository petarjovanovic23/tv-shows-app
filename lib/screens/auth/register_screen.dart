import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/provider_listener.dart';
import 'package:tv_shows/providers/register_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/auth/login_screen.dart';
import 'package:tv_shows/widgets/modals/error_modal.dart';
import 'package:tv_shows/widgets/modals/success_modal.dart';

import 'base_login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void switchScreen() =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));

    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: ProviderListener<RegisterProvider>(
        listener: (context, registerProvider) {
          registerProvider.state.maybeWhen(
              orElse: () {},
              success: (user) => showDialog(context: context, builder: (context) => SuccessModal(context)),
              failure: (exception) => showDialog(context: context, builder: (context) => ErrorModal(context)));
        },
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
              provider: registerProvider,
            );
          },
        ),
      ),
    );
  }
}
