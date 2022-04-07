import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_shows/screens/auth/login_screen.dart';
import 'package:tv_shows/widgets/buttons/base_button_widget.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';

void main() {
  testWidgets('Testing the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialAppAndScaffold(
        child: LoginScreen(),
      ),
    );

    final findTextFields = find.byType(TextField);
    expect(findTextFields, findsNWidgets(2));

    final emailTextField = findTextFields.first;
    final passwordTextField = findTextFields.last;

    await tester.enterText(emailTextField, 'petar@gmail.com');
    await tester.enterText(passwordTextField, 'password123');

    final findButton = find.byType(BaseButtonWidget);

    expect(findButton, findsOneWidget);

    await tester.pump();
  });
}
