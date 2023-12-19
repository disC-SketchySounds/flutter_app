import 'package:flutter/material.dart';

class GenerationView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const GenerationView({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onButtonPressed();
          },
          // TODO: Remove this as soon as mock api returns generated image
          child: const Text('Bild ansehen'),
        ),
      ),
    );
  }
}
