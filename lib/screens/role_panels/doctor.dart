import 'package:flutter/material.dart';
import '../../providers/player_data.dart';
import 'package:provider/provider.dart';

import '../Nights/night_screen.dart';
import '../nights/blocked_screen.dart';
import '../nights/linear_timer.dart';

class Doctor extends StatefulWidget {
  static const routeName = '/doctor';

  const Doctor({super.key});

  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
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
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final assignedRoles = playerData.assignedRoles;
    final dead = playerData.dead;
    final alives = playerData.alives;
    final List<String> alivesMinusDoctor = playerData.isDoctorSavedOnce[0]
        ? assignedRoles.keys
            .where((playerName) =>
                assignedRoles[playerName]!.name != 'دکتر واتسون' &&
                !dead.contains(playerName))
            .toList()
        : alives;
    String currentPlayerName = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'دکتر واتسون');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayerName]!.handCuffed;
    final code = assignedRoles[currentPlayerName]!.code;

    return WillPopScope(
      onWillPop: () async => isTimerFinished,
      child: currentPlayerHandCuffStatus
          ? const BlockedScreen()
          : Scaffold(
              floatingActionButton: doneAction
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
                                content:
                                    Text('شما $selectedPlayer را انتخاب کردید'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      playerData.doctor(selectedPlayer);
                                      setState(() {
                                        doneAction = true;
                                      });
                                      print(assignedRoles[selectedPlayer]!
                                                  .name ==
                                              'دکتر واتسون'
                                          ? 'doctor\'s saving once status : ${playerData.isDoctorSavedOnce} & player\'s saving status ${assignedRoles[selectedPlayer]!.isSaved}'
                                          : '$selectedPlayer\'s saving status : ${assignedRoles[selectedPlayer]!.isSaved}');

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('باشه'),
                                  ),
                                  TextButton(
                                      onPressed: Navigator.of(context).pop,
                                      child: Text('منصرف شدم'))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.check),
                    ),
              floatingActionButtonAnimator:
                  FloatingActionButtonAnimator.scaling,
              appBar: AppBar(
                title: const Text('Doctor Watson'),
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
                        Expanded(
                          child: doneAction
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
                                          alivesMinusDoctor[index];
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
                                    itemCount: alivesMinusDoctor.length,
                                  ),
                                ),
                        ),
                      ],
                    ),
            ),
    );
  }
}
