import 'dart:math';

import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter {
  final int timeRemaining;
  final int totalTime;

  TimerPainter({
    required this.timeRemaining,
    required this.totalTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 15.0;
    final double radius = size.width / 2.5;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius - strokeWidth / 2, paint);

    final double percentage = timeRemaining / totalTime;

    final arcPaint = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double arcAngle = 2 * pi * percentage;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -pi / 2,
      arcAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
