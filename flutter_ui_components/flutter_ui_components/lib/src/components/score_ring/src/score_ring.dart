import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ring_direction_type.dart';
import 'ring_painter.dart';
import 'ring_painter_helpers.dart';

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

  /// Stroke with
  final double strokeWidth;

  /// Color to paint the ring with
  final Color strokeColor;

  /// An optional color for the background full circle
  final Color? strokeFullCircleColor;

  /// Direction to paint the ring
  final RingDirectionType ringDirectionType;

  /// Optional SVG asset name for picture to put in the center of the graphic
  final String iconSgvAssetName;

  const ScoreRing({
    required this.maxScore,
    required this.score,
    required this.size,
    required this.imageSize,
    this.strokeWidth = _kDefaultStrokeWidth,
    this.strokeColor = _kDefaultRingColor,
    this.strokeFullCircleColor,
    this.ringDirectionType = RingDirectionType.clockwise,
    String? iconSgvAssetName,
    super.key,
  }) : iconSgvAssetName = iconSgvAssetName ?? '';

  // late final _loadSvgImageFuture = _loadSvgImage();
  @override
  Widget build(BuildContext context) {
    if (score <= 0 || maxScore <= 0) {
      return const SizedBox.shrink();
    }

    return CustomPaint(
      key: const Key('score_ring'),
      painter: RingPainter(
        radius: size / 2,
        sweepAngleInRadians: sweepAngleInRadians(score, maxScore),
        strokeWidth: strokeWidth,
        strokeColor: strokeColor,
        strokeFullCircleColor: strokeFullCircleColor,
        ringDirectionType: ringDirectionType,
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
        child: SizedBox(
          height: size,
          width: size,
          child: (iconSgvAssetName.isNotEmpty)
              ? Center(
                  child: SvgPicture.asset(
                    iconSgvAssetName,
                    height: imageSize,
                    width: imageSize,
                    package: 'flutter_ui_components',
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
