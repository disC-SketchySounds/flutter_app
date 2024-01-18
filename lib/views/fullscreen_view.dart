import 'package:flutter/material.dart';
import 'package:flutter_app/display_image/image_viewer.dart';

import '../resources/app_colors.dart';

class FullScreenView extends StatelessWidget {
  const FullScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: screenSize.height,
            height: screenSize.height,
              child: Stack(children: [
                ImageView(imageType: 'score'),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close_fullscreen_outlined, color: AppColors.white,),
                )
              ])
          )
            ));
  }
}
