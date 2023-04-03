import 'package:flutter/material.dart';

class CreditScoreChangeIndicator extends StatelessWidget {
  final int scoreChange;
  const CreditScoreChangeIndicator({required this.scoreChange, super.key});

  @override
  Widget build(BuildContext context) {
    if (scoreChange == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        _ArrowIndicator(up: scoreChange > 0, size: 15),
        Text(
          scoreChange.abs().toString(),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

class _ArrowIndicator extends StatelessWidget {
  final bool up;
  final double size;
  const _ArrowIndicator({required this.up, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArrowPainter(up: up),
      child: SizedBox(
        height: size / 1.75,
        width: size,
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  static const _kUpColor = Color(0xff2a8b44);
  static const _kDownColor = Color(0xffaa0000);

  final bool up;

  _ArrowPainter({required this.up});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = up ? _upPath(size.width, size.height) : _downPath(size.width, size.height);
    Paint paint = Paint()..color = up ? _kUpColor : _kDownColor;
    canvas.drawPath(path, paint);
  }

  Path _upPath(double x, double y) => Path()
    ..moveTo(0, y)
    ..lineTo(x / 2, 0)
    ..lineTo(x, y)
    ..lineTo(0, y);

  Path _downPath(double x, double y) => Path()
    ..moveTo(0, 0)
    ..lineTo(x, 0)
    ..lineTo(x / 2, y)
    ..lineTo(0, 0);

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) => oldDelegate.up != up;
}
