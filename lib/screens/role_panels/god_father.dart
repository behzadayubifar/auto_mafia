import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/player_data.dart';
import '../Nights/night_screen.dart';
import '../nights/linear_timer.dart';

class ShootDialog extends StatefulWidget {
  final List<String> alivesMinusMafia;
  final Function(String) onShoot;

  const ShootDialog(
      {super.key, required this.alivesMinusMafia, required this.onShoot});

  @override
  _ShootDialogState createState() => _ShootDialogState();
}

class _ShootDialogState extends State<ShootDialog> {
  String selectedPlayer = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.alivesMinusMafia.length,
          itemBuilder: (BuildContext context, int index) {
            final playerName = widget.alivesMinusMafia[index];
            final isSelected = playerName == selectedPlayer;
            return Material(
              child: ListTile(
                tileColor: isSelected
                    ? Colors.deepPurple[800]
                    : Theme.of(context).primaryColor,
                title: Text(
                  playerName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      // Remove player from selected player
                      selectedPlayer = '';
                    } else {
                      // Add player to selected player
                      selectedPlayer = playerName;
                      print(selectedPlayer);
                    }
                  });
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: selectedPlayer.isNotEmpty
              ? () {
                  widget.onShoot(selectedPlayer);
                  Navigator.of(context).pop();
                }
              : null,
          child: const Text('شلیک کن'),
        ),
      ],
    );
  }
}

class GodFather extends StatefulWidget {
  static const routeName = '/god-father';

  const GodFather({super.key});

  @override
  State<GodFather> createState() => _GodFatherState();
}

class _GodFatherState extends State<GodFather> {
  String selectedPlayer = '';

  bool isTimerFinished = false;

  void onTimerFinished() {
    setState(() {
      isTimerFinished = true;
    });
    Navigator.of(context).popUntil(ModalRoute.withName(NightScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context);
    final dead = playerData.dead;
    final assignedRoles = playerData.assignedRoles;
    final List<String> alivesMinusMafia = assignedRoles.keys
        .where((playerName) =>
            assignedRoles[playerName]!.name != 'ماتادور' &&
            assignedRoles[playerName]!.name != 'پدرخوانده' &&
            !dead.contains(playerName))
        .toList();
    String currentPlayerName = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'پدرخوانده');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayerName]!.handCuffed;
    final bool isSixthSenseEnabled =
        !currentPlayerHandCuffStatus && playerData.mafiaBullet != 0;

    print('mafia bullet is : ${playerData.mafiaBullet}');

    void showShootDialog(BuildContext context) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ShootDialog(
            alivesMinusMafia: alivesMinusMafia,
            onShoot: (selectedPlayer) {
              playerData.mafiaShoot(selectedPlayer, context);
            },
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async => isTimerFinished,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('God Father'),
        ),
        body: isTimerFinished
            ? const Center(
                child: Text(
                  'Timer Finished',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinearTimer(
                      // Set the desired duration for the timer
                      onTimerFinished: onTimerFinished,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: isSixthSenseEnabled
                                ? () {
                                    playerData
                                        .sixthSenseDropdownButton(context);
                                  }
                                : null,
                            child: Text(
                              'حس ششم',
                              style: !isSixthSenseEnabled
                                  ? const TextStyle(
                                      color: Colors.red,
                                      overflow: TextOverflow.fade)
                                  : null,
                            ),
                          ),
                          const Divider(),
                          ElevatedButton(
                              onPressed: playerData.mafiaBullet > 0
                                  ? () {
                                      showShootDialog(context);
                                    }
                                  : () {},
                              child: Text('شلیک',
                                  style: playerData.mafiaBullet > 0
                                      ? null
                                      : const TextStyle(color: Colors.red))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
