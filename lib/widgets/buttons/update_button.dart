import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/user_profile_provider.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton(this.email, {Key? key}) : super(key: key);
  final String email;

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
                  // if (states.contains(MaterialState.disabled)) {
                  //   return Colors.grey.withOpacity(0.5);
                  // }

                  return Colors.white;
                }),
              ),
              onPressed: () {
                context.read<UserProfileProvider>().updateUserEmail(email);
              },
              child: Text(
                'Update',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
