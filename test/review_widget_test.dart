import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/models/user.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';
import 'package:tv_shows/widgets/review_widget.dart';

import 'review_widget_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<User>(as: #MockUser, returnNullOnMissingStub: true),
])
void main() {
  testWidgets('Testing the review widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: ReviewWidget(
          Review(
            id: '123',
            comment: 'Really good',
            rating: 3,
            showId: 107,
            user: MockUser(),
          ),
        ),
      ),
    );

    final findComment = find.byType(Text);

    expect(findComment, findsWidgets);
  });
}
