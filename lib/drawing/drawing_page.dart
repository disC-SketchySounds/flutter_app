import 'dart:async';

import 'package:flutter/material.dart';
import 'drawn_line.dart';
import 'sketcher.dart';

/// A page that can be drawn on with a pen.
class DrawingPage extends StatefulWidget {
  final Color selectedColor;
  final double selectedWidth;

  const DrawingPage(
      {super.key, required this.selectedColor, required this.selectedWidth});

  @override
  DrawingPageState createState() => DrawingPageState();
}

class DrawingPageState extends State<DrawingPage> {
  // Properties
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine? currentLine;
  final GlobalKey _globalKey = GlobalKey(); // What does this do?

  //  Stream controllers
  StreamController<DrawnLine> currentLineStreamController =
      StreamController<DrawnLine>.broadcast();

  StreamController<List<DrawnLine>> linesStreamController =
      StreamController<List<DrawnLine>>.broadcast();

  Future<void> save() async {
    // TODO
  }

  Future<void> clear() async {
    // TODO
  }

  GestureDetector buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Container(
        // Sets the background of the Container. The drawing should have no
        // visible background.
        color: Colors.transparent,

        // Get size of surrounding context.
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<DrawnLine>(
          stream: currentLineStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
                currentLine: currentLine,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<List<DrawnLine>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    );
  }

  // Event handlers for drawing.
  // Are called by `buildCurrentPath`.

  /// When the user touches the screen and starts dragging their finger around
  /// it.
  void onPanStart(DragStartDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    // Create a new line and use the only point you have to create DrawnLine.
    // Use selected color and width for stroke.
    // Update the UI with setState(). Or don't?
    setState(
      () {
        currentLine =
            DrawnLine([point], widget.selectedColor, widget.selectedWidth);
        currentLineStreamController.add(currentLine ?? DrawnLine.empty());
      },
    );
  }

  /// When the user is dragging their finger without lifting it off the screen.
  void onPanUpdate(DragUpdateDetails details) {
    if (currentLine != null) {
      final box = context.findRenderObject() as RenderBox;
      final point = box.globalToLocal(details.globalPosition);

      setState(() {
        currentLine?.path.add(point);
        currentLineStreamController.add(currentLine!);
      });
    }
  }

  /// When the users lifts their finger off the screen.
  void onPanEnd(DragEndDetails details) {
    if (currentLine != null && currentLine!.path.isNotEmpty) {
      setState(
        () {
          lines.add(currentLine!);
          linesStreamController.add(lines);
          currentLine =
              DrawnLine([], widget.selectedColor, widget.selectedWidth);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildAllPaths(context),
          buildCurrentPath(context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    linesStreamController.close();
    currentLineStreamController.close();
    super.dispose();
  }
}
