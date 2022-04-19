import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';
import 'package:tv_shows/widgets/show_card_widget.dart';

void main() {
  testGoldens('Testing the show card goldens', (WidgetTester tester) async {
    final show = Show(
      id: '123',
      title: 'My new show!',
      description: 'An amazing show, you have to watch it',
      noOfReviews: 231,
      averageRating: 4.2,
      imageUrl: null,
    );

    await loadAppFonts();

    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: Builder(
          builder: (context) {
            return ShowCardWidget(context, show);
          },
        ),
      ),
    );

    await screenMatchesGolden(tester, 'show_card_widget');
  });
}
