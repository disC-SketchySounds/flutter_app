import 'package:flutter/material.dart';
import 'package:flutter_app/api/app_data.dart';
import 'package:flutter_app/resources/blue_button.dart';
import 'package:flutter_app/views/analysis_tags_view.dart';

import '../display_image/image_viewer.dart';

class AnalysisView extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const AnalysisView({super.key, required this.onButtonPressed});

  void compare() {}

  void goToFinalView() {}

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Deine Partitur',
                    style: TextStyle(
                      fontFamily: 'TWKLausanne',
                      fontSize: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: AnalysisTagsView(
                    tags: AppData.current.analysis,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Du möchtest die Partitur nochmal mit deiner Skizze vergleichen?',
                    style: TextStyle(
                      fontFamily: 'TWKLausanne',
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: BlueButton(
                    width: 320,
                    onPressed: onButtonPressed,
                    text: 'vergleichen',
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(flex: 3),
              SizedBox.square(
                dimension: screenSize.width * 0.4,
                child: const ImageView(imageType: "score"),
              ),
              Spacer(flex: 1),
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlueButton(
                  width: 320,
                  onPressed: (() {}),
                  text: 'neu generieren',
                  backgroundColor: Colors.black,
                ),
                BlueButton(
                  width: 320,
                  onPressed: () {
                    Navigator.pushNamed(context, '/end');
                  },
                  text: 'abschließen',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
