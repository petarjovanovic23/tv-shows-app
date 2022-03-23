import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tv_shows/gen/assets.gen.dart';

class AuthScreenTopPartWidget extends StatelessWidget {
  const AuthScreenTopPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: Theme.of(context).primaryColor)),
          Positioned(child: SvgPicture.asset(Assets.images.topRightIllustration), top: 0, right: 0),
          Positioned(child: SvgPicture.asset(Assets.images.logoHorizontalWhite), bottom: 80, left: 40),
          Positioned(child: SvgPicture.asset(Assets.images.topLeftIllustration), top: 0, left: 0),
        ],
      ),
    );
  }
}
