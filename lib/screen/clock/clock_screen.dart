import 'package:first_pj/constants/font_constants.dart';
import 'package:first_pj/screen/clock/widget/time_text.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(57, 56, 56, 0.9019607843137255),
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            '00:00',
            style: TextStyle(
                fontFamily: FontConstants.e1234,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 70,
                color: Colors.grey.withOpacity(0.5)),
          ),
          TimeText(),
        ],
      )),
    );
  }
}
