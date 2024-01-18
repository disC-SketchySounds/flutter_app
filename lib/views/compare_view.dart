import 'package:flutter/material.dart';

import '../display_image/image_viewer.dart';

class CompareView extends StatelessWidget {
  const CompareView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackButton(),
          Center(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Skizze',
                      style: TextStyle(
                        fontFamily: 'TWKLausanne',
                        fontSize: 50,
                      ),
                    ),
                    SizedBox.square(
                        dimension: screenSize.width * 0.4,
                        child: const ImageView(imageType: "sketch")),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Partitur',
                      style: TextStyle(
                        fontFamily: 'TWKLausanne',
                        fontSize: 50,
                      ),
                    ),
                    SizedBox.square(
                        dimension: screenSize.width * 0.4,
                        child: const ImageView(imageType: "score")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
