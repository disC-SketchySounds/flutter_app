import 'package:flutter/material.dart';
import 'package:flutter_app/resources/blue_button.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Verwandle mit Sketchy Sounds deine eigene Zeichung in eine grafische Partitur und tauche spielerisch in die Welt der Musik ein!',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BlueButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  text: 'Los geht\'s!'),
            ),
          ],
        ),
      ),
    );
  }
}
