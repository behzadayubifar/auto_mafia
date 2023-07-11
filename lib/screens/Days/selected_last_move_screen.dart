import 'package:flutter/material.dart';
import 'package:god_father/providers/player_data.dart';
import 'package:god_father/widgets/last_move_actions.dart';

import '../../model/last_move.dart';

import 'package:provider/provider.dart';

class SelectedLastMoveScreen extends StatelessWidget {
  final LastMove selectedLastMove;

  const SelectedLastMoveScreen({super.key, required this.selectedLastMove});

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context);
    final assignedRoles = playerData.assignedRoles;
    final alives = playerData.alives;
    final lastDead = playerData.dead.last;

    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Last Move : ${selectedLastMove.name}'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedLastMove.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(selectedLastMove.description),
              ),
              const SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  selectedLastMove.action ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              LastMoveActions(
                lastMove: selectedLastMove.name,
                assignedRoles: assignedRoles,
                currentPlayer: lastDead,
                alives: alives,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
