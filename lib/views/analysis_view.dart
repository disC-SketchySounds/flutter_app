import 'package:flutter/material.dart';
import 'package:flutter_app/api/app_data.dart';
import 'package:flutter_app/resources/blue_button.dart';
import 'package:flutter_app/views/analysis_tags_view.dart';

import '../display_image/image_viewer.dart';

class AnalysisView extends StatelessWidget {
  final VoidCallback onButtonPressed;

  // TODO: Replace with actual tags list.
  List<String>? tags;

  AnalysisView({super.key, required this.onButtonPressed});

  void compare() {}

  void goToFinalView() {}

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    tags = AppData.current.analysis;

    return Scaffold(
      body: Row(children: [
        SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Deine Partitur',
                        style: TextStyle(
                          fontFamily: 'TWKLausanne',
                          fontSize: 45,
                        ))),
                Expanded(
                  child: AnalysisTagsView(
                    tags: AppData.current.analysis,
                  ),
                ),
              ],
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox.square(
              dimension: screenSize.width * 0.4,
              child: const ImageView(imageType: "score"),
            ),
          ],
        ),
        SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
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
                BlueButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, '/compare');
                    }),
                    text: 'vergleichen'),
                BlueButton(
                  onPressed: () {
                    /*
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EndView()),
                    );
                    */
                    Navigator.pushNamed(context, '/end');
                  },
                  text: 'abschließen',
                  backgroundColor: Colors.black,
                )
              ],
            ))
      ]),
    );
  }
}
