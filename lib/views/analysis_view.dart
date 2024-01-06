import 'package:flutter/material.dart';
import 'package:flutter_app/resources/blue_button.dart';
import 'package:flutter_app/views/analysis_tags_view.dart';

import '../display_image/image_viewer.dart';

class AnalysisView extends StatelessWidget {
  final VoidCallback onButtonPressed;

  // TODO: Replace with actual tags list.
  final tags = [
    'happy',
    'order',
    'wall',
    'stars',
    'brick',
    'floating',
    'bubbles',
    'light',
    'happy',
    'geometric',
    'uplifting',
  ];

  AnalysisView({super.key, required this.onButtonPressed});

  void compare() {}

  void goToFinalView() {}

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(children: [
        SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Analyse',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 40,
                        ))),
                Expanded(
                  child: AnalysisTagsView(
                    tags: tags,
                  ),
                ),
                Spacer(),
              ],
            )),
        Column(
          children: [
            const Spacer(),
            SizedBox(
              width: screenSize.width * 0.4,
              height: screenSize.height * 0.7,
              child: ImageView(),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text(
                    'Wie wurde aus der Skizze\ndie Partitur?',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                BlueButton(onPressed: compare, text: 'vergleichen'),
                const Spacer(),
                BlueButton(
                  onPressed: goToFinalView,
                  text: 'abschließen',
                  color: Colors.black,
                )
              ],
            ))
      ]),
    );
  }
}
