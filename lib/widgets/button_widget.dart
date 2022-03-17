import 'package:flutter/material.dart';
import 'package:tv_shows/screens/welcome_screen.dart';

class ButtonWidget extends StatefulWidget {
  final String buttonText;
  bool isActiveButton;
  final String userEmail;

  ButtonWidget(this.buttonText, this.isActiveButton, this.userEmail);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: widget.isActiveButton
                  ? () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomeScreen(widget.userEmail)));
                    }
                  : null,
              child: Text(widget.buttonText,
                  style: TextStyle(color: widget.isActiveButton ? Theme.of(context).primaryColor : Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
