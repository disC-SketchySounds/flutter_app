import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/blue_button.dart';

class ExplainerView extends StatelessWidget {
  const ExplainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
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
                        'Grafische Partituren sind eine Möglichkeit, die Ausführung\nvon Musikstücken auf grafische Art und Weise zu\nbeschreiben.',
                        style: TextStyle(fontSize: 41, fontFamily: 'MozartNbp', height: 1),
                      ),
                      ),
                      Row(
                        children: [
                          BlueButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/intro');
                            },
                            text: 'weiter',
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