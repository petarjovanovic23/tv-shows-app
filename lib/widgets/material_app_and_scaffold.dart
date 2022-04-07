import 'package:flutter/material.dart';

class MaterialAppAndScaffold extends StatelessWidget {
  const MaterialAppAndScaffold({required this.child, Key? key})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
