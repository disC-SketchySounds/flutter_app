import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThicknessSlider extends StatefulWidget {

  double currentWidth;
  double penWidth;
  // TODO: Add onchanged to fix issue with eraser

  ThicknessSlider({super.key, required this.currentWidth, required this.penWidth});

  @override
  _ThicknessSliderState createState() => _ThicknessSliderState();
}

class _ThicknessSliderState extends State<ThicknessSlider> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 512,
        child: RotatedBox(
            quarterTurns: 1,
            child: SliderTheme(
              data: SliderThemeData(
                thumbColor: AppColors.white,
                activeTrackColor: AppColors.blue,
                inactiveTrackColor: AppColors.blue,
                overlayColor: AppColors.white.withOpacity(0.3),
                valueIndicatorColor: Colors.blue,
              ),
              child: Slider(
                value: widget.currentWidth,

                onChanged: (newValue) {
                  setState(() {
                    widget.currentWidth = newValue;
                    widget.penWidth = newValue;
                  });
                },
                min: 2.5,
                max: 25.0,
                divisions: 10,
              ),
            )));
  }
}
