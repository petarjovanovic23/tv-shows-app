import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/login_provider.dart';
import 'package:tv_shows/providers/register_provider.dart';
import 'package:tv_shows/screens/welcome_screen.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  bool isActiveButton;
  final String userEmail;
  final VoidCallback callback;

  ButtonWidget(
    this.buttonText,
    this.isActiveButton,
    this.userEmail,
    this.callback, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterProvider? registerProvider;
    LoginProvider? loginProvider;
    if (buttonText == 'Register') {
      registerProvider = Provider.of<RegisterProvider>(context);
    } else {
      loginProvider = Provider.of<LoginProvider>(context);
    }

    Widget registerButton() {
      return registerProvider!.state.maybeWhen(
          orElse: () =>
              Text(buttonText, style: TextStyle(color: isActiveButton ? Theme.of(context).primaryColor : Colors.white)),
          loading: () => SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
          success: (nesto) => Text('Success'),
          failure: (e) => Text('FAILURE', style: TextStyle(color: Colors.red)));
    }

    Widget loginButton() {
      return loginProvider!.state.maybeWhen(
          orElse: () =>
              Text(buttonText, style: TextStyle(color: isActiveButton ? Theme.of(context).primaryColor : Colors.white)),
          loading: () => SizedBox(
                height: 12,
                width: 12,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
          success: (user) {
            if (!user.isEmpty()) {
              Future.delayed(
                  const Duration(seconds: 1),
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WelcomeScreen(loginProvider!.loginInfo.email as String))));
              return Text('Success',
                  style: TextStyle(color: isActiveButton ? Theme.of(context).primaryColor : Colors.white));
            }
            return Text('Something went wrong, try again',
                style: TextStyle(color: isActiveButton ? Theme.of(context).primaryColor : Colors.white));
          },
          failure: (e) => Text('FAILURE LOGIN', style: TextStyle(color: Colors.red)));
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            margin: const EdgeInsets.all(12),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey.withOpacity(0.5);
                    }

                    return Colors.white;
                  }),
                ),
                onPressed: isActiveButton ? callback : null,
                child: registerProvider != null ? registerButton() : loginButton()
                // Text(buttonText,
                //         style: TextStyle(color: isActiveButton ? Theme.of(context).primaryColor : Colors.white)),
                ),
          ),
        ),
      ],
    );
  }
}
