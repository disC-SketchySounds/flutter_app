import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import 'drawing_view.dart';
import 'generation_view.dart';
import 'score_view.dart';
import 'analysis_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  /// Indicates the view that is currently displayed
  int _selectedIndex = 0;

  String currentSketchPath = "";

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      // TODO: After restarting from AnalysisView navigate back to IntroView
    }
  }

  late List<Widget> _views;

  @override
  void initState() {
    super.initState();
    _views = [
      DrawingView(onButtonPressed: () => updateSelectedIndex(1)),
      GenerationView(onFinished: () => updateSelectedIndex(2), onError: () => updateSelectedIndex(0)),
      ScoreView(onButtonPressed: () => updateSelectedIndex(3)),
      AnalysisView(onButtonPressed: () => updateSelectedIndex(0)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: const Text('SketchySounds'), toolbarTextStyle: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ).bodyMedium, titleTextStyle: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ).titleLarge,
        toolbarHeight: 112 * 0.67,
      ),
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        selectedFontSize: 24,
        unselectedItemColor: AppColors.gray,
        unselectedFontSize: 24,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border, color: Colors.transparent,),
            label: 'zeichnen',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border, color: Colors.transparent,),
              label: 'generieren'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border, color: Colors.transparent,),
            label: 'fertige Partitur',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border, color: Colors.transparent,),
              label: 'analysieren'
          ),
        ],
      ),
    );
  }
}





