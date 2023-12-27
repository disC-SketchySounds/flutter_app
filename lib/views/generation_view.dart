import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';

class GenerationView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const GenerationView({super.key, required this.onButtonPressed});

  void testAPI() {
    // TODO: Generate sketch from example image...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          ElevatedButton(
            onPressed: () {
              onButtonPressed();
            },
            // TODO: Remove this as soon as mock api returns generated image
            child: const Text('Bild ansehen'),
          ),
          ElevatedButton(
            onPressed: () {
              testAPI();
            }, child: const Text('API testen'),
          )
        ]
      ),
    );
  }
}
