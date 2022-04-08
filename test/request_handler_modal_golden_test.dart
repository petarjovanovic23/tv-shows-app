import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tv_shows/widgets/material_app_and_scaffold.dart';
import 'package:tv_shows/widgets/modals/request_handler_modal.dart';

void main() {
  testGoldens('testing the request modal', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpWidget(
      MaterialAppAndScaffold(
        child: Builder(
          builder: (context) => RequestHandlerModal('Success!', context),
        ),
      ),
    );

    await screenMatchesGolden(tester, 'request_handler_modal');
  });
}
