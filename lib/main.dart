import 'package:first_pj/screen/clock/clock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MaterialApp(
    home: ClockScreen(),
  ));
}
