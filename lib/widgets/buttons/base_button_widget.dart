import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseButtonWidget extends StatelessWidget {
  final String buttonText;
  bool isActiveButton;
  final String userEmail;
  final VoidCallback callback;
  final provider;

  BaseButtonWidget(
    this.buttonText,
    this.isActiveButton,
    this.userEmail,
    this.callback,
    this.provider, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonChild() {
      return provider!.state.maybeWhen(
        orElse: () =>
            Text(buttonText, style: TextStyle(color: isActiveButton ? Theme.of(context).primaryColor : Colors.white)),
        loading: () => SizedBox(
          height: 12,
          width: 12,
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
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
              child: buttonChild(),
            ),
          ),
        ),
      ],
    );
  }
}
