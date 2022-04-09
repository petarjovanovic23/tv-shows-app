import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/screens/auth/register_screen.dart';
import 'package:tv_shows/widgets/buttons/base_button_widget.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';

@GenerateMocks([NetworkingRepository])
void main() {
  testWidgets('Testing the register screen widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialAppAndScaffold(
        child: RegisterScreen(),
      ),
    );

    final findTextFields = find.byType(TextField);
    expect(findTextFields, findsNWidgets(2));

    final emailTextField = findTextFields.first;
    await tester.enterText(emailTextField, 'petar@gmail.com');

    final findTextSwitch = find.text('Sign in');
    expect(findTextSwitch, findsOneWidget);

    final findButton = find.byType(BaseButtonWidget);
    expect(findButton, findsOneWidget);
  });
}
