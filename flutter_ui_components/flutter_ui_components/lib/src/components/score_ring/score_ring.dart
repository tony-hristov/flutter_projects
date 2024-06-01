import 'package:flutter/material.dart';

const kRingColor = Color(0x008800FF);

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

  /// Color to paint the ring with
  final Color color;

  /// Optional widget (image usually) to place in the center
  final Widget? image;

  const ScoreRing({
    required this.maxScore,
    required this.score,
    required this.size,
    this.color = kRingColor,
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (score <= 0 || maxScore <= 0) {
      return const SizedBox.shrink();
    }
    return CustomPaint(
      key: const Key('score_ring'),
      painter: null, // TODO
      child: SizedBox(
        height: size,
        width: size,
        child: image,
      ),
    );
  }
}
