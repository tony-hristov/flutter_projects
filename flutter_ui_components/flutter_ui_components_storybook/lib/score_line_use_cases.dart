import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ScoreLine: Undefined Rating', type: ScoreLine)
Widget scoreLine_undefinedRating(BuildContext context) {
  return ScoreLine.creditScore(ratingIndex: -1);
}

@widgetbook.UseCase(name: 'ScoreLine: Excellent Rating', type: ScoreLine)
Widget scoreLine_excellenRating(BuildContext context) {
  return ScoreLine.creditScore(ratingIndex: 4);
}

@widgetbook.UseCase(name: 'ScoreLine: Good Rating', type: ScoreLine)
Widget scoreLine_goodRating(BuildContext context) {
  return ScoreLine.creditScore(ratingIndex: 3);
}

@widgetbook.UseCase(name: 'ScoreLine: Fair Rating', type: ScoreLine)
Widget scoreLine_fairRating(BuildContext context) {
  return ScoreLine.creditScore(ratingIndex: 2);
}

@widgetbook.UseCase(name: 'ScoreLine: Poor Rating', type: ScoreLine)
Widget scoreLine_poorRating(BuildContext context) {
  return ScoreLine.creditScore(ratingIndex: 1);
}

@widgetbook.UseCase(name: 'ScoreLine: Very Poor Rating', type: ScoreLine)
Widget scoreLine_veryPoorRating(BuildContext context) {
  return ScoreLine.creditScore(ratingIndex: 0);
}
