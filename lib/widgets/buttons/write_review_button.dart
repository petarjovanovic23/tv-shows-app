import 'package:flutter/material.dart';

class WriteReviewButton extends StatelessWidget {
  const WriteReviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
              onPressed: () {},
              child: const Text('Write a Review', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
