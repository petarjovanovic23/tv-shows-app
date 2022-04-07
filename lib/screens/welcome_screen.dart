import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/gen/assets.gen.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/show_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String? email;
  const WelcomeScreen(this.email, {Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final string = await context
          .read<StorageRepository>()
          .getUser(widget.email as String);
      User user = User.fromJson(string!);
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ShowScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.images.welcomeIcon),
                const SizedBox(height: 24),
                Text('Welcome, ${widget.email}!',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Positioned.fill(
            child: Lottie.asset('assets/json/confetti.json'),
          ),
        ],
      ),
    );
  }
}
