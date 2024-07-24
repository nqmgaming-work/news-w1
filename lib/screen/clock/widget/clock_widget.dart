import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class ClockPainter extends CustomPainter {
  final DateTime time;

  ClockPainter({required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width / 2, size.height / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Paint circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final Paint handPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    // Draw clock circle
    canvas.drawCircle(center, radius, circlePaint);

    // Draw hour marks
    for (int i = 0; i < 12; i++) {
      final double angle = 2 * pi * i / 12;
      final double x1 = center.dx + radius * cos(angle);
      final double y1 = center.dy + radius * sin(angle);
      final double x2 = center.dx + (radius - 10) * cos(angle);
      final double y2 = center.dy + (radius - 10) * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), circlePaint);
    }

    // Draw hour hand
    final double hourAngle = 2 * pi * (time.hour % 12) / 12 + 2 * pi * (time.minute / 60) / 12;
    final double hourHandX = center.dx + (radius - 40) * cos(hourAngle - pi / 2);
    final double hourHandY = center.dy + (radius - 40) * sin(hourAngle - pi / 2);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), handPaint..strokeWidth = 5.0);

    // Draw minute hand
    final double minuteAngle = 2 * pi * time.minute / 60;
    final double minuteHandX = center.dx + (radius - 20) * cos(minuteAngle - pi / 2);
    final double minuteHandY = center.dy + (radius - 20) * sin(minuteAngle - pi / 2);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), handPaint..strokeWidth = 3.0);

    // Draw second hand
    final Paint secondHandPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final double secondAngle = 2 * pi * time.second / 60;
    final double secondHandX = center.dx + (radius - 10) * cos(secondAngle - pi / 2);
    final double secondHandY = center.dy + (radius - 10) * sin(secondAngle - pi / 2);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondHandPaint);

    // Draw center point
    final Paint centerPointPaint = Paint()..color = Colors.black;
    canvas.drawCircle(center, 5.0, centerPointPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockPainter(time: _currentTime),
      size: const Size(200, 200), // Adjust size as needed
    );
  }
}