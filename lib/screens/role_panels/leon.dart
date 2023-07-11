import 'package:flutter/material.dart';
import 'package:god_father/model/role.dart';
import '../../providers/player_data.dart';
import 'package:provider/provider.dart';

import '../Nights/night_screen.dart';
import '../nights/blocked_screen.dart';
import '../nights/linear_timer.dart';

class Leon extends StatefulWidget {
  static const routeName = '/leon';

  const Leon({super.key});

  @override
  _LeonState createState() => _LeonState();
}

class _LeonState extends State<Leon> {
  String selectedPlayer = '';
  late bool doneAction = false;

  bool isTimerFinished = false;

  void onTimerFinished() {
    setState(() {
      isTimerFinished = true;
    });
    Navigator.of(context).popUntil(ModalRoute.withName(NightScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final PlayerData playerData =
        Provider.of<PlayerData>(context, listen: false);
    final int bullets = playerData.leonBullets;
    final List<String> dead = playerData.dead;
    final Map<String, Role> assignedRoles = playerData.assignedRoles;
    final List<String> alivesMinusMatador = assignedRoles.keys
        .where((playerName) =>
            assignedRoles[playerName]!.name != 'لئون حرفه ای' &&
            !dead.contains(playerName))
        .toList();
    String currentPlayerName = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'لئون حرفه ای');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayerName]!.handCuffed;
    final bool isLeonRunOutOFBulletsOrdoneAction = bullets == 0 || doneAction;
    final code = assignedRoles[currentPlayerName]!.code;

    return WillPopScope(
      onWillPop: () async => isTimerFinished,
      child: currentPlayerHandCuffStatus
          ? BlockedScreen()
          : Scaffold(
              floatingActionButton: isLeonRunOutOFBulletsOrdoneAction ||
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
                                title: Text('آیا اطمینان دارید ؟'),
                                content:
                                    Text('شما $selectedPlayer را انتخاب کردید'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        doneAction = true;
                                      });
                                      playerData.leon(selectedPlayer);
                                      print(
                                        '$selectedPlayer\'s heart : ${assignedRoles[selectedPlayer]!.heart}',
                                      );

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
                      child: isLeonRunOutOFBulletsOrdoneAction
                          ? null
                          : const Icon(Icons.check),
                    ),
              floatingActionButtonAnimator:
                  FloatingActionButtonAnimator.scaling,
              appBar: AppBar(
                title: const Text('Leon'),
              ),
              body: isTimerFinished
                  ? const Center(
                      child: Text(
                        'Timer Finished',
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LinearTimer(
                          // Set the desired duration for the timer
                          onTimerFinished: onTimerFinished,
                        ),
                        Text('code : $code'),
                        bullets == 0
                            ? const Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text('خشاب شما خالی است !'))
                            : Expanded(
                                child: doneAction
                                    ? const Text(
                                        'منتظر بمانید تا زمانتان تمام شود')
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView.separated(
                                          padding: const EdgeInsets.all(9),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final playerName =
                                                alivesMinusMatador[index];
                                            final isSelected =
                                                playerName == selectedPlayer;
                                            return Material(
                                              child: ListTile(
                                                tileColor: isSelected
                                                    ? Colors.deepPurple[800]
                                                    : Theme.of(context)
                                                        .primaryColor,
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
                                          itemCount: alivesMinusMatador.length,
                                        ),
                                      ),
                              ),
                      ],
                    )),
    );
  }
}
