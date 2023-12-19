import 'dart:async';

import 'package:flutter/material.dart';
import 'drawn_line.dart';

/// A page that can be drawn on with a pen.
class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {


  List<DrawnLine> lines = <DrawnLine>[];

  DrawnLine? currentLine;
  Color selectedColor = Colors.black;
  double selectedWidth = 5.0;

  StreamController<DrawnLine> currentLineStreamController
    = StreamController<DrawnLine>.broadcast();

  Future<void> save() async {
    // TODO
  }

  Future<void> clear() async {
    // TODO
  }

  void Placeholder() {

  }

  // Event handlers for drawing.
  // Are called by `buildCurrentPath`.

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox (
      // TODO: Replace by more flexible setup
      width: 0.4 * screenSize.width,
      height: 0.6 * screenSize.height,
      child: const Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          // TODO: build the paths here
        ]
      )
    )
    );
  }
}