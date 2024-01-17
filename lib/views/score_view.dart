import 'package:flutter/material.dart';
import 'package:flutter_app/resources/blue_button.dart';

import '../display_image/image_viewer.dart';

class ScoreView extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const ScoreView({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(35),
                child: Text(
                  'Deine Partitur',
                  style: TextStyle(
                    fontFamily: 'TWKLausanne',
                    fontSize: 45,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox.square(
                dimension: screenSize.width * 0.4,
                child: const ImageView(imageType: "score"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlueButton(onPressed: onButtonPressed, text: 'Bild ansehen'),
          ),
        ],
      ),
    );
  }
}
