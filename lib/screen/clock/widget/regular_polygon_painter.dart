import 'package:flutter/material.dart';
import 'dart:math';

class RegularPolygonPainter extends CustomPainter {
  int sides = 12;

  RegularPolygonPainter({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final double radius = min(size.width / 2, size.height / 2);
    final double angleStep = 2 * pi / sides;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Path path = Path();
    for (int i = 0; i <= sides; i++) {
      final double angle = i * angleStep;
      final double x = center.dx + radius * cos(angle);
      final double y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RegularPolygon extends StatelessWidget {
  final int sides;

  const RegularPolygon({super.key, required this.sides});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RegularPolygonPainter(sides: sides),
      size: const Size(100, 100), // Change the size as needed
    );
  }
}
