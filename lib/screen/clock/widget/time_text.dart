import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../../../constants/font_constants.dart';

class TimeText extends StatefulWidget {
  const TimeText({super.key});

  @override
  State<TimeText> createState() {
    return _TimeTextState();
  }
}

class _TimeTextState extends State<TimeText> {
  late String _timeString = _formatDateTime(DateTime.now());
  late Timer _timer;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _timeString = _formatDateTime(DateTime.now());
      _opacity = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 500),
      child: Text(
        _timeString,
        style: TextStyle(
            fontFamily: FontConstants.e1234,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            fontSize: 70,
            color: Colors.white.withOpacity(0.9)),
      ),
    );
  }
}
