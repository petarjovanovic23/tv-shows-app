import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_shows/widgets/input/review_input_field_widget.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';

void main() {
  testWidgets('Testing the review input field widget', (WidgetTester tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: ReviewInputFieldWidget(
          label: 'Email',
          controller: controller,
        ),
      ),
    );

    final findField = find.byType(TextField);
    expect(findField, findsOneWidget);

    await tester.tap(findField);

    await tester.pump();

    await tester.enterText(findField, 'petar@gmail.com');
    expect(controller.text, 'petar@gmail.com');
  });
}
