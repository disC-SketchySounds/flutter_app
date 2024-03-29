import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import 'compare_view.dart';
import 'drawing_view.dart';
import 'generation_view.dart';
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
      AnalysisView(
        goToCompare: () => updateSelectedIndex(3),
        regenerate: () => updateSelectedIndex(1),
      ),
      CompareView(goBackAction: () => updateSelectedIndex(2)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor:
              _selectedIndex == 1 ? AppColors.black : AppColors.blue,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                color: _selectedIndex == 1 ? AppColors.black : AppColors.white,
                height: 2.0,
              )),
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
                bodyColor:
                    _selectedIndex == 1 ? AppColors.black : AppColors.white,
                displayColor:
                    _selectedIndex == 1 ? AppColors.black : AppColors.white,
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor:
                    _selectedIndex == 1 ? AppColors.black : AppColors.white,
                displayColor:
                    _selectedIndex == 1 ? AppColors.black : AppColors.white,
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
            _views.elementAt(_selectedIndex),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BottomNavigationBar(
            iconSize: 0,
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'MozartNbp',
              fontSize: 41,
              height: 0.1,
            ),
            selectedLabelStyle: const TextStyle(
              fontFamily: 'MozartNbp',
              fontSize: 41,
              height: 0.1,
            ),
            backgroundColor: AppColors.black,
            selectedItemColor: AppColors.white,
            selectedFontSize: 24,
            unselectedItemColor: AppColors.transparentWhite,
            unselectedFontSize: 24,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            elevation: 0.0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.transparent,
                ),
                label: '- zeichnen -',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.transparent,
                  ),
                  label: '- generieren -'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.transparent,
                ),
                label: '- Partitur -',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.transparent,
                  ),
                  label: '- Vergleich -'),
            ],
          ),
        ));
  }
}
