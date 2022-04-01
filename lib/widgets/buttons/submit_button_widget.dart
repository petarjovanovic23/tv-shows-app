import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/widgets/rating_bar_widget.dart';

import '../../models/review.dart';
import '../../models/show.dart';
import '../../providers/write_review_provider.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget(this.show, this.textEditingController, this._context, {Key? key}) : super(key: key);
  final BuildContext _context;
  final Show show;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    int rating = Provider.of<RatingBarProvider>(context).rating;
    WriteReviewProvider writeReviewProvider = Provider.of<WriteReviewProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            // margin: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  // if (states.contains(MaterialState.disabled)) {
                  //   return Colors.grey.withOpacity(0.5);
                  // }

                  return Theme.of(context).primaryColor;
                }),
              ),
              onPressed: () => writeReviewProvider.addReview(
                Review.submit(
                  textEditingController.text,
                  rating,
                  int.parse(show.id as String),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
