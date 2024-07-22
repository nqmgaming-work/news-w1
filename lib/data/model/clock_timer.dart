import 'package:intl/intl.dart';

class ClockTimer {
  final int id;
  final String cityName;
  final int time;
  final String timeZone;

  ClockTimer({
    required this.id,
    required this.cityName,
    required this.time,
    required this.timeZone,
  });

  // list sample data
  static List<ClockTimer> list = [
    ClockTimer(id: 1, cityName: 'Hà Nội', time: 7, timeZone: '+7'),
    ClockTimer(id: 2, cityName: 'New York', time: -5, timeZone: '-5'),
    ClockTimer(id: 3, cityName: 'London', time: 0, timeZone: '0'),
    ClockTimer(id: 4, cityName: 'Tokyo', time: 9, timeZone: '+9'),
    ClockTimer(id: 5, cityName: 'Sydney', time: 10, timeZone: '+10'),
  ];

  // convert time to string
  String get timeString {
    final now = DateTime.now();
    final nowUtc = now.toUtc();
    final nowLocal = nowUtc.add(Duration(hours: time));
    return DateFormat('HH:mm').format(nowLocal);
  }

  // get current day with format: dd/MM/yyyy and day of week
  String get dayString {
    final now = DateTime.now();
    final nowUtc = now.toUtc();
    final nowLocal = nowUtc.add(Duration(hours: time));
    return DateFormat('dd/MM/yyyy').format(nowLocal);
  }
}
