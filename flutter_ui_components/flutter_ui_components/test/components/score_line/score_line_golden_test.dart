import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/components/score_line/score_line.dart';

import '../../shared/create_material_app.dart';
import '../../shared/set_screen_size.dart';

const _kHeight = 50.0;
const _kWidth = 300.0;
const _kWrapperKey = Key('score_line_wrapper');

Widget _widgetUnderTest({required int ratingIndex}) => createMaterialApp(Row(
      key: _kWrapperKey,
      children: [ScoreLine.creditScore(ratingIndex: ratingIndex)],
    ));

void main() {
  group('ScoreLine Golden Test', () {
    testWidgets('undefined rating', (tester) async {
      await tester.setScreenSize(width: _kWidth, height: _kHeight);
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: -1));
      await tester.pumpAndSettle();

      await expectLater(find.byKey(_kWrapperKey), matchesGoldenFile('goldens/score_line_with_undefined_score.png'));
    });
    testWidgets('excellent rating', (tester) async {
      await tester.setScreenSize(width: _kWidth, height: _kHeight);
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 4));
      await tester.pumpAndSettle();

      await expectLater(find.byKey(_kWrapperKey), matchesGoldenFile('goldens/score_line_with_excellent_score.png'));
    });
    testWidgets('good rating', (tester) async {
      await tester.setScreenSize(width: _kWidth, height: _kHeight);
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 3));
      await tester.pumpAndSettle();

      await expectLater(find.byKey(_kWrapperKey), matchesGoldenFile('goldens/score_line_with_good_score.png'));
    });
    testWidgets('fair rating', (tester) async {
      await tester.setScreenSize(width: _kWidth, height: _kHeight);
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 2));
      await tester.pumpAndSettle();

      await expectLater(find.byKey(_kWrapperKey), matchesGoldenFile('goldens/score_line_with_fair_score.png'));
    });
    testWidgets('poor rating', (tester) async {
      await tester.setScreenSize(width: _kWidth, height: _kHeight);
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 1));
      await tester.pumpAndSettle();

      await expectLater(find.byKey(_kWrapperKey), matchesGoldenFile('goldens/score_line_with_poor_score.png'));
    });
    testWidgets('veryPoor rating', (tester) async {
      await tester.setScreenSize(width: _kWidth, height: _kHeight);
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 1));
      await tester.pumpAndSettle();

      await expectLater(find.byKey(_kWrapperKey), matchesGoldenFile('goldens/score_line_with_veryPoor_score.png'));
    });
  });
}
