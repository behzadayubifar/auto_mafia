import 'package:flutter/material.dart';
import 'dart:async';

class LinearTimer extends StatefulWidget {
  final VoidCallback onTimerFinished;

  const LinearTimer({
    super.key,
    required this.onTimerFinished,
  });

  @override
  _LinearTimerState createState() => _LinearTimerState();
}

class _LinearTimerState extends State<LinearTimer> {
  double _progress = 10.0;
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
    int totalSeconds = 15;
    int elapsedSeconds = 0;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedSeconds++;
        _progress = (totalSeconds - elapsedSeconds) / totalSeconds;

        if (elapsedSeconds >= totalSeconds) {
          _timer.cancel();
          widget.onTimerFinished();
          // Navigator.of(context).pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(alignment: Alignment.center, children: [
        // Text(_progress.toStringAsFixed(0)),
        LinearProgressIndicator(
          value: _progress,
          minHeight: 10,
        ),
      ]),
    );
  }
}
