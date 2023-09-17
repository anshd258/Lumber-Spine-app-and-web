import 'dart:math';

import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:flutter/material.dart';

class CircleProgress1 extends CustomPainter {
  final strokeCircle = 20.0;
  late double currentProgress;

  CircleProgress1(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = greenGradient
      ..color = const Color.fromARGB(255, 235, 194, 243)
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - strokeCircle / 2;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      // ..color = orangeGradient
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.purple,
          Colors.red,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    // double angle = 2 * pi * (currentProgress / 100);
    double angle = 1;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi, angle,
        false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
