import 'package:flutter/material.dart';

import 'app_colors.dart';

class BlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;

  const BlueButton({
    super.key,
    required this.onPressed,
    this.width = 292,
    this.height = 69,
    required this.text,
    this.backgroundColor = AppColors.blue,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          minimumSize: Size(width, height),
          // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: foregroundColor),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 32,
            fontFamily: 'Compagnon',
          ),
        ),
      ),
    );
  }
}
