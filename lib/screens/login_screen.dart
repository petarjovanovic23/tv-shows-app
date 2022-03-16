import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/button_widget.dart';
import '../widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isActiveButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff52368C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            color: const Color(0xff52368C),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(color: const Color(0xff52368C)),
                ),
                Positioned(child: SvgPicture.asset('assets/images/Top_right_illustration.svg'), top: 0, right: 0),
                Positioned(child: SvgPicture.asset('assets/images/Logo_Horizontal_White.svg'), bottom: 80, left: 40),
                Positioned(child: SvgPicture.asset('assets/images/Top_left_illustration.svg'), top: 0, left: 0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text('In order to continue please log in.', style: TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 12),
                InputFieldWidget(label: 'Email', controller: emailController, isPassword: false),
                const SizedBox(height: 18),
                InputFieldWidget(label: 'Password', controller: passwordController, isPassword: true),
              ],
            ),
          ),
          ButtonWidget('Login', isActiveButton),
        ],
      ),
    );
  }
}
