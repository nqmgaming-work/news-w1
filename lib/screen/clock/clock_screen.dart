import 'package:first_pj/screen/clock/widget/clock_widget.dart';
import 'package:first_pj/screen/clock/widget/digital_clock_painter.dart';
import 'package:first_pj/screen/clock/widget/regular_polygon_painter.dart';
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            // Replace with your image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 350),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 6),
                      child: CustomPaint(
                        size: const Size(150, 100),
                        painter: DigitalClockPainter(
                            time: '00:00', color: Colors.grey),
                      ),
                    ),
                    const TimeText(),
                  ],
                ),
                const Expanded(child: ClockWidget()),
                const RegularPolygon(sides: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
