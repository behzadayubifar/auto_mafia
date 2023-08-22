import 'package:flutter/material.dart';
import 'package:god_father/screens/nights/night_screen.dart';
import '../../providers/player_data.dart';
import 'package:provider/provider.dart';

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

class Matador extends StatefulWidget {
  static const routeName = '/matador';

  const Matador({super.key});

  @override
  _MatadorState createState() => _MatadorState();
}

class _MatadorState extends State<Matador> {
  String selectedPlayer = '';
  late bool matadordDoneAction = false;
  late bool godFatherDoneAction = false;

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
    final assignedRoles = playerData.assignedRoles;
    final dead = playerData.dead;
    final blackList = playerData.lastNightBlocked;
    final int currentNight = playerData.night;
    final String cantBeBlocked =
        blackList[1] == currentNight - 1 ? blackList[0] : '';
    // hamaro beriz to ye list baad azash kam kon
    final List<String> alivesMinusMafiaAndLastNightBlocked = assignedRoles.keys
        .where((playerName) =>
            assignedRoles[playerName]!.name != 'ماتادور' &&
            assignedRoles[playerName]!.name != 'پدرخوانده' &&
            !dead.contains(playerName) &&
            playerName != cantBeBlocked)
        .toList();
    final List<String> alivesMinusMafia = assignedRoles.keys
        .where((playerName) =>
            assignedRoles[playerName]!.name != 'ماتادور' &&
            assignedRoles[playerName]!.name != 'پدرخوانده' &&
            !dead.contains(playerName))
        .toList();
    /* &&
              assignedRoles[playerName]!.name != lastNightBlocked, */
    /// final lastNightBlocked = playerData.
    ///
    ///
    ///
    String currentPlayer = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'ماتادور');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayer]!.handCuffed;
    final bool shootEnabledStatus = playerData.dead.contains(assignedRoles.keys
            .firstWhere(
                (playerName) => assignedRoles[playerName]!.name == 'پدرخوانده'))
        ? true
        : false;

    void showShootDialog(BuildContext context) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ShootDialog(
            alivesMinusMafia: alivesMinusMafiaAndLastNightBlocked,
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
          floatingActionButton: currentPlayerHandCuffStatus ||
                  matadordDoneAction ||
                  selectedPlayer.isEmpty
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: const Text('آیا اطمینان دارید ؟'),
                            content: Text('شما به $selectedPlayer دستبند زدید'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (!currentPlayerHandCuffStatus) {
                                    playerData.roleBlocking(
                                        selectedPlayer,
                                        assignedRoles[selectedPlayer]!
                                            .isBlocked,
                                        context);
                                    print(
                                        '${selectedPlayer}s blockage status : ${assignedRoles[selectedPlayer]!.isBlocked}');
                                  }
                                  setState(() {
                                    matadordDoneAction = true;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text('باشه'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('منصرف شدم'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.check),
                ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          appBar: AppBar(
            title: const Text('Matador'),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LinearTimer(
                        // Set the desired duration for the timer
                        onTimerFinished: onTimerFinished,
                      ),
                      currentPlayerHandCuffStatus
                          ? const Center(child: Text('شما دستبند دارید !'))
                          : matadordDoneAction
                              ? const Text('منتظر بمانید تا زمانتان تمام شود')
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(9),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final playerName =
                                          alivesMinusMafiaAndLastNightBlocked[
                                              index];
                                      final isSelected =
                                          playerName == selectedPlayer;
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
                                            if (isSelected) {
                                              // Remove player from selected player
                                              selectedPlayer = '';
                                            } else {
                                              // Add player to selected player
                                              selectedPlayer = playerName;
                                              print(selectedPlayer);
                                            }
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      height: 8,
                                    ),
                                    itemCount: alivesMinusMafia.length,
                                  ),
                                ),
                      shootEnabledStatus && !godFatherDoneAction
                          ? TextButton(
                              onPressed: () {
                                showShootDialog(context);
                              },
                              child: const Text('شلیک به جای پدر خوانده'))
                          : const SizedBox(),
                    ],
                  ),
                )),
    );
  }
}
