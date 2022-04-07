import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_shows/widgets/auth_screen_top_part_widget.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';

void main() {
  testWidgets('testing the login screen top part widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialAppAndScaffold(
        child: AuthScreenTopPartWidget(),
      ),
    );

    final widgetCount = find.byType(Positioned);

    expect(widgetCount, findsNWidgets(4));
  });
}
