import 'dart:math';
import 'package:flutter/material.dart';

class Onboarding2btn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2 - 3;
    final Offset center = Offset(size.width / 2, size.height / 2);

    List<Color> segmentColors = [
      Colors.amber,
      Colors.amber,
      Colors.amber.shade100
    ];

    double startAngle = -pi / 2;
    double sweepAngle = (2 * pi) / 3;
    double gapAngle = 0.35; // Gap between segments

    for (int i = 0; i < 3; i++) {
      paint.color = segmentColors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + gapAngle / 2,
        sweepAngle - gapAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}