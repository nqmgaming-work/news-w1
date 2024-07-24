import 'package:flutter/material.dart';

class DigitalClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.red,
      fontSize: 60,
      fontWeight: FontWeight.bold,
      fontFamily: 'digital-7', // Sử dụng font đồng hồ kỹ thuật số
    );

    final textSpan = TextSpan(
      text: '12:34',
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DigitalClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Clock Font Example'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: DigitalClockPainter(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DigitalClock(),
  ));
}
