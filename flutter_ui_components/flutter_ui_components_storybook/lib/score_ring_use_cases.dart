import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ScoreRing: Default', type: ScoreRing)
Widget scoreRing_default(BuildContext context) {
  const kScoreRingWidgetSize = 256.0;
  const kImageSize = 124.0;
  const kStrokeWith = 16.0;

  return const ScoreRing(
    maxScore: 100,
    score: 85,
    size: kScoreRingWidgetSize,
    strokeWidth: kStrokeWith,
    imageSize: kImageSize,
  );
}
