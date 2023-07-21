import 'dart:math';

import 'package:flutter/material.dart';
import 'package:god_father/model/last_move.dart';

import 'package:god_father/model/role.dart';
import 'package:god_father/screens/Days/victory.dart';
import 'package:provider/provider.dart';
import '../data/roles.dart';
import '../data/last_moves.dart';
import '../screens/Days/day_screen.dart';
import '../screens/Days/three_remained.dart';
import '../screens/nights/night_screen.dart';
import '../screens/show_roles_screen.dart';

class PlayerData extends ChangeNotifier {
  List<String> _playersNames = [];
  Map<String, Role> assignedRoles = {};
  List<Role> _allRoles = [];
  List<String> _alives = [];
  List<String> _dead = [];
  List<String> _purgatory = [];
  List<LastMove> _lastMove = LastMoves.lastMoves;
  List<String> nostradamousSelectedPlayers = [];
  List<String> _kaneRightChoice = [];
  List<int> codes = [];
  int? code;
  String _slaughter = '';
  late bool nostradamousActionDone = false;
  List _kaneActionDone = [false, 0];
  List _konstantinActionDone = [false, 0];
  List _isDoctorSavedOnce = [false, 0];
  int _leonBullets = 2;
  bool _leonWrongShot = false;
  List _lastNightBlocked = ['', 0];
  int _mafia = 0;
  int _citizen = 0;
  int _independent = 0;
  int _day = 0, _night = 0;
  int _mafiaBullet = 1;
  // int _nightRound = 1;
  int _inquiryRemained = 2;
  bool leonHasShot = false;

  // Method to add a player to the alive list
  void addToAlive(String player) {
    alives.add(player);
    notifyListeners();
  }

  // Method to remove a player from the alive list and add them to the dead list
  void moveToDead(String player) {
    if (!dead.contains(player)) {
      alives.remove(player);
      dead.add(player);
      notifyListeners();
    }
  }

  // Method to remove a player from the dead list and add them to the alive list
  void moveToAlive(String player) {
    if (!alives.contains(player)) {
      dead.remove(player);
      alives.add(player);
      notifyListeners();
    }
  }

  int get mafia => _mafia;
  set mafia(int value) {
    _mafia = value;
    notifyListeners();
  }

  List get aliveMafias {
    List<String> aliveMafias = [];
    for (String player in alives) {
      if (_isMafia(player)) {
        aliveMafias.add(player);
      }
    }
    return aliveMafias;
  }

  int get citizen => _citizen;
  set citizen(int value) {
    _citizen = value;
    notifyListeners();
  }

  int get independent => _independent;
  set independent(int value) {
    _independent = value;
    notifyListeners();
  }

  int get inquiryRemained => _inquiryRemained;
  set inquiryRemained(int value) {
    _inquiryRemained = value;
    notifyListeners();
  }

/*   int get nightRound => _nightRound;
  set nightRound(int value) {
    _nightRound = value;
  } */

  List<String> get kaneRightChoice => _kaneRightChoice;
  set kaneRightChoice(List<String> value) {
    _kaneRightChoice = value;
    notifyListeners();
  }

  List<String> get purgatory => _purgatory;
  set purgatory(List<String> value) {
    _purgatory = value;
    notifyListeners();
  }

  String get slaughter => _slaughter;
  set slaughter(String value) {
    _slaughter = value;
    notifyListeners();
  }

  List get lastNightBlocked => _lastNightBlocked;
  set lastNightBlocked(List value) {
    _lastNightBlocked = value;
    notifyListeners();
  }

  List<String> get alives => _alives;

  List<String> get dead => _dead;
  set dead(List<String> newdead) {
    _dead = newdead;
    notifyListeners();
  }

  int get day => _day;
  int get night => _night;

  List<LastMove> get lastMove {
    // _lastMove.shuffle();
    for (var lastMove in _lastMove) {
      print('lastMove: ${lastMove.name}');
    }
    return _lastMove;
  }

  set lastMove(List<LastMove> newLastMove) {
    _lastMove = newLastMove;
    notifyListeners();
  }

