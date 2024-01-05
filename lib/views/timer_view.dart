import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  final int countdown;
  final bool pageDisabled;

  TimerView({required this.countdown, required this.pageDisabled,});

  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  late int countdown;
  late bool pageDisabled;

  @override
  void initState() {
    super.initState();
    countdown = widget.countdown;
    pageDisabled = widget.pageDisabled;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text(
          'verbleibende Zeit',
          style: TextStyle(
            fontFamily: 'Compagnon',
            fontSize: 14,
          ),
        ),
        Text('${countdown}s',
            style: const TextStyle(
              fontFamily: 'Compagnon',
              fontStyle: FontStyle.italic,
              fontSize: 24,
        )
    ),]
    )
    )
    );
  }

  Future<void> startTimer() async {
    while (countdown > 0) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        countdown--;
      });
    }
    setState(() {
      print("Disabled!");
      pageDisabled = true;
    });
  }
}
