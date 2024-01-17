import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/resources/blue_button.dart';

class EndView extends StatelessWidget {
  const EndView({super.key});

  void regenerate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Danke, dass du Sketchy Sounds benutzt!\nWas möchtest du nun machen?',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Row(
                      children: [
                        BlueButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          text: 'neues Projekt',
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.blue,
                        ),
                        BlueButton(
                          onPressed: (() {}),
                          text: 'neu generieren',
                        ),
                      ],
                    ),
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
