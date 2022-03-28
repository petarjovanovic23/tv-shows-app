import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReviewInputFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  ReviewInputFieldWidget({
    required this.label,
    required this.controller,
  });

  @override
  State<ReviewInputFieldWidget> createState() => _ReviewInputFieldWidgetState();
}

class _ReviewInputFieldWidgetState extends State<ReviewInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return TextField(
      controller: widget.controller,
      autocorrect: false,
      style: TextStyle(color: primary),
      textInputAction: TextInputAction.done,
      minLines: 10,
      maxLines: null,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primary, width: 1)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primary, width: 1)),
        hintText: 'Comment',
        hintStyle: const TextStyle(color: Colors.transparent),
        label: Text(
          widget.label,
          style: TextStyle(color: primary),
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
