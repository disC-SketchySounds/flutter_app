import 'package:flutter/material.dart';
import 'intro_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'SketchySounds';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: IntroView(),
    );
  }
}