  removeLastMove(String currentLastMove) {
    _lastMove.removeWhere((lastMove) => lastMove.name == currentLastMove);
    notifyListeners();
  }

  void removeSelectedLastMove(selectedLastMove) {
    lastMove.remove(selectedLastMove);
    //shuffle the lastMove list and update the original list
    lastMove.shuffle();
    notifyListeners();
  }

  int get voteToJudge => alives.length ~/ 2;
  int get voteToDead => (alives.length ~/ 2) + 1;

  List get kaneActionDone => _kaneActionDone;
  set kaneActionDone(List value) {
    _kaneActionDone = value;
    notifyListeners();
  }

  List get konstantinActionDone => _konstantinActionDone;
  set konstantinActionDone(List value) {
    _konstantinActionDone = value;
    notifyListeners();
  }

  List get isDoctorSavedOnce => _isDoctorSavedOnce;

  set isDoctorSavedOnce(List value) {
    _isDoctorSavedOnce = value;
    notifyListeners();
  }

  int get mafiaBullet => _mafiaBullet;
  set mafiaBullet(int value) {
    _mafiaBullet = value;
    notifyListeners();
  }

  int get leonBullets => _leonBullets;
  set leonBullets(int value) {
    _leonBullets = value;
    notifyListeners();
  }

  bool get leonWrongShot => _leonWrongShot;

  set leonWrongShot(bool value) {
    _leonWrongShot = value;
    notifyListeners();
  }

  _isMafia(String playerName) {
    if ((assignedRoles[playerName]?.type) == 'M') {
      return true;
    } else {
      return false;
    }
  }

  nostradamousEnquiryResult() {
    int i = 0;
    for (var playerName in nostradamousSelectedPlayers) {
      if (_isMafia(playerName) &&
          assignedRoles[playerName]!.name != 'پدرخوانده') {
        i++;
      }
    }
    return i;
  }

  leon(String playerName) {
    leonHasShot = true;
    print('Initial heart value : ${assignedRoles[playerName]!.heart}');
    if (_isMafia(playerName)) {
      assignedRoles[playerName]!.isShot = true;
      leonBullets--;
    } else {
      leonWrongShot = true;
    }
    notifyListeners();
    print('Leon WrongShot Status : $leonWrongShot');
  }

  doctor(playerName) {
    if (assignedRoles[playerName]?.name == 'دکتر واتسون') {
      isDoctorSavedOnce = [true, night];
      assignedRoles[playerName]?.isSaved = true;
    } else {
      assignedRoles[playerName]?.isSaved = true;
    }
    notifyListeners();
  }

  kane(String playerName) {
    kaneActionDone = [true, night];
    _isMafia(playerName) ? kaneRightChoice.add(playerName) : null;
    notifyListeners();
  }

  returnPlayer(String deadPlayerName) {
    if (assignedRoles[deadPlayerName]!.isReversible &&
        assignedRoles[deadPlayerName]!.disclosured == false) {
      assignedRoles[deadPlayerName]!.isReversible = false;
      purgatory.add(deadPlayerName);
      //
      konstantinActionDone = [true, night];
      notifyListeners();
    }
  }

  sixthSense(String playeName, String roleName) {
    if (assignedRoles[playeName]!.name == roleName) {
      slaughter = playeName;
      assignedRoles[playeName]!.disclosured = true;
    }
  }

