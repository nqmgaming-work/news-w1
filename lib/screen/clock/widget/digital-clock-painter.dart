import 'package:flutter/material.dart';

class DigitalClockPainter extends CustomPainter {
  final String time;
  final Color color;

  DigitalClockPainter({required this.time, this.color = Colors.black});

  final segmentMap = [
    [true, true, true, false, true, true, true], // 0
    [false, false, true, false, false, true, false], // 1
    [true, false, true, true, true, false, true], // 2
    [true, false, true, true, false, true, true], // 3
    [false, true, true, true, false, true, false], // 4
    [true, true, false, true, false, true, true], // 5
    [true, true, false, true, true, true, true], // 6
    [true, false, true, false, false, true, false], // 7
    [true, true, true, true, true, true, true], // 8
    [true, true, true, true, false, true, true], // 9
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    final segmentLength = size.width / 6; // Adjusted for more spacing
    final segmentThickness = size.height / 20;
    final digitWidth = size.width / 4;
    final digitHeight = size.height / 2;
    const digitSpacing = 10.0; // Space between digits
    const colonSize = 8.0; // Size of the square dots for colon

    void drawSegment(int segment, Offset offset) {
      final Path path = Path();
      switch (segment) {
        case 0: // Top horizontal
          path.moveTo(offset.dx, offset.dy);
          path.lineTo(offset.dx + segmentLength, offset.dy);
          path.lineTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + segmentThickness);
          path.lineTo(
              offset.dx + segmentThickness, offset.dy + segmentThickness);
          path.close();
          break;
        case 1: // Top-left vertical
          path.moveTo(offset.dx, offset.dy);
          path.lineTo(
              offset.dx + segmentThickness, offset.dy + segmentThickness);
          path.lineTo(offset.dx + segmentThickness,
              offset.dy + digitHeight / 2 - segmentThickness);
          path.lineTo(offset.dx, offset.dy + digitHeight / 2);
          path.close();
          break;
        case 2: // Top-right vertical
          path.moveTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + segmentThickness);
          path.lineTo(offset.dx + segmentLength, offset.dy);
          path.lineTo(offset.dx + segmentLength, offset.dy + digitHeight / 2);
          path.lineTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + digitHeight / 2 - segmentThickness);
          path.close();
          break;
        case 3: // Middle horizontal
          path.moveTo(
              offset.dx, offset.dy + digitHeight / 2 - segmentThickness / 2);
          path.lineTo(offset.dx + segmentLength,
              offset.dy + digitHeight / 2 - segmentThickness / 2);
          path.lineTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + digitHeight / 2 + segmentThickness / 2);
          path.lineTo(offset.dx + segmentThickness,
              offset.dy + digitHeight / 2 + segmentThickness / 2);
          path.close();
          break;
        case 4: // Bottom-left vertical
          path.moveTo(offset.dx, offset.dy + digitHeight / 2);
          path.lineTo(offset.dx + segmentThickness,
              offset.dy + digitHeight / 2 + segmentThickness);
          path.lineTo(offset.dx + segmentThickness,
              offset.dy + digitHeight - segmentThickness);
          path.lineTo(offset.dx, offset.dy + digitHeight);
          path.close();
          break;
        case 5: // Bottom-right vertical
          path.moveTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + digitHeight / 2 + segmentThickness);
          path.lineTo(offset.dx + segmentLength, offset.dy + digitHeight / 2);
          path.lineTo(offset.dx + segmentLength, offset.dy + digitHeight);
          path.lineTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + digitHeight - segmentThickness);
          path.close();
          break;
        case 6: // Bottom horizontal
          path.moveTo(offset.dx, offset.dy + digitHeight);
          path.lineTo(offset.dx + segmentThickness,
              offset.dy + digitHeight - segmentThickness);
          path.lineTo(offset.dx + segmentLength - segmentThickness,
              offset.dy + digitHeight - segmentThickness);
          path.lineTo(offset.dx + segmentLength, offset.dy + digitHeight);
          path.close();
          break;
      }
      canvas.drawPath(path, paint);
    }

    void drawDigit(int digit, Offset offset) {
      for (int i = 0; i < 7; i++) {
        if (segmentMap[digit][i]) {
          drawSegment(i, offset);
        }
      }
    }

    void drawColon(Offset offset) {
      final rect1 =
          Rect.fromLTWH(offset.dx - 5, offset.dy + 10, colonSize, colonSize);
      final rect2 = Rect.fromLTWH(
          offset.dx - 5, offset.dy + 2 * colonSize + 10, colonSize, colonSize);
      canvas.drawRect(rect1, paint);
      canvas.drawRect(rect2, paint);
    }

    // Tính toán tổng chiều rộng của đồng hồ
    double totalWidth = 0;
    for (int i = 0; i < time.length; i++) {
      if (time[i] == ':') {
        totalWidth +=
            colonSize + digitSpacing; // Cộng thêm khoảng cách cho dấu hai chấm
      } else {
        totalWidth += digitWidth;
        // Chỉ cộng khoảng cách nếu không phải là chữ số cuối cùng
        if (i < time.length - 1) {
          totalWidth += digitSpacing;
        }
      }
    }
    // Căn giữa đồng hồ theo chiều ngang
    double currentX = (size.width - totalWidth) / 2;

    // Vẽ từng chữ số và dấu hai chấm
    for (int i = 0; i < time.length; i++) {
      if (time[i] == ':') {
        drawColon(Offset(currentX, size.height / 4));
        currentX += colonSize + digitSpacing; // Increase spacing for colon
      } else {
        int digit = int.parse(time[i]);
        drawDigit(digit, Offset(currentX, size.height / 4));
        currentX += digitWidth;
        if (i < time.length - 1) {
          currentX += digitSpacing;
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
