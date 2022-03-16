import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreenTopPartWidget extends StatelessWidget {
  const LoginScreenTopPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      color: const Color(0xff52368C),
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: const Color(0xff52368C))),
          Positioned(child: SvgPicture.asset('assets/images/Top_right_illustration.svg'), top: 0, right: 0),
          Positioned(child: SvgPicture.asset('assets/images/Logo_Horizontal_White.svg'), bottom: 80, left: 40),
          Positioned(child: SvgPicture.asset('assets/images/Top_left_illustration.svg'), top: 0, left: 0),
        ],
      ),
    );
  }
}
