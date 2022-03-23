import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  InputFieldWidget({
    required this.label,
    required this.controller,
  });

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autocorrect: false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
        label: Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
