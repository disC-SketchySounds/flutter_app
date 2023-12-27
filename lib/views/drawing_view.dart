import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/drawing/drawing_page.dart';
import 'package:path_provider/path_provider.dart';

class DrawingView extends StatelessWidget {
  final VoidCallback onButtonPressed;

  // For exporting image to a file.
  // Necessary to retrieve the widget boundary when converting.
  final GlobalKey globalKey = GlobalKey();

  DrawingView({super.key, required this.onButtonPressed});

  /// Generate array of bytes containing image data
  Future<Uint8List?> generateImageBytes() async {
    final RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? pngBytes = byteData?.buffer.asUint8List();
    return pngBytes;
  }

  /// Save image as png file in Document directory.
  Future<void> saveImageToFile(Uint8List imageBytes) async {

    // When using Simulator on macOS, filePath will look something like:
    // /Users/johannes/Library/Developer/CoreSimulator/Devices/<device-uuid>/data/Containers/Data/Application/<app-uuid>/Documents/
    final documentsDir = await getApplicationDocumentsDirectory();

    // TODO: Come up with more useful scheme for filenames
    // Currently just adds timestamp
    final String filePath = '${documentsDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

    // Write image to file
    await File(filePath).writeAsBytes(imageBytes);
    print('Image saved to: $filePath');
  }

  void createImage() async {
    var bytes = await generateImageBytes();
    await saveImageToFile(bytes!);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.3,
            child: const Column(
              children: [
                Text('Zeichne etwas'),
              ],
            ),
          ),
          Column(children: [
            const Spacer(),
            // For exporting image to a file
            RepaintBoundary(
              key: globalKey,
              child: SizedBox(
                width: screenSize.width * 0.4,
                height: screenSize.height * 0.7,
                child: const ClipRect(
                  child: DrawingPage(),
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
                    onButtonPressed();
                  },
                  child: const Text('analysieren'),
                ),
                ElevatedButton(
                    onPressed: createImage,
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