  void sixthSenseDropdownButton(BuildContext context) {
    String? selectedPlayer;
    String? selectedRole;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedPlayer,
                    hint: const Text('برای انتخاب بازیکن کلیک کنید'),
                    onChanged: (String? value) {
                      setState(() {
                        selectedPlayer = value;
                      });
                    },
                    items: alives.map((String playerName) {
                      return DropdownMenuItem<String>(
                        value: playerName,
                        child: Text(playerName),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<String>(
                    value: selectedRole,
                    hint: const Text('برای انتخاب نقش حدس زده‌تان کلیک کنید'),
                    onChanged: (String? value) {
                      setState(() {
                        selectedRole = value;
                      });
                    },
                    items: _allRoles.map((Role role) {
                      return DropdownMenuItem<String>(
                        value: role.name,
                        child: Text(role.name),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedPlayer != null && selectedRole != null) {
                        mafiaBullet > 0 ? mafiaBullet-- : null;
                        // Handle sixth sense action
                        // Use selectedPlayer and selectedRole
                        sixthSense(selectedPlayer!, selectedRole!);
                        print(
                            'selected player : $selectedPlayer\nselected role : $selectedRole\nslaughter : $slaughter');
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void roleBlocking(
      String selectedPlayers, bool isBlocked, BuildContext context) {
    if (lastNightBlocked[0] == selectedPlayers &&
        lastNightBlocked[1] == night - 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('این بازیکن قبلا بلاک شده است'),
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
    } else {
      assignedRoles[selectedPlayers]!.isBlocked = true;
      lastNightBlocked = [selectedPlayers, night];
      code = assignedRoles[selectedPlayers]!.code;
    }
    notifyListeners();
  }

  void mafiaShoot(String playerName, BuildContext context) {
    Role? player = assignedRoles[playerName];
    if (mafiaBullet > 0) {
      mafiaBullet--;
      player?.isShot = true;
    } else {
      showDialog(
          context: context,
          builder: (context) => const Text('دیگر تیر ندارید'));
    }
    notifyListeners();
  }

  List<String> getPlayersNames() {
    return _playersNames;
  }

  startDay(context) {
    _night++;

    print('Night Round: $_night');

    inquiryRemained == 0 || _day == 1 || dead.isEmpty
        ? Navigator.of(context).pushReplacementNamed(DayScreen.routeName)
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  title: Text('Day $_day Starts Now'),
                  content: const Text('آیا استعلام می‌خواهید ؟'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(DayScreen.routeName);
                      },
                      child: const Text('خیر'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        inquiry(context);
                        inquiryRemained--;
                      },
                      child: const Text('بله'),
                    ),
                  ],
                ),
              );
            },
          );

    notifyListeners();
  }

  startNight(context) {
    godToNight();
    _day++;
    // nightRound = 1;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Night $_night Starts Now'),
            content: const Text('Tap on the screen to continue'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacementNamed(NightScreen.routeName);
                  for (String player in _alives) {
                    print('$player : ${assignedRoles[player]!.name}');
                  }
                  notifyListeners();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  String statistics() {
    String winnerSide = '';
    int aliveMafai = 0;
    for (String player in _alives) {
      if (_isMafia(player)) {
        aliveMafai++;
      }
    }
    if (aliveMafai == 0) {
      winnerSide = 'Citizen';
    } else if (aliveMafai >= _alives.length - aliveMafai) {
      winnerSide = 'Mafia';
    }

    return winnerSide;
  }

  godToDay(BuildContext context) {
//
    final playersCodes = [];
    if (code == null && night != 0) {
      for (var player in _playersNames) {
        playersCodes.add(assignedRoles[player]!.code);
      }
      code = codes.firstWhere((code) => !playersCodes.contains(code));
    }
//
    final blockedPlayer = alives.firstWhere(
      (player) => assignedRoles[player]!.isBlocked == true,
      orElse: () => '',
    );
//
    switch (assignedRoles[blockedPlayer]?.name) {
      case 'لئون حرفه ای':
        if (leonHasShot) {
          leonBullets++;
          leonWrongShot = false;
          assignedRoles.keys
              .where((player) => aliveMafias.contains(player))
              .forEach((player) {
            assignedRoles[player]!.isShot = false;
          });
          print('leonWrongShot : $leonHasShot');
          print('leon bullets : $leonBullets');
        }
        notifyListeners();
        break;
      case 'دکتر واتسون':
        if (isDoctorSavedOnce[0] == true && isDoctorSavedOnce[1] == night) {
          isDoctorSavedOnce = [false, night];
        }
        assignedRoles.values.forEach((role) => role.isSaved = false);
        notifyListeners();
        break;
      case 'همشهری کین':
        if (kaneActionDone[0] == true && kaneActionDone[1] == night) {
          kaneActionDone = [false, night];
          kaneRightChoice = [];
        }
        notifyListeners();
        break;
      case 'کنستانتین':
        if (konstantinActionDone[0] == true &&
            konstantinActionDone[1] == night) {
          konstantinActionDone = [false, night];
          assignedRoles.values.forEach((role) => role.isReversible = true);
        }
        purgatory = [];
        notifyListeners();
        break;
      default:
    }

//
    List<String> newDead = [];
//
    final bool kaneMustBeOut =
        kaneRightChoice.contains('kane must be out of game next day') == true;

    moveToDead(slaughter);

    for (String playerName in alives) {
      if (assignedRoles[playerName]!.isShot &&
          !assignedRoles[playerName]!.isSaved) {
        assignedRoles[playerName]?.heart--;
      }
      notifyListeners();
    }

    for (String playerName in alives) {
      if (assignedRoles[playerName]!.heart == 0) {
        newDead.add(playerName);
      }
      notifyListeners();
    }

    if (leonWrongShot == true) {
      final String leonPlayer = assignedRoles.keys.firstWhere(
        (name) => assignedRoles[name]!.name == 'لئون حرفه ای',
      );
      newDead.add(leonPlayer);
      notifyListeners();
    }

    if (purgatory.isNotEmpty) {
      final String playerWhoIsComingBack = purgatory.single;
      moveToAlive(playerWhoIsComingBack);
      int playerHeart = assignedRoles[playerWhoIsComingBack]!.heart;
      switch (playerHeart) {
        case 0:
          assignedRoles[playerWhoIsComingBack]!.heart = 1;
          break;
        default:
          assignedRoles[playerWhoIsComingBack]!.heart = playerHeart;
      }
      purgatory.clear();
      notifyListeners();
      print(
          '$playerWhoIsComingBack\'s heart : ${assignedRoles[playerWhoIsComingBack]!.heart}');
    }

    if (kaneMustBeOut) {
      newDead.add(assignedRoles.keys.firstWhere(
        (name) => assignedRoles[name]!.name == 'همشهری کین',
      ));
      kaneRightChoice = [];
      notifyListeners();
    }

    alives.removeWhere((player) => dead.contains(player));

    for (var player in assignedRoles.keys) {
      assignedRoles[player]!.isBlocked = false;
      assignedRoles[player]!.isSaved = false;
      assignedRoles[player]?.isShot = false;
      assignedRoles[player]?.handCuffed = false;
    }

    notifyListeners();

    print('dead are : $dead \n and alives are : $alives');
    for (var player in newDead) {
      moveToDead(player);
    }
    print(
        "purgator : $purgatory , kaneRightChoice : $kaneRightChoice, kaneActionDone : $kaneActionDone, konstantinActionDone : $konstantinActionDone, isDoctorSavedOnce : $isDoctorSavedOnce, leonHasShot : $leonHasShot, leonWrongShot : $leonWrongShot, leonBullets : $leonBullets, code : $code, night : $night, dead : $dead, alives : $alives, blockedPlayer : $blockedPlayer, slaughter : $slaughter, kaneMustBeOut : $kaneMustBeOut, newDead : $newDead");
    nightResult(context);
    newDead = [];
  }

  nightResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text('نتیجۀ شب $night'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                dead.isNotEmpty
                    ? Text('افراد خارج از بازی : ${dead.join(', ')}')
                    : const SizedBox(),
                slaughter.isNotEmpty
                    ? Text('سلاخی شده : $slaughter')
                    : const SizedBox(),
                kaneRightChoice.isNotEmpty
                    ? Text('کین انتخاب درست کرد : $kaneRightChoice')
                    : const SizedBox(),
                night == 0 ? const SizedBox() : Text('code: $code'),
                // Text('کین انتخاب درست کرد : $kaneRightChoice مافیاست'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (statistics() != '') {
        Navigator.of(context).pushReplacementNamed(Victory.routeName);
      } else if (alives.length == 3) {
        Navigator.of(context).pushReplacementNamed(ThreeRemained.routeName);
      } else {
        startDay(context);
      }
    });
  }

  void inquiry(BuildContext context) {
    int deadMafia = 0, deadCitizen = 0, deadIndependent = 0;
    for (String player in dead) {
      if (assignedRoles[player]?.type == 'M') {
        deadMafia++;
      } else if (assignedRoles[player]?.type == 'C') {
        deadCitizen++;
      } else if (assignedRoles[player]?.type == 'I') {
        deadIndependent++;
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('نتیجۀ تحقیق'),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('مافیای بیرون: $deadMafia'),
                Text('شهروندان بیرون: $deadCitizen'),
                Text('مستقل‌ها بیرون: $deadIndependent'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(DayScreen.routeName);
              },
              child: const Text('فهمیدیم، بریم برای روز بعدی'),
            ),
          ],
        );
      },
    );
  }

  godToNight() {
    mafiaBullet = 1;
    if (kaneRightChoice.isNotEmpty) {
      kaneRightChoice = ['kane must be out of game next day'];
    }
    slaughter = '';
    leonWrongShot = false;
    purgatory = [];
    assignCode(alives);
    code = null;
    if (lastNightBlocked.contains(assignedRoles.keys.where(
        (playerName) => assignedRoles[playerName]!.name == 'لئون حرفه ای'))) {}
    leonHasShot = false;
    code = null;
  }

  Future<void> newGame(playersNames, context) async {
    _alives = List.from(_playersNames);
    _dead = [];
    _mafia = 2;
    _citizen = 4;
    _independent = 1;
    _day = 0;
    _night = 0;
    mafiaBullet = 1;
    kaneRightChoice = [];
    slaughter = '';
    leonWrongShot = false;
    purgatory = [];
    kaneActionDone = [false, 0];
    konstantinActionDone = [false, 0];
    isDoctorSavedOnce = [false, 0];
    nostradamousActionDone = false;
    _lastMove = LastMoves.lastMoves;

    Navigator.pushNamed(context, ShowRolesScreen.routeName);
    notifyListeners();
  }

  void kickOffPlayers(String playerName) {
    alives.removeWhere((player) => player == playerName);
    dead.add(playerName);
    print('Dead Players: $_dead');
    print('Alive Players: $_alives');
// show lastMove dialog

    notifyListeners();
  }

  void selectLastMoveCard(index) {
    final List<LastMove> lastMoveShuffled = List.from(_lastMove)..shuffle();
    final selectedLastMove = lastMoveShuffled[index];
    print(selectedLastMove);
  }

  void assignRandomRoles(BuildContext context, List<String> players) {
    final playersNumber = players.length;
    final List<String> playersNames = List.from(players);
    final listOfRoles = Provider.of<Roles>(context, listen: false);
    final List<Role> citizen = listOfRoles.citizen
        .where((role) => role.order <= playersNumber)
        .toList();
    final List<Role> mafia =
        listOfRoles.mafia.where((role) => role.order <= playersNumber).toList();
    final List<Role> independent = listOfRoles.independent;
    final List<Role> allRolesForShuffle = citizen + mafia + independent;
    _allRoles = allRolesForShuffle;
    final List<Role> allRolesShuffled = List.from(allRolesForShuffle)
      ..shuffle();

    assignedRoles.clear();

    for (int i = 0; i < playersNames.length; i++) {
      final playerName = playersNames[i];
      final assignedRole = allRolesShuffled[i];

      assignedRoles[playerName] = assignedRole;
      _playersNames = assignedRoles.keys.toList();
    }
  }

  assignCode(List<String> players) {
    // final random = Random();
    final List<int> randomCodes =
        List.generate(players.length * 2, (index) => index + index + 1);
    codes = randomCodes;
    print('codes are : $codes');

    // players.forEach((player) => assignedRoles[player]!.code );
    for (int i = 0; i < players.length; i++) {
      final player = players[i];
      assignedRoles[player]?.code = codes[i];
    }
    notifyListeners();
  }

  //
}
