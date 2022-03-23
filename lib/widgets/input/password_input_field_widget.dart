import 'package:flutter/material.dart';

class PasswordInputFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  PasswordInputFieldWidget({
    required this.label,
    required this.controller,
  });

  @override
  State<PasswordInputFieldWidget> createState() => _PasswordInputFieldWidgetState();
}

class _PasswordInputFieldWidgetState extends State<PasswordInputFieldWidget> {
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _clicked ? false : true,
      autocorrect: false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        suffixIcon: GestureDetector(
          child: Icon(_clicked ? Icons.visibility_off : Icons.visibility, color: Colors.white),
          onTap: () => setState(() => _clicked = !_clicked),
        ),
        label: Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
