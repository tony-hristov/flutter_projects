import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/components/arrow_indicator/arrow_indicator.dart';

import '../../shared/create_material_app.dart';
import '../../shared/set_screen_size.dart';

const _kArrowSize = 120.0;
const _kWrapperKey = Key('credit_score_wrapper');

Widget _widgetUnderTest({required ArrowDirectionType direction}) => createMaterialApp(Container(
    key: _kWrapperKey,
    child: CustomPaint(
        painter: ArrowPainter(direction: direction),
        child: const SizedBox(height: _kArrowSize / 1.75, width: _kArrowSize))));

Future main() async {
  group('ArrowPainter Golden Test', () {
    testWidgets('positive score change', (tester) async {
      await tester.setScreenSize(width: _kArrowSize, height: _kArrowSize);
      await tester.pumpWidget(_widgetUnderTest(direction: ArrowDirectionType.up));
      await tester.pumpAndSettle();

      await expectLater(
          find.byKey(_kWrapperKey), matchesGoldenFile('goldens/arrow_painter_with_positive_score_change.png'));
    });
    testWidgets('negative score change', (tester) async {
      await tester.setScreenSize(width: _kArrowSize, height: _kArrowSize);
      await tester.pumpWidget(_widgetUnderTest(direction: ArrowDirectionType.down));
      await tester.pumpAndSettle();

      await expectLater(
          find.byKey(_kWrapperKey), matchesGoldenFile('goldens/arrow_painter_with_negative_score_change.png'));
    });
  });
}
