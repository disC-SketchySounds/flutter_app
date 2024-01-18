import 'package:flutter/material.dart';
import 'package:flutter_app/resources/blue_button.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Verwandle mit Sketchy Sounds deine eigene Zeichung in eine grafische Partitur und tauche spielerisch in die Welt der Musik ein!',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Row(
                      children: [
                        BlueButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            text: 'Los geht\'s!'),
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
