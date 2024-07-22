import 'package:first_pj/constants/font_constants.dart';
import 'package:first_pj/screen/clock/widget/time_text.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key, required this.backgroundImage});
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            // Replace with your image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 350),
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
                const TimeText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
