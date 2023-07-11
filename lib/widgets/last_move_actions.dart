import 'package:flutter/material.dart';
import 'package:god_father/providers/player_data.dart';
import 'package:provider/provider.dart';

import '../model/role.dart';

class LastMoveActions extends StatelessWidget {
  final String lastMove;
  final Map<String, Role> assignedRoles;
  final String currentPlayer;
  final List<String> alives;
  // final Function startNight;

  const LastMoveActions({
    super.key,
    required this.lastMove,
    required this.assignedRoles,
    required this.currentPlayer,
    required this.alives,
    // required this.startNight,
  });

  void facingOff(playerName) {
    final Role currentPlayerRole = assignedRoles[currentPlayer]!;
    final Role selectedPlayerRole = assignedRoles[playerName]!;
    assignedRoles[currentPlayer] = selectedPlayerRole;
    assignedRoles[playerName] = currentPlayerRole;

    for (var item in assignedRoles.entries) {
      print('${item.key} : ${item.value.name}');
    }
    assignedRoles[currentPlayer]!.disclosured = true;
    assignedRoles[playerName]!.heart = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: lastMove == 'افشای هویت'
          ? _buildIdentityRevealDialog(context)
          : _buildPlayerList(context),
    );
  }

  Widget _buildIdentityRevealDialog(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final startNight = playerData.startNight;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('افشای هویت'),
        content: Text(
            '$currentPlayer نقش ${assignedRoles[currentPlayer]!.name} را داشت'),
        actions: [
          TextButton(
            child: const Text('تایید'),
            onPressed: () {
              Navigator.of(context).pop();
              assignedRoles[currentPlayer]!.disclosured = true;
              startNight(context);
              playerData.removeLastMove(lastMove);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final startNight = playerData.startNight;
    final alives = playerData.alives;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: alives.length,
        itemBuilder: (context, index) {
          final playerName = alives[index];
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
                switch (lastMove) {
                  case 'سکوت بره ها':
                    startNight(context);
                    break;
                  /* case 'افشای هویت':                
                    break; */
                  case 'ذهن زیبا':
                    if (assignedRoles[currentPlayer]!.name == 'نوستراداموس') {
                      playerData.moveToAlive(currentPlayer);
                      // assignedRoles[currentPlayer]!.disclosured = true; for the time being !!!
                      assignedRoles[currentPlayer]!.heart = 1;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              title:
                                  Text('$currentPlayer خودش نوستراداموس است'),
                              actions: [
                                TextButton(
                                  child: const Text('تایید'),
                                  onPressed: () {
                                    startNight(context);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else if (assignedRoles[currentPlayer]!.name !=
                            'نوستراداموس' &&
                        assignedRoles[playerName]!.name == 'نوستراداموس') {
                      playerData.moveToDead(playerName);
                      playerData.moveToAlive(currentPlayer);
                      assignedRoles[playerName]!.disclosured = true;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('درست حدس زدی!'),
                            content:
                                Text('شما به جای $playerName در بازی می‌مانید'),
                            actions: [
                              TextButton(
                                child: const Text('تایید'),
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  startNight(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('اشتباه حدس زدی !!!'),
                            content: const Text('شما از بازی خارج می‌شوید'),
                            actions: [
                              TextButton(
                                child: const Text('تایید'),
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  startNight(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                    break;
                  case 'دستبند':
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('دستبند'),
                          content: Text('دستبند به $playerName داده شد'),
                          actions: [
                            TextButton(
                              child: const Text('تایید'),
                              onPressed: () {
                                assignedRoles[playerName]!.handCuffed = true;
                                startNight(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    break;
                  case 'تغییر چهره':
                    facingOff(playerName);
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'تعویض کارت برای ${assignedRoles[playerName]!.name}',
                            textDirection: TextDirection.rtl,
                          ),
                          content: Text(
                            'شما نقش خود را با ${assignedRoles[currentPlayer]!.name} عوض کردید',
                            textDirection: TextDirection.rtl,
                          ),
                          actions: [
                            TextButton(
                              child: const Text('تایید'),
                              onPressed: () {
                                startNight(context);
                                // Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    break;
                }
                playerData.removeLastMove(lastMove);
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 8),
      ),
    );
  }
}
