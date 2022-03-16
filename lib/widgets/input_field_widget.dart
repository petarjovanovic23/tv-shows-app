import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  InputFieldWidget({
    required this.label,
    required this.isPassword,
    required this.controller,
  });

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword
          ? _clicked
              ? false
              : true
          : false,
      autocorrect: false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: Icon(_clicked ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                onTap: () => setState(() {
                  _clicked = !_clicked;
                }),
              )
            : null,
        label: Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
