import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/drawing/drawing_page.dart';
import 'package:flutter_app/views/timer_view.dart';
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
  State<DrawingView> createState() => _DrawingViewState();
}

class _DrawingViewState extends State<DrawingView> {
  @override
  void initState() {
    super.initState();
  }

  Color selectedColor = AppColors.blue;
  int countdown = 180;
  double selectedWidth = 5.0;
  String selectedButton = 'blue';

  // Helper to distinguish between pen and eraser.
  double penWidth = 5.0;

  void turnBlue() {
    setState(() {
      selectedButton = 'blue';
      selectedColor = AppColors.blue;
      selectedWidth = penWidth;
    });
  }

  void turnPink() {
    setState(() {
      selectedButton = 'pink';
      selectedColor = AppColors.pink;
      selectedWidth = penWidth;
    });
  }

  void turnYellow() {
    setState(() {
      selectedButton = 'yellow';
      selectedColor = AppColors.yellow;
      selectedWidth = penWidth;
    });
  }

  void makeEraser() {
    setState(() {
      selectedButton = 'eraser';
      selectedWidth = 25.0;
      selectedColor = AppColors.white;
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
    // TODO: Fix this
    AppData.current.sketchPath =
        '${documentsDir.path}/${imageType.name}_${DateTime.now().millisecondsSinceEpoch}.png';

    await File(AppData.current.sketchPath).writeAsBytes(imageBytes);
  }

  Future<void> _createImage() async {
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
            width: screenSize.width * 0.325,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Text(
                    'ZEICHNE ETWAS',
                    style: TextStyle(
                      fontFamily: 'MozartNbp',
                      fontSize: 46,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 100, top: 0, right: 18, bottom: 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Column(
                              children: [
                                ColorButton(
                                  onPressed: turnBlue,
                                  isSelected: selectedButton == 'blue',
                                  buttonColor: AppColors.blue,
                                ),
                                ColorButton(
                                  onPressed: turnPink,
                                  isSelected: selectedButton == 'pink',
                                  buttonColor: AppColors.pink,
                                ),
                                ColorButton(
                                  onPressed: turnYellow,
                                  isSelected: selectedButton == 'yellow',
                                  buttonColor: AppColors.yellow,
                                ),
                                ColorButton(
                                  onPressed: makeEraser,
                                  isSelected: selectedButton == 'eraser',
                                  buttonColor: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RepaintBoundary(
                key: _globalKey,
                child: SizedBox.square(
                  dimension: screenSize.width * 0.35,
                  child: ClipRect(
                    child: DrawingPage(
                        selectedColor: selectedColor,
                        selectedWidth: selectedWidth),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.325,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, right: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TimerView(countdown: countdown, action: _processImage),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Strichstärke',
                        style: TextStyle(
                          fontFamily: 'MozartNbp',
                          fontSize: 32,
                          height: 0.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: screenSize.width * 0.325,
                      height: screenSize.width * 0.35,
                      child: Row(children: [
                        SizedBox(
                            height: screenSize.width * 0.35,
                            child: Padding(
                                padding: EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 10),
                                child: RotatedBox(
                                    quarterTurns: 3,
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        trackHeight: 10.0,
                                        thumbColor: AppColors.white,
                                        activeTrackColor: AppColors.blue,
                                        inactiveTrackColor: AppColors.blue,
                                        overlayColor:
                                            AppColors.white.withOpacity(0.325),
                                        valueIndicatorColor: Colors.blue,
                                      ),
                                      child: Slider(
                                        value: selectedWidth,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedWidth = newValue;
                                            penWidth = newValue;
                                          });
                                        },
                                        min: 2.5,
                                        max: 25.0,
                                        divisions: null,
                                      ),
                                    )))),
                        Spacer(),
                        Column(children: [
                          Spacer(),
                          BlueButton(
                            width: 186,
                            onPressed: () {
                              _processImage();
                            },
                            text: 'Partitur\ngenerieren',
                          ),
                        ]),
                      ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
