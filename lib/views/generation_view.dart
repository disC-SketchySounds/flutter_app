import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/resources/ios_alert.dart';
import 'package:path_provider/path_provider.dart';

class GenerationView extends StatefulWidget {

  /// Continues execution of the program after everything has successfully been
  /// loaded
  final VoidCallback onFinished;

  const GenerationView({super.key, required this.onFinished});

  @override
  State<StatefulWidget> createState() => _GenerationViewState();
}

class _GenerationViewState extends State<GenerationView> {

  @override
  void initState() {
    super.initState();

    // Make api calls.
    apiProcedure();
  }

  Future<void> apiProcedure() async {

    // TODO: Remove once api calls are implemented
    // Fake delay from api calls.
    await Future.delayed(const Duration(seconds: 5));

    // Get most recent sketch from folder
    var imagePath = await getImageFilePath();

    // TODO: Throw or handle error
    // Also uncomment, once images actually get loaded.
    // if (imagePath == null) return;
    /*
    if (imagePath == null) {
      widget.onFinished();
      return;
    }
    */

    // Send image to api
    String? response;
    try {
      response = await APIService.instance.uploadSketch(imagePath!);
    } on SocketException catch (e) {
      print('SocketException: $e');
      IOSAlert.instance.showCustomAlert(
          context: context,
          title: 'Can\'t connect to SketchySounds',
          message: e.message,
          onOkPressed: () {
            widget.onFinished();
            return;
          });
    } catch (e) {
      print('Unexpected error: $e');
      widget.onFinished();
      return;
    }


    print(imagePath);
    print("Response: $response");

    // Go to next view
    widget.onFinished();
    return;
  }

  Future<String?> getImageFilePath() async {

    try {
      final documentsDir = await getApplicationDocumentsDirectory();
      final List<FileSystemEntity> files = Directory(documentsDir.path).listSync();

      // Filter files that start with "sketch_"
      final sketchFiles = files.where((file) => file.path.contains('sketch_')).toList();

      if (sketchFiles.isNotEmpty) {
        print("Sketch files are not empty!");

        // Sort sketch files based on the timestamp in the filename
        sketchFiles.sort((a, b) {
          return File(a.path).lastModifiedSync().compareTo(File(b.path).lastModifiedSync());
        });

        // Return the sketch file path with the most recent timestamp
        return sketchFiles.last.path;
      } else {
        print("No sketch files found!");
        return null;
      }
    } catch (e) {
      print('Error getting sketch file: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('generating'),
        ]
      ),
    );
  }
}