import 'package:flutter/material.dart';

import 'gen/fonts.gen.dart';
import 'screens/login_screen.dart';

class TvShowsApp extends StatelessWidget {
  const TvShowsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff52368C),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: FontFamily.roboto,
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
