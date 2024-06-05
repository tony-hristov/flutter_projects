// ignore_for_file: unused_local_variable

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ring_direction_type.dart';
import 'ring_painter_helpers.dart';

class RingPainter extends CustomPainter {
  /// Radius of the circle
  final double radius;

  /// The sweep angle in radians
  final double sweepAngleInRadians;

  /// Stroke with
  final double strokeWidth;

  /// Color to paint the ring with
  final Color strokeColor;

  /// An optional color for the background full circle
  final Color? strokeFullCircleColor;

  /// Direction to paint the ring, default to [RingDirectionType.clockwise]
  final RingDirectionType ringDirectionType;

  RingPainter({
    required this.radius,
    required this.sweepAngleInRadians,
    required this.strokeWidth,
    required this.strokeColor,
    this.strokeFullCircleColor,
    this.ringDirectionType = RingDirectionType.clockwise,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth = strokeWidth;
    paint.color = strokeColor;
    paint.style = PaintingStyle.stroke;

    if (strokeFullCircleColor != null) {
      paint.color = strokeFullCircleColor!;
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius - strokeWidth, paint);
    }

    // Draw the arc
    paint.color = strokeColor;
    canvas.drawArc(
      Rect.fromLTRB(0 + strokeWidth, 0 + strokeWidth, size.width - strokeWidth, size.height - strokeWidth),
      (ringDirectionType == RingDirectionType.clockwise)
          ? kStartAngleInRadians
          : kStartAngleInRadians - sweepAngleInRadians,
      sweepAngleInRadians,
      false,
      paint,
    );

    // When less that full circle, make the stroke rounded
    if (sweepAngleInRadians < kFullCircleInRadians) {
      paint.strokeWidth = strokeWidth / 2;
      // Make the start of the arc rounded
      canvas.drawCircle(Offset(size.width / 2 + 2, 0 + strokeWidth), strokeWidth / 4, paint);

      // Find the coordinates of the point where the arc ends. Add some little extra angle.
      double endPointAngleInRadians = sweepAngleInRadians + degreeToRadian(4);
      double arcEndX = radius + math.cos(kStartAngleInRadians - endPointAngleInRadians) * (radius - strokeWidth);
      if (ringDirectionType == RingDirectionType.clockwise) {
        arcEndX = radius * 2 + -arcEndX;
      }

      final arcEndY = radius + math.sin(kStartAngleInRadians - endPointAngleInRadians) * (radius - strokeWidth);

      // Draw a circle at the end
      paint.strokeWidth = strokeWidth / 1.5;
      canvas.drawCircle(
        Offset(arcEndX, arcEndY),
        strokeWidth / 1.2,
        paint,
      );
    }
  }

  /// Repaint when arrow direction has changed
  @override
  bool shouldRepaint(RingPainter oldDelegate) =>
      oldDelegate.strokeColor != strokeColor ||
      oldDelegate.radius != radius ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.sweepAngleInRadians != sweepAngleInRadians;
}
