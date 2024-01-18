import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/blue_button.dart';

class ExplainerView extends StatelessWidget {
  const ExplainerView({super.key});

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
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grafische Partituren sind eine Möglichkeit, die Ausführung von Musikstücken auf grafische Art und Weise zu beschreiben.',
                        style: TextStyle(fontSize: 30),
                      ),
                      Row(
                        children: [
                          BlueButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/intro');
                            },
                            text: 'Los geht\'s!',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}