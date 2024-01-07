import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/resources/blue_button.dart';

class GenerationView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const GenerationView({super.key, required this.onButtonPressed});

  void testAPI() {
    // TODO: Generate sketch from example image...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          BlueButton(
            onPressed: () {
              onButtonPressed();
            },
            text: 'Bild ansehen',

          ),
          BlueButton(
            onPressed: () {
              testAPI();
            },
            text: 'API testen',
            backgroundColor: AppColors.gray,
          )
        ]
      ),
    );
  }
}
