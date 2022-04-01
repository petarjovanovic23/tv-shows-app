import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/providers/user_profile_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/widgets/buttons/logout_button.dart';

import '../gen/assets.gen.dart';
import '../widgets/buttons/update_button.dart';
import '../widgets/input/input_field_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController emailController;

  void updateButton() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    emailController.addListener(updateButton);
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      ThemeData theme = Theme.of(context);

      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProfileProvider(
              context.read<NetworkingRepository>(),
              context.read<StorageRepository>(),
            ),
          )
        ],
        child: Builder(builder: (context) {
          return Container(
            height: constraints.maxHeight * 0.46,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundColor: Colors.transparent,
                  child: Assets.images.icProfilePlaceholderPng.image(),
                ),
                InputFieldWidget(
                  label: context.read<UserProfileProvider>().email,
                  controller: emailController,
                  color: theme.primaryColor,
                ),
                const SizedBox(height: 24),
                UpdateButton(emailController.text),
                const SizedBox(height: 12),
                const LogoutButton(),
              ],
            ),
          );
        }),
      );
    });
  }
}
