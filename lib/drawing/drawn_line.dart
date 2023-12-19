import 'package:flutter/material.dart';

/// A single line of the sketch drawn by the user.
class DrawnLine {
  final List<Offset> path;
  final Color color;
  final double width;

  DrawnLine(this.path, this.color, this.width);

  // Factory method to create an empty line
  // Necessary to handle nullability properly
  factory DrawnLine.empty() {
    return DrawnLine([], Colors.transparent, 1.0);
  }
}
