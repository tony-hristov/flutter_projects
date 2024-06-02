import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ArrowIndicator: Positive', type: ArrowIndicator)
Widget arrowIndicator_Positive(BuildContext context) {
  return const ArrowIndicator(
    scoreChange: 1,
    size: 60,
  );
}

@widgetbook.UseCase(name: 'ArrowIndicator: Negative', type: ArrowIndicator)
Widget arrowIndicator_Negative(BuildContext context) {
  return const ArrowIndicator(
    scoreChange: -1,
    size: 60,
  );
}
