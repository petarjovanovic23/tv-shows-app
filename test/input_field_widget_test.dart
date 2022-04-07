import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_shows/widgets/input/input_field_widget.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';

void main() {
  testWidgets('Testing base input field widget', (WidgetTester tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: InputFieldWidget(
          label: 'Email',
          controller: controller,
        ),
      ),
    );

    final textField = find.byType(TextField);

    await tester.tap(textField);
    await tester.pump();

    tester.enterText(textField, 'petar@gmail.com');
  });
}
