import 'package:flutter/material.dart';
import 'package:god_father/screens/nights/blocked_screen.dart';
import '../nights/timer_night.dart';
import '../role_panels/doctor.dart';
import '../role_panels/god_father.dart';
import '../role_panels/kane.dart';
import '../role_panels/konstantin.dart';
import '../role_panels/leon.dart';
import '../role_panels/matador.dart';
import '../role_panels/nostradamous.dart';
import 'package:provider/provider.dart';
import '../../providers/player_data.dart';

class NightScreen extends StatefulWidget {
  static const routeName = '/night';

  const NightScreen({Key? key}) : super(key: key);

  @override
  _NightScreenState createState() => _NightScreenState();
}

class _NightScreenState extends State<NightScreen> {
  int firstRoundDonePlayersNumbers = 0;
  late List<String> displayedAlives;
  List<String> removedPlayers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void removePlayerFromTheList(String playerName) {
    setState(() {
      displayedAlives.remove(playerName);
      removedPlayers.add(playerName);
    });
  }

  void resetTheList() {
    setState(() {
      displayedAlives = removedPlayers;
      removedPlayers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context);
    final assignedRoles = playerData.assignedRoles;
    final alives = playerData.alives;
    final nightNumber = playerData.night;
    // var round = playerData.nightRound;

    displayedAlives = List<String>.from(alives);

    // Exclude the removed players from displayedAlives
    displayedAlives.removeWhere((player) => removedPlayers.contains(player));

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /*  FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              if (firstRoundDonePlayersNumbers == alives.length &&
                  nightNumber != 0) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('آغاز عملیات اعضای شهر'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          playerData.nightRound = 2;
                          resetTheList();
                          print('round: $round');
                          Navigator.of(context).pop();
                        },
                        child: const Text('باشه'),
                      ),
                    ],
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('خطا'),
                    content: nightNumber == 0
                        ? const Text('شب اول نمیتوانید عملیات را آغاز کنید')
                        : const Text('هنوز دور مافیا تمام نشده است'),
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
              }
            },
            child: const Icon(Icons.queue_play_next_rounded),
          ), */
          GestureDetector(
            onTap: () {
              // Your existing code for the onPressed callback
              /// fix the bug when someone returned to the game the first round done players number was not reseted and
              /// goes not to day
              ///
              // if (firstRoundDonePlayersNumbers >= (alives.length - 1)) {
              playerData.godToDay(context);
              //   for (var player in alives) {
              //     print("$player's code : ${assignedRoles[player]!.code}");
              //   }
              // } else {
              //   showDialog(
              //     context: context,
              //     builder: (context) => const Directionality(
              //       textDirection: TextDirection.rtl,
              //       child: AlertDialog(
              //         title: Text('هنوز نمی‌توانید به روز بروید'),
              //       ),
              //     ),
              //   );
              // }
            },
            child: const FloatingActionButton(
              heroTag: 'btn2',
              onPressed: null,
              child: Icon(Icons
                  .check), // Set onPressed to null since GestureDetector will handle the onTap event
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: nightNumber == 0
            ? const Text('Introducing Night')
            : Text('Night $nightNumber'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final playerName = displayedAlives[index];
              return Material(
                child: ListTile(
                  tileColor: Theme.of(context).primaryColor,
                  title: Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            content: Text('آیا شما $playerName هستید ؟'),
                            actions: [
                              Row(
                                children: <TextButton>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('خیر')),
                                  TextButton(
                                    child: const Text('بله'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      switch (assignedRoles[playerName]!.name) {
                                        case 'نوستراداموس':
                                          {
                                            Navigator.of(context).pushNamed(
                                                Nostradamous.routeName);
                                          }
                                          break;
                                        case 'پدرخوانده':
                                          if (nightNumber > 0) {
                                            Navigator.of(context)
                                                .pushNamed(GodFather.routeName);
                                          }
                                          if (nightNumber == 0) {
                                            Navigator.of(context).pushNamed(
                                                TimerNight.routeName);
                                          }
                                          break;
                                        case 'ماتادور':
                                          if (nightNumber > 0) {
                                            Navigator.of(context)
                                                .pushNamed(Matador.routeName);
                                          }
                                          if (nightNumber == 0) {
                                            Navigator.of(context).pushNamed(
                                                TimerNight.routeName);
                                          }
                                          break;
                                        case 'لئون حرفه ای':
                                          if (nightNumber > 0) {
                                            Navigator.of(context)
                                                .pushNamed(Leon.routeName);
                                          }
                                          if (nightNumber == 0) {
                                            Navigator.of(context).pushNamed(
                                                TimerNight.routeName);
                                          }
                                          break;
                                        case 'دکتر واتسون':
                                          if (nightNumber > 0) {
                                            Navigator.of(context)
                                                .pushNamed(Doctor.routeName);
                                          }
                                          if (nightNumber == 0) {
                                            Navigator.of(context).pushNamed(
                                                TimerNight.routeName);
                                          }
                                          break;
                                        case 'همشهری کین':
                                          if (nightNumber > 0) {
                                            Navigator.of(context)
                                                .pushNamed(Kane.routeName);
                                          }
                                          if (nightNumber == 0) {
                                            Navigator.of(context).pushNamed(
                                                TimerNight.routeName);
                                          }
                                          break;
                                        case 'کنستانتین':
                                          if (nightNumber > 0) {
                                            Navigator.of(context).pushNamed(
                                                Konstantin.routeName);
                                          }
                                          if (nightNumber == 0) {
                                            Navigator.of(context).pushNamed(
                                                TimerNight.routeName);
                                          }
                                          break;
                                        case 'شهر ساده':
                                          Navigator.of(context)
                                              .pushNamed(TimerNight.routeName);
                                          break;
                                      }

                                      removePlayerFromTheList(playerName);
                                      firstRoundDonePlayersNumbers++;
                                      print(firstRoundDonePlayersNumbers);
                                      // print('round = $round');
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: displayedAlives.length,
          ),
        ),
      ),
    );
  }
}
