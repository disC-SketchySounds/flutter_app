import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  final int countdown;
  final VoidCallback action;

  TimerView({required this.countdown, required this.action});

  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  late int countdown;
  late VoidCallback action;
  late bool pageDisabled;

  @override
  void initState() {
    super.initState();
    countdown = widget.countdown;
    action = widget.action;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              const Text(
                'verbleibende Zeit',
                style: TextStyle(
                  fontFamily: 'TWKLausanne',
                  fontSize: 16,
                ),
              ),
              Text('${countdown}s',
                  style: const TextStyle(
                    fontFamily: 'TWKLausanne',
                    fontSize: 24,
                  )),
            ])));
  }

  Future<void> startTimer() async {
    while (countdown > 0) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        countdown--;
      });
    }
    action();
  }
}
