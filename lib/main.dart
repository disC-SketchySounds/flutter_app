import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/views/compare_view.dart';
import 'package:flutter_app/views/end_view.dart';
import 'package:flutter_app/views/home_view.dart';
import 'views/intro_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/intro': (context) => const IntroView(),
        '/home': (context) => const HomeView(),
        '/end': (context) => const EndView(),
        '/compare': (context) => const CompareView(),
      },
      title: _title,
      home: const IntroView(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'Director',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: AppColors.black),
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
