import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/drawing/drawing_page.dart';
import 'package:path_provider/path_provider.dart';

class DrawingView extends StatefulWidget {
  final VoidCallback onButtonPressed;

  DrawingView({Key? key, required this.onButtonPressed}) : super(key: key);

  @override
  _DrawingViewState createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {

  Color selectedColor = Colors.black;

  void turnRed() {
    print('Changed color');
    selectedColor = Colors.red;
  }

  // For exporting image to a file.
  // Necessary to retrieve the widget boundary when converting.
  final GlobalKey _globalKey = GlobalKey();

  /// Generate array of bytes containing image data
  Future<Uint8List?> _generateImageBytes() async {
    final RenderRepaintBoundary boundary =
    _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? pngBytes = byteData?.buffer.asUint8List();
    return pngBytes;
  }

  /// Save image as png file in Document directory.
  Future<void> _saveImageToFile(Uint8List imageBytes) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final String filePath = '${documentsDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

    await File(filePath).writeAsBytes(imageBytes);
    print('Image saved to: $filePath');
  }

  void _createImage() async {
    var bytes = await _generateImageBytes();
    if (bytes != null) {
      await _saveImageToFile(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                Text('Zeichne etwas'),
                ElevatedButton(
                    onPressed: turnRed,
                    child: Text('Red'),
                )
              ],
            ),
          ),
          Column(children: [
            const Spacer(),
            // For exporting image to a file
            RepaintBoundary(
              key: _globalKey,
              child: SizedBox(
                width: screenSize.width * 0.4,
                height: screenSize.height * 0.7,
                child: ClipRect(
                  child: DrawingPage(
                    selectedColor: selectedColor,
                    onColorChanged: (Color newColor) {
                      setState(() {
                        selectedColor = newColor;
                      });
                    }
                  ),
                ),
              ),
            ),
            const Spacer(),
          ]),
          SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                const Text('180s'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    widget.onButtonPressed();
                  },
                  child: const Text('analysieren'),
                ),
                ElevatedButton(
                    onPressed: _createImage,
                    child: const Text('Testbild generieren')),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
