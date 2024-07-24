import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'digital_clock_painter.dart';

class TimeText extends StatefulWidget {
  const TimeText({super.key});

  @override
  State<TimeText> createState() {
    return _TimeTextState();
  }
}

class _TimeTextState extends State<TimeText>
    with SingleTickerProviderStateMixin {
  late String _timeString = _formatDateTime(DateTime.now());
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Bắt đầu animation ngay khi initState
    _animationController.repeat(reverse: true);
  }

  void _updateTime() {
    setState(() {
      _timeString = _formatDateTime(DateTime.now());
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('mm:ss').format(dateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Padding(
            padding: const EdgeInsets.only(left: 19.0, right: 6),
            child: SizedBox(
              width: 150,
              height: 100,
              child: CustomPaint(
                size: const Size(300, 200),
                painter: DigitalClockPainter(time: _timeString),
              ),
            ),
          ),
        );
      },
    );
  }
}
