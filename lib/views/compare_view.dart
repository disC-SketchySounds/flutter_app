import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/resources/blue_button.dart';

import '../display_image/image_viewer.dart';

class CompareView extends StatelessWidget {
  const CompareView({super.key});

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: null,
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          BackButton(),
          Center(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Text(
                      'Skizze',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                        width: screenSize.width * 0.4,
                        height: screenSize.height * 0.7,
                        child: ImageView()
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      'Partitur',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                        width: screenSize.width * 0.4,
                        height: screenSize.height * 0.7,
                        child: ImageView()
                    ),
                    const Spacer(),
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
