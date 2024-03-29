import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:flutter_app/views/api_menu.dart';
import 'package:flutter_app/views/end_view.dart';
import 'package:flutter_app/views/explainer_view.dart';
import 'package:flutter_app/views/fullscreen_view.dart';
import 'package:flutter_app/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/intro_view.dart';

Future<void> main() async {

  // Run app
  runApp(const MyApp());

  // Load settings
  final prefs = await SharedPreferences.getInstance();

  String? apiLink = prefs.getString('apiLink');
  if (apiLink != null) {
    // Force unwrapping should be safe here
    APIService.apiUrl = apiLink;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/explainer': (context) => const ExplainerView(),
        '/intro': (context) => const IntroView(),
        '/home': (context) => const HomeView(),
        '/end': (context) => const EndView(),
        '/fullscreen': (context) => const FullScreenView(),
        '/api_menu': (context) => const ApiMenu(),
      },
      title: _title,
      home: const ExplainerView(),
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
