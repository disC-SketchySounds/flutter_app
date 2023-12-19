import 'package:flutter/material.dart';
import 'package:flutter_app/drawing/drawing_page.dart';

class DrawingView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const DrawingView({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.3,
            child: const Column(
              children: [
                  Text('Zeichne etwas'),
              ],
            ),
          ),
          const Column(
            children: [
              Spacer(),
              DrawingPage(),
              Spacer(),
            ]
          ),
              SizedBox(
                width: screenSize.width * 0.3,
                child: Column(
                  children: [
                const Text('180s'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    onButtonPressed();
                  },
                  child: const Text('analysieren'),
                ),
                    const Spacer(),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
