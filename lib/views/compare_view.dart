import 'package:flutter/material.dart';

import '../display_image/image_viewer.dart';
import '../resources/app_colors.dart';

class CompareView extends StatelessWidget {
  final VoidCallback goBackAction;

  const CompareView({super.key, required this.goBackAction});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                    SizedBox.square(
                        dimension: screenSize.width * 0.4,
                        child: const ImageView(imageType: "score")),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.white,
            ),
              onPressed: goBackAction,
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:45, right: 15),
                   child: Icon(Icons.arrow_back),
                  ),
                  Text(
                    'zurück',
                    style: TextStyle(
                      fontFamily: 'Compagnon',
                      fontSize: 32,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
