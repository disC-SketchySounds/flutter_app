import 'dart:async';

import 'package:flutter/material.dart';
import 'drawn_line.dart';
import 'sketcher.dart';

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
  final GlobalKey _globalKey = GlobalKey(); // What does this do?

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
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Container(
        // Sets the background of the Container. The drawing should have no
        // visible background.
          color: Colors.transparent,

          // Get size of surrounding context.
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,

          child: StreamBuilder<DrawnLine>(
              stream: currentLineStreamController.stream,
              builder: (context, snapshot) {
                return CustomPaint(
                  painter: Sketcher(
                    lines: lines,
                  ),
                );
              }
          )
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
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
    print("User started drawing at point: $point");

    // Create a new line and use the only point you have to create DrawnLine.
    // Use selected color and width for stroke.
    // Update the UI with setState(). Or don't?
    setState(() {
      currentLine = DrawnLine([point], selectedColor, selectedWidth);
      currentLineStreamController.add(currentLine ?? DrawnLine.empty());
    });
  }

  /// When the user is dragging their finger without lifting it off the screen.
  void onPanUpdate(DragUpdateDetails details) {
    if (currentLine?.path.isNotEmpty ?? false) {
      final box = context.findRenderObject() as RenderBox;
      final point = box.globalToLocal(details.globalPosition);
      final List<Offset> path = (currentLine?.path ?? DrawnLine
          .empty()
          .path)
        ..add(point);
      currentLine = DrawnLine(path, selectedColor, selectedWidth);

      // TODO Create a path add new points ot the list.

      // Update UI with new line
      setState(() {
        if (lines.isEmpty) {
          lines.add(currentLine ?? DrawnLine.empty());
          currentLineStreamController.add(currentLine ?? DrawnLine.empty());
        } else {
          lines[lines.length - 1] = currentLine ?? DrawnLine.empty();
        }
      });
    } else {
      print("This should not happen? I think?");
    }
  }

  /// When the users lifts their finger off the screen.
  void onPanEnd(DragEndDetails details) {
    final List<Offset?> path = (currentLine?.path ?? [])
      ..add(null);
    setState(() {
      lines.add(currentLine ?? DrawnLine.empty());
      linesStreamController.add(lines);
      // Create a new line instance here
      currentLine = DrawnLine.empty();
      print("User stopped drawing");
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

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