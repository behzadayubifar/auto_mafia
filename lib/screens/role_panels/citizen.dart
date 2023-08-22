import 'package:flutter/material.dart';
import '../../providers/player_data.dart';
import 'package:provider/provider.dart';

import '../Nights/night_screen.dart';
import '../nights/blocked_screen.dart';
import '../nights/linear_timer.dart';

class Citizen extends StatefulWidget {
  static const routeName = '/citizen';

  const Citizen({super.key});

  @override
  _CitizenState createState() => _CitizenState();
}

class _CitizenState extends State<Citizen> {
  bool isTimerFinished = false;

  void onTimerFinished() {
    setState(() {
      isTimerFinished = true;
    });
    Navigator.of(context).popUntil(ModalRoute.withName(NightScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final assignedRoles = playerData.assignedRoles;
    String currentPlayerName = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'شهر ساده');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayerName]!.handCuffed;
    final code = assignedRoles[currentPlayerName]!.code;

    return WillPopScope(
      onWillPop: () async => isTimerFinished,
      child: currentPlayerHandCuffStatus
          ? const BlockedScreen()
          : Scaffold(
              appBar: AppBar(
                title: const Text('Citizen'),
              ),
              body: isTimerFinished
                  ? const Center(
                      child: Text(
                        'Timer Finished',
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LinearTimer(
                          // Set the desired duration for the timer
                          onTimerFinished: onTimerFinished,
                        ),
                        Text('code : $code'),
                      ],
                    ),
            ),
    );
  }
}



// There Must be a receptor for order of citizens to make difirent Citizen Panels