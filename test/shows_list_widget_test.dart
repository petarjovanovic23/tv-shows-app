import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';
import 'package:tv_shows/widgets/show_card_widget.dart';
import 'package:tv_shows/widgets/shows_list_widget.dart';

void main() {
  testWidgets('Testing shows list widget', (WidgetTester tester) async {
    final shows = [
      Show(
        id: '123',
        title: 'My new show!',
        description: 'An amazing show, you have to watch it',
        noOfReviews: 231,
        averageRating: 4.2,
        imageUrl: null,
      ),
    ];
    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ShowsListWidget(constraints, shows);
          },
        ),
      ),
    );

    final showFinder = find.byType(ShowCardWidget);
    expect(showFinder, findsNWidgets(shows.length));
  });
}
