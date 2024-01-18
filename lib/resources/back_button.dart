import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: (() {
          Navigator.pop(context);
        }),
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.white,
          // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: const BorderSide(color: AppColors.white),
          ),
        ),
        child: const Text(
          'zurück',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
