import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/components/arrow_indicator/arrow_indicator.dart';

import '../../shared/create_material_app.dart';

Widget _widgetUnderTest({required int scoreChange}) => createMaterialApp(SizedBox(
    height: 150,
    width: 150,
    child: Row(children: [
      ArrowIndicator(
        scoreChange: scoreChange,
        size: 60,
      ),
    ])));

void main() {
  group('ArrowIndicator Widget Test', () {
    testWidgets('it draws component with key', (tester) async {
      await tester.pumpWidget(_widgetUnderTest(scoreChange: 10));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('arrow_indicator')), findsOneWidget);
    });
  });
}
