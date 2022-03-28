import 'package:flutter/material.dart';

class RequestHandlerModal extends StatelessWidget {
  const RequestHandlerModal(this.text, this.context, {Key? key}) : super(key: key);
  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      title: Text(
        text,
        style: theme.textTheme.headline2,
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(this.context).pop();
          },
          child: Text(
            'Ok',
            style: TextStyle(color: theme.primaryColor),
          ),
        ),
      ],
    );
  }
}
