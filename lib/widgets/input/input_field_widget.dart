import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Color? color;

  InputFieldWidget({required this.label, required this.controller, this.color});

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autocorrect: false,
      style: TextStyle(color: widget.color ?? Colors.white),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.color ?? Colors.white, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.color ?? Colors.white, width: 1)),
        label: Text(
          widget.label,
          style: TextStyle(color: widget.color ?? Colors.white),
        ),
      ),
    );
  }
}
