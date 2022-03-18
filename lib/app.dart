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
            headline2: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontFamily: FontFamily.roboto,
            ),
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24,
              fontFamily: FontFamily.roboto,
            ),
            bodyText1: TextStyle(
              color: Color(0xffaaaaaa),
              fontSize: 14,
              fontFamily: FontFamily.roboto,
            ),
            bodyText2: TextStyle(
              fontFamily: FontFamily.roboto,
              color: Colors.black,
              fontSize: 17,
            )),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
