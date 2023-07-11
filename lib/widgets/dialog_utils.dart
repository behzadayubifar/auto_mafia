import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/last_move.dart';
import '../providers/player_data.dart';
import '../screens/Days/selected_last_move_screen.dart';

class LastMoveDialog extends StatefulWidget {
  final Function(int) onSelectNumber;

  const LastMoveDialog({super.key, required this.onSelectNumber});

  @override
  _LastMoveDialogState createState() => _LastMoveDialogState();
}

class _LastMoveDialogState extends State<LastMoveDialog> {
  late TextEditingController _numberController;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    _numberController.addListener(_checkButtonEnabled);
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  void _checkButtonEnabled() {
    setState(() {
      _isButtonEnabled = _numberController.text.isNotEmpty;
    });
  }

  void _showSelectedLastMove(
      int selectedNumber, List<LastMove> lastMoves, BuildContext context) {
    if (selectedNumber >= 1 && selectedNumber <= lastMoves.length) {
      final selectedLastMove = lastMoves[selectedNumber - 1];
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>
              SelectedLastMoveScreen(selectedLastMove: selectedLastMove),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    return AlertDialog(
      title: const Text('Select A Number For Your Last Move'),
      content: TextField(
        controller: _numberController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: '1 to ${playerData.lastMove.length}',
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: _isButtonEnabled
                  ? () {
                      final int selectedNumber =
                          int.tryParse(_numberController.text) ?? 0;
                      widget.onSelectNumber(selectedNumber);
                      Navigator.of(context).pop();
                      _showSelectedLastMove(
                          selectedNumber, playerData.lastMove, context);
                    }
                  : null,
              child: const Text('OK'),
            ),
          ],
        )
      ],
    );
  }
}

showKillPlayerDialog(
    BuildContext context,
    List<String>? selectedPlayerToKickOff,
    List<String> alives,
    Function(List<String>) kickOff,
    Function startNight) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Select Players to Kill'),
            content: SizedBox(
              height: 250, // Adjust the height as per your requirement
              child: SingleChildScrollView(
                child: Column(
                  children: alives
                      .map(
                        (playerName) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Material(
                            child: CheckboxListTile(
                              title: Text(
                                playerName,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: selectedPlayerToKickOff
                                      ?.contains(playerName) ??
                                  false,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    // Uncheck previously selected players
                                    selectedPlayerToKickOff?.clear();
                                    // Check the current player
                                    selectedPlayerToKickOff?.add(playerName);
                                  } else {
                                    selectedPlayerToKickOff?.remove(playerName);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: selectedPlayerToKickOff == null ||
                            selectedPlayerToKickOff.isEmpty
                        ? null
                        : () {
                            kickOff(selectedPlayerToKickOff);
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) => LastMoveDialog(
                                onSelectNumber: (int selectedNumber) {
                                  print('Selected Number: $selectedNumber');
                                },
                              ),
                            );
                          },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: selectedPlayerToKickOff!.isNotEmpty
                        ? null
                        : () {
                            startNight(context);
                          },
                    icon: const Icon(Icons.next_plan),
                    label: const Text('Night', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
