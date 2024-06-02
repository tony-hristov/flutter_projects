import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ring_painter.dart';

const _kDefaultRingColor = Color(0xFF008800);
const _kDefaultStrokeWidth = 10.0;

/// Shows
class ScoreRing extends StatelessWidget {
  /// The max possible value of the scale,
  /// so that we define a scale from 0 to [maxScore].
  final double maxScore;

  /// Score 0 to max
  final double score;

  /// Size (X and Y) of the widget to paint.
  /// It has a square shape.
  final double size;

  /// Size (X and Y) of the svg image to draw im the middle of the graphic.
  final double imageSize;

  /// Color to paint the ring with
  final Color color;

  /// Stroke with
  final double strokeWidth;

  const ScoreRing({
    required this.maxScore,
    required this.score,
    required this.size,
    required this.imageSize,
    this.color = _kDefaultRingColor,
    this.strokeWidth = _kDefaultStrokeWidth,
    super.key,
  });

  // late final _loadSvgImageFuture = _loadSvgImage();
  @override
  Widget build(BuildContext context) {
    if (score <= 0 || maxScore <= 0) {
      return const SizedBox.shrink();
    }

    if (1 == 2) {
      return Center(
        child: SvgPicture.asset(
          'assets/home.svg',
          height: imageSize,
          width: imageSize,
          package: 'flutter_ui_components',
        ),
      );
    }

    return CustomPaint(
      key: const Key('score_ring'),
      painter: RingPainter(
        color: color,
        radius: size / 2,
        strokeWidth: strokeWidth,
        sweepAngleInRadians: score / maxScore * (2 * math.pi),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: SizedBox(
          height: size,
          width: size,
          child: Center(
            child: SvgPicture.asset(
              'assets/home.svg',
              height: imageSize,
              width: imageSize,
              package: 'flutter_ui_components',
            ),
          ),
        ),
      ),
    );
  }
}
