import 'package:flutter/material.dart';
import 'home_view.dart';

class IntroView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Generic Description'),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
              child: Text('Los geht\'s!'),
            ),
          ),
        ]),
      ),
    );
  }
}
