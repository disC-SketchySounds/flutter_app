import 'package:flutter/material.dart';

import 'app_colors.dart';

class ColorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final Color buttonColor;
  final bool isSelected;

  const ColorButton({
    super.key,
    required this.onPressed,
    required this.isSelected,
    this.size = 67,
    this.buttonColor = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: buttonColor,
        ),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: buttonColor != AppColors.white ? AppColors.white : AppColors.blue, width: 4.0)
                : null,
          ),
        ),
      ),
    );
  }
}
