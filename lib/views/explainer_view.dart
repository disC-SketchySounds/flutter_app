import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/blue_button.dart';

class ExplainerView extends StatelessWidget {
  const ExplainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: AppColors.white,
              height: 2.0,
            )
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sketchy Sounds',
            style: TextStyle(
              fontFamily: 'Compagnon',
              fontSize: 32,
            ),
          ),
        ),
        toolbarTextStyle: Theme.of(context)
            .textTheme
            .apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.white,
        )
            .bodyMedium,
        titleTextStyle: Theme.of(context)
            .textTheme
            .apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.white,
        )
            .titleLarge,
        toolbarHeight: 88,
        // There's probably a better way to remove the back button TODO: Fix if spare time
        leading: IconButton(
          icon:
          const Icon(Icons.arrow_back_ios_new, color: Colors.transparent),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/api_menu');
              },
              icon: Icon(
                Icons.settings,
                size: 40,
                color: AppColors.white.withOpacity(0.1),
              ))
        ],
      ),
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