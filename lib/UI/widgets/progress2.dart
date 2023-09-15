import 'dart:math';

import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleProgress2 extends CustomPainter {
  final strokeCircle = 20.0;
  late double currentProgress;

  CircleProgress2(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = blueGradient
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    // double radius = 120;
    double radius = size.width / 2 - strokeCircle / 2;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = redGradient
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
