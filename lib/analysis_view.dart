import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const AnalysisView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              onButtonPressed();
            },
            child: const Text('zurück'),
          )
      ),
    );
  }
}
