import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/user_profile_provider.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton(this.email, this.image, {Key? key}) : super(key: key);
  final String email;
  final PickedFile? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Theme.of(context).primaryColor)),
            // margin: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16)),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.white;
                }),
              ),
              onPressed: () {
                context.read<UserProfileProvider>().updateUserData(
                      newEmail: email,
                      image: image,
                    );
              },
              child: Consumer<UserProfileProvider>(
                  builder: (context, provider, _) {
                return provider.state.maybeWhen(
                  orElse: () => Text(
                    'Update',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
