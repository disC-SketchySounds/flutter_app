import 'package:flutter/material.dart';
import 'package:flutter_app/resources/blue_button.dart';

import '../display_image/image_viewer.dart';

class ScoreView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const ScoreView({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.3,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                  child: Text(
                    'Deine\nPartitur',
                    style: TextStyle(
                      fontFamily: 'Compagnon',
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Column(children: [
            const Spacer(),
            SizedBox(
              width: screenSize.width * 0.4,
              height: screenSize.height * 0.4,
              child: const ImageView(imageType: "score")
            ),
            const Spacer(),
          ]),
          SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                const Spacer(),
                BlueButton(onPressed: onButtonPressed, text: 'Bild ansehen')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
