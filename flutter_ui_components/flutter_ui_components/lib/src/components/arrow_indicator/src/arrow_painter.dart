import 'package:flutter/material.dart';

import 'arrow_direction_type.dart';

/// Pains an arrow in the specified [direction]
class ArrowPainter extends CustomPainter {
  /// Direction of the arrow (up,down)
  final ArrowDirectionType direction;

  ArrowPainter({required this.direction});

  /// Paints an arrow inside a [canvas] with specified [size] in the provided [direction]
  @override
  void paint(Canvas canvas, Size size) {
    final path = direction.drawPath(size.width, size.height);
    final paint = Paint()..color = direction.color;
    canvas.drawPath(path, paint);
  }

  /// Repaint when arrow direction has changed
  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => oldDelegate.direction != direction;
}
