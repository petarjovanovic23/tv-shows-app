import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/write_review_screen.dart';

import '../../providers/current_show_provider.dart';
import '../../providers/review_provider.dart';

class WriteReviewButton extends StatelessWidget {
  const WriteReviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentShowProvider currentShowProvider = context.read<CurrentShowProvider>();
    Show show = currentShowProvider.currentShow;

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
              onPressed: () => showWriteReviewSheet(context, show),
              child: const Text('Write a Review', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

  void showWriteReviewSheet(BuildContext contextShowDetails, Show show) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: contextShowDetails,
        builder: (contextWriteReview) {
          return WriteReviewScreen(show, reviewProvider: contextShowDetails.read());
        });
  }
}
