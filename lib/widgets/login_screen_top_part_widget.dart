import 'dart:math';
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
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.fromDirection(90 * pi / 180, 0.6),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );

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
              child: SlideTransition(
                  position: animation,
                  child: SvgPicture.asset(Assets.images.logoHorizontalWhite)),
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
