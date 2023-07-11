import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_data.dart';
import '../../widgets/player_actions_dialog.dart';
import '../../widgets/dialog_utils.dart';

class DayScreen extends StatefulWidget {
  static const routeName = '/day';

  const DayScreen({super.key});

  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  Map<String, List<Map<String, bool>>> playersSpeakingTurn = {};
  int? day;
  List<String> selectedPlayersToKill = [];

  @override
  void initState() {
    super.initState();
    final playerData = Provider.of<PlayerData>(context, listen: false);
    day = playerData.day;
    final alives = playerData.alives;
    for (var playerName in alives) {
      playersSpeakingTurn[playerName] = [
        {'challenge': false},
        {'main speech': false},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final alives = playerData.alives;
    final day = playerData.day;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          day == 0
              ? showDialog(
                  context: context,
                  builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        content: const Text('بریم شب یا نه ؟'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              playerData.startNight(context);
                            },
                            child: const Text('بریم'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('نه'),
                          ),
                        ],
                      )),
                )
              : showKillPlayerDialog(context, selectedPlayersToKill, alives,
                  (List<String> selectedPlayersToKill) {
                  playerData.moveToDead(selectedPlayersToKill.first);
                }, playerData.startNight);
          print('Selected Players to Kill: $selectedPlayersToKill');

          print('Dead Players: ${playerData.dead}');
          print('Alive Players: ${playerData.alives}');
        },
        child: const Icon(Icons.nightlight_outlined),
      ),
      appBar: AppBar(
        title: (day == 0) ? const Text('Introducing Day') : Text('Day $day'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: alives.length,
            itemBuilder: (context, index) {
              final playerName = alives[index];
              final playerStatus = playersSpeakingTurn[playerName] ??
                  [
                    {'challenge': false},
                    {'main speech': false},
                  ];
              final bool challengeUsed = playerStatus[0]['challenge'] ?? false;
              final bool mainSpeechUsed =
                  playerStatus[1]['main speech'] ?? false;

              return Opacity(
                opacity: (challengeUsed && mainSpeechUsed) ? 0.5 : 1.0,
                child: ListTile(
                  title: Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: (mainSpeechUsed && challengeUsed)
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  '$playerName\'s turn to speak',
                                  textAlign: TextAlign.center,
                                ),
                                alignment: Alignment.center,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Opacity(
                                      opacity: challengeUsed ? 0.5 : 1.0,
                                      child: ElevatedButton(
                                        onPressed: challengeUsed
                                            ? null
                                            : () {
                                                setState(() {
                                                  playersSpeakingTurn[
                                                          playerName]![0]
                                                      ['challenge'] = true;
                                                });
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return PlayerActionsDialog(
                                                      seconds: 30,
                                                      playerName: playerName,
                                                    );
                                                  },
                                                );
                                              },
                                        child: const Text(
                                          'Challenge',
                                          style: TextStyle(fontSize: 35),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Opacity(
                                      opacity: mainSpeechUsed ? 0.5 : 1.0,
                                      child: ElevatedButton(
                                        onPressed: mainSpeechUsed
                                            ? null
                                            : () {
                                                setState(() {
                                                  playersSpeakingTurn[
                                                          playerName]![1]
                                                      ['main speech'] = true;
                                                });
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return PlayerActionsDialog(
                                                      seconds: 50,
                                                      playerName: playerName,
                                                    );
                                                  },
                                                );
                                              },
                                        child: const Text(
                                          'Main Speech',
                                          style: TextStyle(fontSize: 35),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 8,
            ),
          ),
        ),
      ),
    );
  }
}
