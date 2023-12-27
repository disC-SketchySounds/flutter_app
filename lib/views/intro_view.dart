import 'package:flutter/material.dart';
import 'home_view.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Verwandle mit Sketchy Sounds deine eigene Zeichung in eine grafische Partitur und tauche spielerisch in die Welt der Musik ein!'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              child: const Text('Los geht\'s!'),
            ),
          ),
        ]),
      ),
    );
  }
}
