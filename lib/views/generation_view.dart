import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/api/app_data.dart';
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

    String? transactionID = await APIService.instance.uploadSketch(AppData.current.sketchPath);
    if (transactionID == null) {
      errorString = "Failed to upload sketch";
      return;
    }

    AppData.current.transactionId = transactionID;

    String? scorePath = await APIService.instance.getScore(transactionID);
    while (scorePath == null) {
      await Future.delayed(const Duration(seconds: 2));
      scorePath = await APIService.instance.getScore(transactionID);
    }
    AppData.current.scorePath = scorePath;

    AppData.current.analysis = await APIService.instance.getAnalysis(AppData.current.transactionId);

    // Go to next view
    widget.onFinished();
    return;
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