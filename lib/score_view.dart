import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const ScoreView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              onButtonPressed();
            },
            child: const Text('analysieren'),
          )
      ),
    );
  }
}
