import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/providers/login_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/auth/base_login_screen.dart';
import 'package:tv_shows/screens/auth/register_screen.dart';

import '../../providers/provider_listener.dart';
import '../welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void switchScreen() =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RegisterScreen()));

    return MultiProvider(
      providers: [
        Provider(create: (_) => NetworkingRepository(Provider.of<AuthInfoHolder>(context, listen: false))),
        ListenableProvider(create: (_) => LoginProvider()),
        // TODO: ChangeNotifierProvider
      ],
      child: ProviderListener<LoginProvider>(
        listener: (context, loginProvider) {
          loginProvider.state.maybeWhen(
            orElse: () {},
            success: (user) => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => WelcomeScreen(loginProvider!.loginInfo.email as String))),
            failure: (exception) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Something went wrong.'),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Builder(
          builder: (context) {
            LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
            return BaseLoginScreen(
              title: 'Login',
              description: 'In order to continue please log in.',
              buttonTitle: 'Login',
              showOtherButtonTitle: 'Create account',
              buttonPressed: () => loginProvider.loginUser(context.read<NetworkingRepository>()),
              showOtherButtonPressed: switchScreen,
            );
          },
        ),
      ),
    );
  }
}
