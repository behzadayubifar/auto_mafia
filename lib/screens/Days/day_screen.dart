import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:god_father/data/local/db/app_db.dart';
import 'package:provider/provider.dart';
import '../../providers/player_data.dart';
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
  bool showPlayerGrid = false;
  Set<String> tappedPlayers = {};

  void togglePlayerGridVisibility() {
    setState(() {
      showPlayerGrid = !showPlayerGrid;
    });
  }

  void onPlayerNameTapped(String playerName) {
    setState(() {
      tappedPlayers.add(playerName);
    });
  }

  getPlayerCode(String playerName) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final assignedRoles = playerData.assignedRoles;
    return assignedRoles[playerName]?.code ?? 'برو خودتو سر کار بذار';
  }

  void resetTappedPlayers() {
    setState(() {
      tappedPlayers.clear();
    });
  }

  // Function to show the assigned code in a dialog
  void showAssignedCode(String playerName) {
    final playerCode = getPlayerCode(playerName);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$playerName'),
          content: Text('کد: $playerCode'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final _db = Provider.of<AppDb>(context);
    final alives = playerData.alives;
    final day = playerData.day;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FloatingActionButton(
            heroTag: 'nightlight_outlined',
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
                                  resetTappedPlayers();
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
          FloatingActionButton(
            heroTag: 'code',
            onPressed: () {
              // build a grid view of all the players who are alive which when is tapped on a player it will show the assigned code for that player
              togglePlayerGridVisibility();
              showDialog(
                context: context,
                builder: (context) {
                  return buildPlayerGridOverlay(context);
                },
              );
            },
            child: Icon(Icons.code),
          )
        ],
      ),
      appBar: AppBar(
        title: (day == 0) ? const Text('Introducing Day') : Text('Day $day'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DriftDbViewer(_db)));
            },
            icon: const Icon(Icons.help_center_rounded),
            label: const Text(
              'Help',
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<InCommonData>>(
            future: Provider.of<AppDb>(context).getAllPlayers(),
            builder: (context, snapshot) {
              final List<InCommonData>? players = snapshot.data;

              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (players != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return Card(
                      child: Column(
                        children: [
                          Text(player.id.toString()),
                          Text(player.playerName),
                          Text(player.roleName),
                        ],
                      ),
                    );
                  },
                  itemCount: players.length,
                );
              }
              return const Text('No Data');
            },
          ),
          // child: ListView.separated(
          //   itemCount: alives.length,
          //   itemBuilder: (context, index) {
          //     final playerName = alives[index];
          //     final playerStatus = playersSpeakingTurn[playerName] ??
          //         [
          //           {'challenge': false},
          //           {'main speech': false},
          //         ];
          //     final bool challengeUsed = playerStatus[0]['challenge'] ?? false;
          //     final bool mainSpeechUsed =
          //         playerStatus[1]['main speech'] ?? false;

          //     return Opacity(
          //       opacity: (challengeUsed && mainSpeechUsed) ? 0.5 : 1.0,
          //       child: ListTile(
          //         title: Text(
          //           playerName,
          //           style: const TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         trailing: const Icon(Icons.arrow_forward),
          //         onTap: (mainSpeechUsed && challengeUsed)
          //             ? null
          //             : () {
          //                 showDialog(
          //                   context: context,
          //                   builder: (BuildContext context) {
          //                     return AlertDialog(
          //                       title: Text(
          //                         '$playerName\'s turn to speak',
          //                         textAlign: TextAlign.center,
          //                       ),
          //                       alignment: Alignment.center,
          //                       content: Column(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           Opacity(
          //                             opacity: challengeUsed ? 0.5 : 1.0,
          //                             child: ElevatedButton(
          //                               onPressed: challengeUsed
          //                                   ? null
          //                                   : () {
          //                                       setState(() {
          //                                         playersSpeakingTurn[
          //                                                 playerName]![0]
          //                                             ['challenge'] = true;
          //                                       });
          //                                       showDialog(
          //                                         barrierDismissible: false,
          //                                         context: context,
          //                                         builder: (context) {
          //                                           return PlayerActionsDialog(
          //                                             seconds: 30,
          //                                             playerName: playerName,
          //                                           );
          //                                         },
          //                                       );
          //                                     },
          //                               child: const Text(
          //                                 'Challenge',
          //                                 style: TextStyle(fontSize: 35),
          //                               ),
          //                             ),
          //                           ),
          //                           const SizedBox(height: 16),
          //                           Opacity(
          //                             opacity: mainSpeechUsed ? 0.5 : 1.0,
          //                             child: ElevatedButton(
          //                               onPressed: mainSpeechUsed
          //                                   ? null
          //                                   : () {
          //                                       setState(() {
          //                                         playersSpeakingTurn[
          //                                                 playerName]![1]
          //                                             ['main speech'] = true;
          //                                       });
          //                                       showDialog(
          //                                         barrierDismissible: false,
          //                                         context: context,
          //                                         builder: (context) {
          //                                           return PlayerActionsDialog(
          //                                             seconds: 50,
          //                                             playerName: playerName,
          //                                           );
          //                                         },
          //                                       );
          //                                     },
          //                               child: const Text(
          //                                 'Main Speech',
          //                                 style: TextStyle(fontSize: 35),
          //                               ),
          //                             ),
          //                           ),
          //                           const SizedBox(height: 16),
          //                         ],
          //                       ),
          //                     );
          //                   },
          //                 );
          //               },
          //       ),
          //     );
          //   },
          //   separatorBuilder: (BuildContext context, int index) =>
          //       const SizedBox(
          //     height: 8,
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget buildPlayerGridOverlay(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final alives = playerData.alives;

    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 27, 27),
          borderRadius: BorderRadius.circular(8),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: alives.length,
          itemBuilder: (context, index) {
            final playerName = alives[index];
            return GestureDetector(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                if (!tappedPlayers.contains(playerName)) {
                  showAssignedCode(playerName);
                  onPlayerNameTapped(
                      playerName); // Call the function when tapped
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 5, 56, 98),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(
                    playerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
