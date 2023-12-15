import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /// Indicates the view that is currently displayed
  int _selectedIndex = 0;

  final List<Widget> _views = <Widget>[
    IntroView(),
    DrawingView(),
    GenerationView(),
    ScoreView(),
    AnalysisView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchySounds'),
      ),
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.draw),
            label: 'zeichnen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'generieren'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'fertige Partitur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers),
            label: 'analysieren'
          ),
        ],
      ),
    );
  }
}

class IntroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchySounds'),
      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrawingView()),
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

class DrawingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchySounds'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenerationView()),
            );
          },
          child: Text('fertig'),
        ),
      ),
    );
  }
}

class GenerationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchySounds'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScoreView()),
            );
          },
          // TODO: Remove this as soon as mock api returns generated image
          child: Text('Bild ansehen'),
        ),
      ),
    );
  }
}

class ScoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchySounds'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnalysisView()),
            );
          },
          child: Text('analysieren'),
        )
      ),
    );
  }
}

class AnalysisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sketchysounds'),
      ),
      body: Center(
      child: Text('Analysis'),
      ),
    );
  }
}
