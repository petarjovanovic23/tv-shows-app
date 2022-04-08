import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';
import 'package:tv_shows/widgets/review_widget.dart';

void main() {
  testGoldens('Testing review widget golden', (WidgetTester tester) async {
    await loadAppFonts();

    final user = User('125', 'petar@gmail.com', null);
    final review = Review(
        id: '123',
        comment: 'Testing widgets',
        rating: 4,
        showId: 105,
        user: user);

    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: ReviewWidget(review),
      ),
    );

    await screenMatchesGolden(tester, 'review_widget');
  });
}
