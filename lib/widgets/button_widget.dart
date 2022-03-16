import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String buttonText;
  const ButtonWidget(this.buttonText, {Key? key}) : super(key: key);

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
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                // backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: null,
              child: Text(widget.buttonText),
            ),
          ),
        ),
      ],
    );
  }
}
