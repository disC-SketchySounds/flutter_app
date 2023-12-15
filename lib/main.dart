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

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late List<Widget> _views;

  @override
  void initState() {
    super.initState();
    _views = [
      DrawingView(onButtonPressed: () => updateSelectedIndex(1)),
      GenerationView(onButtonPressed: () => updateSelectedIndex(2)),
      ScoreView(onButtonPressed: () => updateSelectedIndex(3)),
      AnalysisView(onButtonPressed: () => updateSelectedIndex(4)),
      AnalysisView(onButtonPressed: () => updateSelectedIndex(4)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SketchySounds'),
      ),
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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

  final VoidCallback onButtonPressed;
  const IntroView({required this.onButtonPressed});

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
                onButtonPressed();
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

  final VoidCallback onButtonPressed;
  const DrawingView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onButtonPressed();
          },
          child: Text('fertig'),
        ),
      ),
    );
  }
}

class GenerationView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const GenerationView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onButtonPressed();
          },
          // TODO: Remove this as soon as mock api returns generated image
          child: Text('Bild ansehen'),
        ),
      ),
    );
  }
}

class ScoreView extends StatelessWidget {

  final VoidCallback onButtonPressed;
  const ScoreView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onButtonPressed();
          },
          child: Text('analysieren'),
        )
      ),
    );
  }
}

class AnalysisView extends StatelessWidget {


  final VoidCallback onButtonPressed;
  const AnalysisView({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text('Analysis'),
      ),
    );
  }
}
