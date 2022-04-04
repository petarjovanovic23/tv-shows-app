import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tv_shows/gen/assets.gen.dart';

class AuthScreenTopPartWidget extends StatefulWidget {
  const AuthScreenTopPartWidget({Key? key}) : super(key: key);

  @override
  State<AuthScreenTopPartWidget> createState() =>
      _AuthScreenTopPartWidgetState();
}

class _AuthScreenTopPartWidgetState extends State<AuthScreenTopPartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(color: Theme.of(context).primaryColor)),
          Positioned(
              child: SvgPicture.asset(Assets.images.topRightIllustration),
              top: 0,
              right: 0),
          Positioned(
              child: SvgPicture.asset(Assets.images.logoHorizontalWhite),
              bottom: 80,
              left: 40),
          Positioned(
              child: SvgPicture.asset(Assets.images.topLeftIllustration),
              top: 0,
              left: 0),
        ],
      ),
    );
  }
}
