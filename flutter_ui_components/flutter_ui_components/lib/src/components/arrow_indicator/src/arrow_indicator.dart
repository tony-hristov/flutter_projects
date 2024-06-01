import 'package:flutter/material.dart';

import 'arrow_direction_type.dart';
import 'arrow_painter.dart';

/// Components that shows an arrow indicator for score change.
/// Shows green arrow pointing up when score changed in a positive way.
/// Shows red arrow pointing down when score changed in a negative way.
/// Shows nothing if the score did not change.
/// It uses the [ArrowPainter] to build paint the arrow
class ArrowIndicator extends StatelessWidget {
  /// Score change - negative or positive
  final int scoreChange;

  /// Size (X and Y) of the widget to paint.
  /// It has a square shape.
  final double size;

  const ArrowIndicator({
    required this.scoreChange,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (scoreChange == 0) {
      return const SizedBox.shrink();
    }

    final direction = scoreChange >= 0 ? ArrowDirectionType.up : ArrowDirectionType.down;

    return CustomPaint(
      key: const Key('arrow_indicator'),
      painter: ArrowPainter(direction: direction),
      child: SizedBox(
        height: size / 1.75,
        width: size,
      ),
    );
  }
}
