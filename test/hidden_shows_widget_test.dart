import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_shows/widgets/hidden_shows_widget.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';

void main() {
  testWidgets('Testing hidden shows widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: LayoutBuilder(
          builder: (context, constraints) => HiddenShowsWidget(constraints),
        ),
      ),
    );

    final textFinder = find.text('Your shows are not showing. Get it?');
    expect(textFinder, findsOneWidget);

    final imageFinder = find.byType(SvgPicture);
    expect(imageFinder, findsOneWidget);
  });
}
