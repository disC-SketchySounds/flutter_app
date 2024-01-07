import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/resources/blue_button.dart';

class EndView extends StatelessWidget {

  void regenerate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          text: 'neues Projekt',
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.blue,
                        ),
                        BlueButton(
                          onPressed: ((){

                          }),
                          text: 'neu generieren',
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
