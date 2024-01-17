import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/api/app_data.dart';

import '../resources/ios_alert.dart';

class GenerationView extends StatefulWidget {
  /// Continues execution of the program after everything has successfully been
  /// loaded
  final VoidCallback onFinished;
  final VoidCallback onError;

  const GenerationView(
      {super.key, required this.onFinished, required this.onError});

  @override
  State<StatefulWidget> createState() => _GenerationViewState();
}

class _GenerationViewState extends State<GenerationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Make api calls.
    procedureAlertWrapper();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> procedureAlertWrapper() async {
    await apiProcedure();
    if (errorString != null) {
      IOSAlert.instance.showCustomAlert(
          context: context,
          title: 'FEHLER',
          message: errorString!,
          onOkPressed: () {
            widget.onError();
            return null;
          });
    }
  }

  String? errorString;

  Future<void> apiProcedure() async {
    try {
      String? transactionID =
          await APIService.instance.uploadSketch(AppData.current.sketchPath);
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

      List<String>? analysis =
          await APIService.instance.getAnalysis(AppData.current.transactionId);
      while (analysis == null) {
        await Future.delayed(const Duration(seconds: 2));
        analysis = await APIService.instance
            .getAnalysis(AppData.current.transactionId);
      }
      AppData.current.analysis = analysis;
    } on Exception catch (e) {
      errorString = e.toString();
      return;
    }

    // Go to next view
    widget.onFinished();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          String dots = '.' * ((_animationController.value * 4).floor() % 4);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'generiere$dots',
                style: const TextStyle(
                  fontFamily: 'Compagnon',
                  fontSize: 80,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
