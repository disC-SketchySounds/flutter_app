import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';

class BackButton extends StatelessWidget {
  final VoidCallback onPressed;
  BackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: (() {
          onPressed;
        }),
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.black,
          // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: const BorderSide(color: AppColors.white),
          ),
        ),
        child: const Text(
          'zurück',
          style: TextStyle(fontSize: 32, color: AppColors.white),
        ),
      ),
    );
  }
}
