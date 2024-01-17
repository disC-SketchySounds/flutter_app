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
                    child: Text('Analyse',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 40,
                        ))),
                Expanded(
                  child: AnalysisTagsView(
                    tags: tags ?? [''],
                  ),
                ),
                const Spacer(),
              ],
            )),
        Column(
          children: [
            const Spacer(),
            SizedBox(
              width: screenSize.width * 0.4,
              height: screenSize.height * 0.7,
              child: const ImageView(imageType: "score"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
            width: screenSize.width * 0.3,
            child: Column(
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
                BlueButton(onPressed: ((){
                  Navigator.pushNamed(context, '/compare');
                }), text: 'vergleichen'),
                const Spacer(),
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
