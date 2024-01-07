import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/views/compare_view.dart';
import 'package:flutter_app/views/end_view.dart';
import 'package:flutter_app/views/home_view.dart';
import 'views/intro_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/intro': (context) => IntroView(),
        '/home': (context) => HomeView(),
        '/end': (context) => EndView(),
        '/compare': (context) => CompareView(),
      },
      title: _title,
      home: IntroView(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'Compagnon',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: AppColors.black),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

