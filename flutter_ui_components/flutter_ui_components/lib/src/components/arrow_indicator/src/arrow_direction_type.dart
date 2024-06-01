import 'dart:ui';

const kUpColor = Color(0xFF2A8B44);
const kDownColor = Color(0xFFAA0000);

/// Creates path to draw arrow pointing up within the specified by size [x] and size [y] area
Path _upPath(double x, double y) => Path()
  ..moveTo(0, y)
  ..lineTo(x / 2, 0)
  ..lineTo(x, y)
  ..lineTo(0, y);

/// Creates path to draw arrow pointing down within the specified by size [x] and size [y] area
Path _downPath(double x, double y) => Path()
  ..moveTo(0, 0)
  ..lineTo(x, 0)
  ..lineTo(x / 2, y)
  ..lineTo(0, 0);

/// Arrow direction (up,down)
enum ArrowDirectionType {
  /// Paint arrow up. Indicates positive credit score change
  up(kUpColor, _upPath),

  /// Paint arrow down. Indicates negative credit score change
  down(kDownColor, _downPath),
  ;

  /// Create instance of [ArrowDirectionType] with the specified [color]
  const ArrowDirectionType(this.color, this.drawPath);

  /// Holds the color in which the arrow is painted
  final Color color;

  /// Holds function to paint the arrow's path within the specified by size [x] and size [y] area
  final Path Function(double x, double y) drawPath;
}
