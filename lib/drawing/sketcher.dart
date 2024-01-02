import 'dart:ui';

import 'drawn_line.dart';
import 'package:flutter/material.dart';

class Sketcher extends CustomPainter {
  final List<DrawnLine> lines;
  final DrawnLine? currentLine;

  Sketcher({required this.lines, this.currentLine});

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      drawLine(canvas, line);
    }
    if (currentLine != null) {
      drawLine(canvas, currentLine!);
    }
  }

  void drawLine(Canvas canvas, DrawnLine line) {
    var paint = Paint()
      ..color = line.color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = line.width;
    canvas.drawPoints(PointMode.polygon, line.path, paint);
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}
