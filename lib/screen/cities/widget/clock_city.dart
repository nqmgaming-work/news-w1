import 'package:first_pj/data/model/clock_timer.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ClockCity extends StatefulWidget {
  final ClockTimer clockTimer;

  const ClockCity({super.key, required this.clockTimer});

  @override
  State<ClockCity> createState() => _ClockCityState();
}

class _ClockCityState extends State<ClockCity> {
  late Timer _timer;
  late String _timeString;
  late String _currentDay;

  @override
  void initState() {
    super.initState();
    _timeString = widget.clockTimer.timeString;
    _currentDay = widget.clockTimer.dayString;
    _timer =
        Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _timeString = widget.clockTimer.timeString;
      _currentDay = widget.clockTimer.dayString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        color: Colors.grey[200],
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          style: ListTileStyle.list,
          title: Text(
            widget.clockTimer.cityName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("GTM ${widget.clockTimer.timeZone} hours behind"),
          leading: const Icon(Icons.access_time),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _timeString,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _currentDay,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
