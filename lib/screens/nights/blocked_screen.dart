import 'package:flutter/material.dart';
import 'linear_timer.dart';

class BlockedScreen extends StatefulWidget {
  static const routeName = '/blocked';

  const BlockedScreen({super.key});

  @override
  State<BlockedScreen> createState() => _BlockedScreenState();
}

class _BlockedScreenState extends State<BlockedScreen> {
  bool isTimerFinished = false;

  void onTimerFinished() {
    setState(() {
      isTimerFinished = true;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocked'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: isTimerFinished
            ? const Center(
                child: Text(
                  'Timer Finished',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: LinearTimer(
                        // Set the desired duration for the timer
                        onTimerFinished: onTimerFinished,
                      ),
                    ),
                    const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                        child: Text('شما بسته شده اید !'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
