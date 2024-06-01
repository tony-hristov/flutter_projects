import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/components/score_ring/score_ring.dart';

import '../../shared/create_material_app.dart';

Widget _widgetUnderTest({required double score}) => createMaterialApp(SizedBox(
    height: 250,
    width: 250,
    child: Row(children: [
      ScoreRing(
        maxScore: 100,
        score: score,
        size: 200,
      ),
    ])));

void main() {
  group('ScoreRing Widget Test', () {
    testWidgets('it draws component with key', (tester) async {
      await tester.pumpWidget(_widgetUnderTest(score: 75));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('score_ring')), findsOneWidget);
    });
  });
}
