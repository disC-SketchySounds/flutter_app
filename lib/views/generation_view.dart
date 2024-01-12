import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import '../resources/ios_alert.dart';

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
    procedureAlertWrapper();
  }

  Future<void> procedureAlertWrapper() async {
    await apiProcedure();
    if (errorString != null) {
      IOSAlert.instance.showCustomAlert(
          context: context,
          title: 'Can\'t connect to SketchySounds',
          message: errorString!,
          onOkPressed: () {
            widget.onFinished();
            return null;
          });
    }
  }

  String? errorString;

  Future<void> apiProcedure() async {

    widget.onFinished;

    // TODO: Remove once api calls are implemented
    // Fake delay from api calls.
    await Future.delayed(const Duration(seconds: 5));

    var uploadResponse = await _uploadSketch();
    if (uploadResponse == null) {
      widget.onFinished;
      return;
    }

    String transactionId = jsonDecode(uploadResponse["transaction_id"]);

    var downloadSuccessful = await _getScore(transactionId);
    if (!downloadSuccessful) {
      widget.onFinished;
      return;
    }

    // Get most recent sketch from folder

    // Get score as image
    List<String>? error;

    // Go to next view
    widget.onFinished();
    return;
  }

  /// Upload the sketch
  /// Return response and transaction ID
  Future<Map<String, dynamic>?> _uploadSketch() async {
    var imagePath = await getImageFilePath();

    // TODO: Throw or handle error
    // Also uncomment, once images actually get loaded.
    if (imagePath == null) return null;
    if (imagePath == null) {
      widget.onFinished();
      return null;
    }

    // Send image to api
    String? response;
    try {
      response = await APIService.instance.uploadSketch(imagePath!);
    } on SocketException catch (e) {
      errorString = e.message;
      widget.onFinished;
      return null;
    } catch (e) {
      errorString = e.toString();
      widget.onFinished;
      return null;
    }

    Map<String, dynamic> uploadJson = jsonDecode(response!);
    return uploadJson;
  }

  /// Download the score and save it to files
  /// Return transaction ID
  Future<bool> _getScore(String transactionID) async {
    String? response;
    try {
      response = await APIService.instance.getSketch(transactionID);
    } catch (e) {
      errorString = e.toString();
    }

    if (response == null) return false;

    final success = await _saveScoreToFile(response);
    return success;
  }

  Future<bool> _saveScoreToFile(String jsonString) async {
    try {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      String imageDataString = jsonMap['score'];
      Uint8List imageData = base64Decode(imageDataString);

      final documentsDir = await getApplicationDocumentsDirectory();
      final String filePath =
          '${documentsDir.path}/score_${DateTime
          .now()
          .millisecondsSinceEpoch}.jpg';
      await File(filePath).writeAsBytes(imageData);
      print('Image saved to: $filePath');
      return true;
    } catch (e) {
      errorString = e.toString();
      return false;
    }
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