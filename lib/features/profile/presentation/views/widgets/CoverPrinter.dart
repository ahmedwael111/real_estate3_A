

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    // Wave 1
    final path1 = Path()
      ..moveTo(0, size.height * 0.55)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.35,
          size.width * 0.5, size.height * 0.55)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.75,
          size.width, size.height * 0.55)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path1, paint);

    // Wave 2
    final paint2 = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;
    final path2 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.3, size.height * 0.5,
          size.width * 0.6, size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.8, size.height * 0.85,
          size.width, size.height * 0.65)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path2, paint2);

    // Decorative circles
    final circlePaint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.2), 50, circlePaint);
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.15), 35, circlePaint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => false;
}