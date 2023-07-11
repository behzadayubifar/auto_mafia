import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/Days/day_screen.dart';

class PlayerActionsDialog extends StatefulWidget {
  final String playerName;
  final int seconds;

  const PlayerActionsDialog({super.key, 
    required this.playerName,
    required this.seconds,
  });

  @override
  _PlayerActionsDialogState createState() => _PlayerActionsDialogState();
}

class _PlayerActionsDialogState extends State<PlayerActionsDialog> {
  int secondsRemaining = 0;
  bool timerStarted = false;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    startTimer(widget.seconds);
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  void startTimer(int seconds) {
    secondsRemaining = seconds;
    timerStarted = true;

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0 && timerStarted == true) {
          secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void pauseTimer() {
    setState(() {
      timerStarted = false;
    });
  }

  void resumeTimer() {
    setState(() {
      timerStarted = true;
      startTimer(secondsRemaining);
    });
  }

  void endTurn() {
    setState(() {
      timerStarted = false;
      // Provider.of<PlayerData>(context, listen: false).endSpeakingTurn = true;
    });
    Navigator.popUntil(context, ModalRoute.withName(DayScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '${widget.playerName}\'s turn to speak',
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Timer: $secondsRemaining seconds'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: timerStarted ? pauseTimer : resumeTimer,
            child: Text(
              timerStarted ? 'Pause' : 'Resume',
              style: const TextStyle(fontSize: 35),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: endTurn,
            child: const Text(
              'End',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}
