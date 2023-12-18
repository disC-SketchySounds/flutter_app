import 'package:flutter/material.dart';

class DrawingView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const DrawingView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onButtonPressed();
          },
          child: Text('fertig'),
        ),
      ),
    );
  }
}
