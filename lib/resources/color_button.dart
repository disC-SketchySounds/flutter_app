import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final Color buttonColor;

  const ColorButton({
    super.key,
    required this.onPressed,
    this.size = 69 * 0.67,
    this.buttonColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18 * 0.67),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), backgroundColor: buttonColor,
          padding: EdgeInsets.all(size * 0.2),
        ),
        child: SizedBox(
          width: size,
          height: size,
        ),
      ),
    );
  }
}
