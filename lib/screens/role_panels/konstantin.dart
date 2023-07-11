import 'package:flutter/material.dart';
import 'package:god_father/screens/nights/linear_timer.dart';
import '../../providers/player_data.dart';
import 'package:provider/provider.dart';
import '../Nights/night_screen.dart';
import '../nights/blocked_screen.dart';

class Konstantin extends StatefulWidget {
  static const routeName = '/konstantin';

  const Konstantin({super.key});

  @override
  _KonstantinState createState() => _KonstantinState();
}

class _KonstantinState extends State<Konstantin> {
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
    List<String> emptyList = [];
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final assignedRoles = playerData.assignedRoles;
    final List<String> deadWhoCanBeReturned =
        !playerData.konstantinActionDone[0]
            ? playerData.dead
                .where((playerName) =>
                    assignedRoles[playerName]?.isReversible == true &&
                    assignedRoles[playerName]?.disclosured == false)
                .toList()
            : emptyList;
    String currentPlayerName = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'کنستانتین');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayerName]!.handCuffed;
    final code = assignedRoles[currentPlayerName]!.code;

    return WillPopScope(
      onWillPop: () async => isTimerFinished,
      child: currentPlayerHandCuffStatus
          ? BlockedScreen()
          : Scaffold(
              floatingActionButton: doneAction || selectedPlayer.isEmpty
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
                                content: selectedPlayer.isNotEmpty
                                    ? Text(
                                        'شما $selectedPlayer را انتخاب کردید')
                                    : const Text('امشب برنمی‌گردانم'),
                                actions: [
                                  TextButton(
                                    onPressed: selectedPlayer.isNotEmpty
                                        ? () {
                                            playerData
                                                .returnPlayer(selectedPlayer);
                                            setState(() {
                                              doneAction = true;
                                            });
                                            print(
                                                'Kane Action Done Status : ${playerData.kaneActionDone}');

                                            print(
                                                'kaneRightChoice : ${playerData.kaneRightChoice}');
                                            Navigator.of(context).pop();
                                          }
                                        : () {
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
              floatingActionButtonAnimator:
                  FloatingActionButtonAnimator.scaling,
              appBar: AppBar(
                title: const Text(
                  'کنستانتین',
                ),
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
                                          deadWhoCanBeReturned[index];
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
                                    itemCount: deadWhoCanBeReturned.length,
                                  ),
                                ),
                        ),
                      ],
                    )),
    );
  }
}
