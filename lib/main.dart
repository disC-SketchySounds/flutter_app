import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'views/intro_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: IntroView(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
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

