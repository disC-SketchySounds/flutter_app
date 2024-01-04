import 'package:flutter/material.dart';
import 'package:flutter_app/resources/blue_button.dart';

class AnalysisView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const AnalysisView({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlueButton(
            onPressed: () {
              onButtonPressed();
            },
            text: 'zurück'
          )
      ),
    );
  }
}
