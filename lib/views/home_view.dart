import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import 'compare_view.dart';
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
      GenerationView(
          onFinished: () => updateSelectedIndex(2),
          onError: () => updateSelectedIndex(0)),
      AnalysisView(onButtonPressed: () => updateSelectedIndex(3)),
      CompareView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _selectedIndex == 3 ? 'Zurück' : 'Sketchy Sounds',
              style: const TextStyle(
                fontFamily: 'Compagnon',
                fontSize: 32,
              ),
            ),
          ),
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )
              .titleLarge,
          toolbarHeight: 112 * 0.67,
          // Back button that only exists when on CompareView. Otherwise going
          // back is not allowed.
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new,
                color: _selectedIndex == 3 ? Colors.white : Colors.transparent),
            onPressed: () {
              if (_selectedIndex == 3) {
                setState(() {
                  _selectedIndex = _selectedIndex - 1;
                });
              }
            },
          ),
        ),
        body: _views.elementAt(_selectedIndex),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.white,
            selectedFontSize: 24,
            unselectedItemColor: AppColors.gray,
            unselectedFontSize: 24,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.transparent,
                ),
                label: 'zeichnen',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.transparent,
                  ),
                  label: 'generieren'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.transparent,
                ),
                label: 'analysieren',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.transparent,
                  ),
                  label: 'vergleichen'),
            ],
          ),
        ));
  }
}
