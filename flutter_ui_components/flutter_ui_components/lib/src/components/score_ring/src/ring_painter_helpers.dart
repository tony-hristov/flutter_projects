import 'dart:math' as math;

/// Points to the top of the drawing circle from where to start painting the arc
const kStartAngleInRadians = 0 - math.pi / 2;

/// Full circle in radians
const kFullCircleInRadians = 2 * math.pi;

/// Converts degree to radian
double degreeToRadian(double degree) => degree * math.pi / 180;

/// Sweep angle in radians based on [score] and [maxScore]
double sweepAngleInRadians(double score, double maxScore) => score / maxScore * kFullCircleInRadians;
