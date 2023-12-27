import 'package:flutter/material.dart';
import 'views/intro_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: IntroView(),
      themeMode: ThemeMode.system,
    );
  }
}

