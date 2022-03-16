import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class TvShowsApp extends StatelessWidget {
  const TvShowsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
