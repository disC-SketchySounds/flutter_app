import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/drawing/drawing_page.dart';
import 'package:flutter_app/resources/blue_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/resources/image_type.dart';

import '../api/app_data.dart';
import '../resources/color_button.dart';

class DrawingView extends StatefulWidget {
  final VoidCallback onButtonPressed;

  const DrawingView({super.key, required this.onButtonPressed});

  @override
  _DrawingViewState createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {
  @override
  void initState() {
    super.initState();
  }

  Color selectedColor = AppColors.blue;

  void turnBlue() {
    setState(() {
      selectedColor = AppColors.blue;
    });
  }

  void turnPink() {
    setState(() {
      selectedColor = AppColors.pink;
    });
  }

  void turnYellow() {
    setState(() {
      selectedColor = AppColors.yellow;
    });
  }

  // For exporting image to a file.
  // Necessary to retrieve the widget boundary when converting.
  final GlobalKey _globalKey = GlobalKey();

  /// Generate array of bytes containing image data
  Future<Uint8List?> _generateImageBytes() async {
    final RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? pngBytes = byteData?.buffer.asUint8List();
    return pngBytes;
  }

  /// Save image as png file in Document directory.
  Future<void> _saveImageToFile(
      Uint8List imageBytes, ImageType imageType) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    AppData.current.sketchPath =
        '${documentsDir.path}/${imageType.name}_${DateTime.now().millisecondsSinceEpoch}.png';

    await File(AppData.current.sketchPath).writeAsBytes(imageBytes);
    print('Image saved to: ${AppData.current.sketchPath}');
  }

  Future<void> _createImage() async {
    print("creating image");
    var bytes = await _generateImageBytes();
    if (bytes != null) {
      await _saveImageToFile(bytes, ImageType.sketch);
    }
  }

  void _processImage() async {
    await _createImage();
    widget.onButtonPressed();
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
                const Padding(
                  padding: EdgeInsets.all(35),
                  child: Text(
                    'Zeichne etwas!',
                    style: TextStyle(
                      fontFamily: 'TWKLausanne',
                      fontSize: 40,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 100, top: 18, right: 18, bottom: 18),
                      child: Column(children: [
                        ColorButton(
                          onPressed: turnBlue,
                          buttonColor: AppColors.blue,
                        ),
                        ColorButton(
                          onPressed: turnPink,
                          buttonColor: AppColors.pink,
                        ),
                        ColorButton(
                          onPressed: turnYellow,
                          buttonColor: AppColors.yellow,
                        ),
                      ]),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            RepaintBoundary(
              key: _globalKey,
              child: SizedBox.square(
                dimension: screenSize.width * 0.4,
                child: ClipRect(
                  child: DrawingPage(
                      selectedColor: selectedColor,
                      onColorChanged: (Color newColor) {
                        setState(() {
                          selectedColor = newColor;
                        });
                      }),
                ),
              ),
            ),
          ]),
          SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                const Text(
                  '180s',
                  style: TextStyle(
                    fontFamily: 'TWKLausanne',
                    fontSize: 30,
                  ),
                ),
                const Spacer(),
                BlueButton(
                  onPressed: () {
                    _processImage();
                  },
                  text: 'fertig',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
