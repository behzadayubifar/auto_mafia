import 'package:flutter/material.dart';
import 'dart:async';

class TimerNight extends StatefulWidget {
  static const routeName = '/timer_night';

  const TimerNight({super.key});

  @override
  _TimerNightState createState() => _TimerNightState();
}

class _TimerNightState extends State<TimerNight> {
  int _secondsRemaining = 11;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          Navigator.of(context).pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Night Timer'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Night Timer',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                '$_secondsRemaining',
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
