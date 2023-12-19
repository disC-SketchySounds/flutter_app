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

  // Properties
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine? currentLine;
  Color selectedColor = Colors.black;
  double selectedWidth = 5.0;


  //  Stream controllers
  StreamController<DrawnLine> currentLineStreamController
    = StreamController<DrawnLine>.broadcast();

  StreamController<List<DrawnLine>> linesStreamController
  = StreamController<List<DrawnLine>>.broadcast();


  Future<void> save() async {
    // TODO
  }

  Future<void> clear() async {
    // TODO
  }

  GestureDetector buildCurrentPath(BuildContext context) {
    throw UnimplementedError('Not implemented yet');
    // TODO
  }

  Widget buildAllPaths(BuildContext context) {
    throw UnimplementedError('Not implemeted yet');
    // TODO
  }


  // Event handlers for drawing.
  // Are called by `buildCurrentPath`.

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildAllPaths(context),
          buildCurrentPath(context),
        ],
      )
    );
  }

  @override
  void dispose() {
    linesStreamController.close();
    currentLineStreamController.close();
    super.dispose();
  }
}