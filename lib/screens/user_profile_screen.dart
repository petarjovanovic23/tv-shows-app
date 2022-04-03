import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/providers/provider_listener.dart';
import 'package:tv_shows/providers/user_profile_provider.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/widgets/buttons/logout_button.dart';
import 'package:tv_shows/widgets/modals/error_modal.dart';

import '../gen/assets.gen.dart';
import '../models/user.dart';
import '../widgets/buttons/update_button.dart';
import '../widgets/input/input_field_widget.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen(this.user, {Key? key}) : super(key: key);
  User user;
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController emailController;
  Image? _image;
  PickedFile? _imagePicked;

  void updateButton() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _image = widget.user.imageUrl != null
        ? Image.network(widget.user.imageUrl as String)
        : null;

    emailController = TextEditingController();
    emailController.addListener(updateButton);
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
  }

  void openImagePicker() async {
    final picker = ImagePicker();

    final _pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);

    if (_pickedFile == null) {
      return;
    }

    setState(() {
      _image = Image.file(File(_pickedFile.path));
      _imagePicked = _pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProfileProvider(context.read(), context.read()),
      child: LayoutBuilder(builder: (context, constraints) {
        ThemeData theme = Theme.of(context);

        return ProviderListener<UserProfileProvider>(
          listener: (context, userProfileProvider) {
            userProfileProvider.state.maybeWhen(
              orElse: () => Container(),
              success: (user) {
                context
                    .read<StorageRepository>()
                    .store(user.toJson(), user.email as String);
                Navigator.of(context).pop();
              },
              failure: (exception) => showDialog(
                  context: context, builder: (context) => ErrorModal(context)),
            );
          },
          child: Container(
            height: constraints.maxHeight * 0.48,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: openImagePicker,
                  child: CircleAvatar(
                      maxRadius: 65,
                      backgroundColor: Colors.transparent,
                      child: _image ??
                          Assets.images.icProfilePlaceholderPng.image()),
                  // widget.user.imageUrl != null
                  //     ? Image.network(widget.user.imageUrl as String)
                  //     : _image ??
                  //         Assets.images.icProfilePlaceholderPng.image()),
                ),
                InputFieldWidget(
                  label: context.read<UserProfileProvider>().email,
                  controller: emailController,
                  color: theme.primaryColor,
                ),
                const SizedBox(height: 24),
                UpdateButton(emailController.text, _imagePicked),
                const SizedBox(height: 12),
                const LogoutButton(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
