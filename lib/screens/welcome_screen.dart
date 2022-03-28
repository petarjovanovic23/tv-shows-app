import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/gen/assets.gen.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/show_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final String email;
  const WelcomeScreen(this.email, {Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Provider(
            create: (context) => NetworkingRepository(
              Provider.of<AuthInfoHolder>(context, listen: false),
            ),
            child: const ShowScreen(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.welcomeIcon),
            const SizedBox(height: 24),
            Text('Welcome, ${widget.email}!', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
