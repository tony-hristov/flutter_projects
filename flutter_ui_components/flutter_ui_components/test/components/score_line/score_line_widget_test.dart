import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/components/score_line/score_line.dart';

import '../../shared/create_material_app.dart';

final List<ScoreData> _kRatingsList = List.unmodifiable([
  const ScoreData(color: Color(0xFFAA0000), semanticLabel: 'Very Poor'),
  const ScoreData(color: Color(0xFFE38D1C), semanticLabel: 'Poor'),
  const ScoreData(color: Color(0xFFFFC229), semanticLabel: 'Fair'),
  const ScoreData(color: Color(0xFF008800), semanticLabel: 'Good'),
  const ScoreData(color: Color(0xFF005216), semanticLabel: 'Excellent'),
]);

Widget _widgetUnderTest({required int ratingIndex}) => createMaterialApp(SizedBox(
    height: 100,
    width: 300,
    child: Row(children: [
      ScoreLine(
        ratingsList: _kRatingsList,
        ratingIndex: ratingIndex,
      ),
    ])));

void main() {
  group('ScoreLine Widget Test', () {
    testWidgets('it draws component with key', (tester) async {
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: -1));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('score_line')), findsOneWidget);
    });
    testWidgets('it draws all rating sections', (tester) async {
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 4));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('score_line_rating_0')), findsOneWidget);
      expect(find.byKey(const Key('score_line_rating_1')), findsOneWidget);
      expect(find.byKey(const Key('score_line_rating_2')), findsOneWidget);
      expect(find.byKey(const Key('score_line_rating_3')), findsOneWidget);
      expect(find.byKey(const Key('score_line_rating_4')), findsOneWidget);

      // "undefined" enum value never draws to the graphic line
      expect(find.byKey(const Key('credit_score_line_rating_CreditRatingType.undefined')), findsNothing);
    });
    testWidgets('when valid current score rating is provided, that rating is shown as current', (tester) async {
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 4));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('score_line_rating_0_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_1_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_2_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_3_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_4_current')), findsOneWidget);
    });
    testWidgets('when no valid current score rating is provided, no rating is shown as current', (tester) async {
      await tester.pumpWidget(_widgetUnderTest(ratingIndex: 5));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('score_line_rating_0_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_1_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_2_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_3_current')), findsNothing);
      expect(find.byKey(const Key('score_line_rating_4_current')), findsNothing);
    });
  });
}
