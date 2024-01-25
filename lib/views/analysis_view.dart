import 'package:flutter/material.dart';
import 'package:flutter_app/api/app_data.dart';
import 'package:flutter_app/resources/blue_button.dart';
import 'package:flutter_app/views/analysis_tags_view.dart';

import '../display_image/image_viewer.dart';
import '../resources/app_colors.dart';

class AnalysisView extends StatelessWidget {
  final VoidCallback goToCompare;
  final VoidCallback regenerate;

  const AnalysisView(
      {super.key, required this.goToCompare, required this.regenerate});

  void compare() {}

  void goToFinalView() {}

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.325,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
                  child: Text(
                    'Deine Partitur',
                    style: TextStyle(
                      fontFamily: 'MozartNbp',
                      fontSize: 46,
                    ),
                  ),
                ),
                Expanded(
                  child: AnalysisTagsView(
                    tags: AppData.current.analysis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: BlueButton(
                    width: 320,
                    onPressed: goToCompare,
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
                  dimension: screenSize.width * 0.35,
                  child: Stack(children: [
                    const ImageView(imageType: "score"),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: IconButton(
                        icon: const Icon(Icons.open_in_full_outlined,
                            color: AppColors.white, size: 45),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fullscreen');
                        },
                      ),
                    ),
                  ])),
              Spacer(flex: 1),
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.325,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlueButton(
                  width: 320,
                  onPressed: regenerate,
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
