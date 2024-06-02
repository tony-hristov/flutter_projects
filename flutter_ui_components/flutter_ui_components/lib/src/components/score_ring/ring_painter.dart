import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Points to the top of the drawing circle from where to start painting the arc
const _kStartAngleInRadians = 0 - math.pi / 2;

class RingPainter extends CustomPainter {
  /// Color to paint the ring with
  final Color color;

  /// Radius of the circle
  final double radius;

  /// Stroke with
  final double strokeWidth;

  /// The sweep angle in radians
  final double sweepAngleInRadians;

  RingPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
    required this.sweepAngleInRadians,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    paint.style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromLTRB(0 + strokeWidth, 0 + strokeWidth, size.width - strokeWidth, size.height - strokeWidth),
      _kStartAngleInRadians,
      sweepAngleInRadians,
      false,
      paint,
    );

    paint.strokeWidth = strokeWidth / 2;
    canvas.drawCircle(Offset(size.width / 2 + 3, 0 + strokeWidth), strokeWidth / 4, paint);
  }

  /// Repaint when arrow direction has changed
  @override
  bool shouldRepaint(RingPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.radius != radius ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.sweepAngleInRadians != sweepAngleInRadians;
}
