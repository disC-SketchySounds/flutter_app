import 'package:flutter/material.dart';

import 'app_colors.dart';

class BlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final String text;
  final Color color;

  const BlueButton({
    super.key,
    required this.onPressed,
    this.height = 45,
    required this.text,
    this.color = AppColors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white, backgroundColor: color, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: const BorderSide(color: AppColors.white),
          ),
        ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
    );
  }
}
