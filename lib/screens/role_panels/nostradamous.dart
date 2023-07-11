import 'package:flutter/material.dart';
import '../../providers/player_data.dart';
import 'package:provider/provider.dart';

import '../Nights/night_screen.dart';
import '../nights/blocked_screen.dart';
import '../nights/linear_timer.dart';

class Nostradamous extends StatefulWidget {
  static const routeName = '/nostradamous';

  const Nostradamous({super.key});

  @override
  _NostradamousState createState() => _NostradamousState();
}

class _NostradamousState extends State<Nostradamous> {
  List<String> selectedPlayers = [];
  bool doneAction = false;

  bool isTimerFinished = false;

  @override
  void initState() {
    super.initState();
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final assignedRoles = playerData.assignedRoles;
    final List<String> alivesMinusNostradamous = assignedRoles.keys
        .where((playerName) => assignedRoles[playerName]!.name != 'نوستراداموس')
        .toList();
    // Initialize selectedPlayers with the first two players from alivesMinusNostradamous
    selectedPlayers = alivesMinusNostradamous.take(2).toList();
  }

  void onTimerFinished() {
    setState(() {
      isTimerFinished = true;
    });
    Navigator.of(context).popUntil(ModalRoute.withName(NightScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final night = playerData.night;
    final assignedRoles = playerData.assignedRoles;
    final List<String> alivesMinusNostradamous = assignedRoles.keys
        .where((playerName) => assignedRoles[playerName]!.name != 'نوستراداموس')
        .toList();
    String currentPlayerName = assignedRoles.keys.firstWhere(
        (playerName) => assignedRoles[playerName]!.name == 'نوستراداموس');
    final bool currentPlayerHandCuffStatus =
        assignedRoles[currentPlayerName]!.handCuffed;
    final code = assignedRoles[currentPlayerName]!.code;
    // final List shuffledSelectedPlayers = List.from(alivesMinusNostradamous);

    return WillPopScope(
      onWillPop: () async => isTimerFinished,
      child: currentPlayerHandCuffStatus
          ? BlockedScreen()
          : Scaffold(
              floatingActionButton: doneAction || night != 0
                  ? null
                  : FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          doneAction = true;
                        });
                        playerData.nostradamousActionDone = true;
                        playerData.nostradamousSelectedPlayers =
                            selectedPlayers;
                        print(playerData.nostradamousSelectedPlayers);
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text('نتیجه استعلام'),
                                content: Text(
                                    'از بین افراد انتخاب شده ${playerData.nostradamousEnquiryResult()} نفر مافیا بودند'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('باشه'),
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
                title: const Text('Nostradamous'),
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
                          child: doneAction || night != 0
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
                                          alivesMinusNostradamous[index];
                                      final isSelected =
                                          selectedPlayers.contains(playerName);
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
                                              selectedPlayers
                                                  .remove(playerName);
                                              print(selectedPlayers);
                                            } else {
                                              if (selectedPlayers.length >= 2) {
                                                selectedPlayers.removeAt(0);
                                                print(selectedPlayers);
                                              }
                                              selectedPlayers.add(playerName);
                                              print(selectedPlayers);
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
                                    itemCount: alivesMinusNostradamous.length,
                                  ),
                                ),
                        ),
                      ],
                    ),
            ),
    );
  }
}
