import 'package:flutter/material.dart';
import 'package:god_father/providers/player_data.dart';
import 'package:god_father/screens/Days/day_screen.dart';
import 'package:provider/provider.dart';

import '../model/role.dart';

class ShowRolesScreen extends StatefulWidget {
  static const routeName = '/show-roles';

  const ShowRolesScreen({super.key});

  @override
  State<ShowRolesScreen> createState() => _ShowRolesScreenState();
}

class _ShowRolesScreenState extends State<ShowRolesScreen> {
  List<String> displayedPlayers = [];

  @override
  void initState() {
    super.initState();
    final playerData = Provider.of<PlayerData>(context, listen: false);
    displayedPlayers = List.from(playerData.alives);
  }

  void hidePlayer(String playerName) {
    setState(() {
      displayedPlayers.remove(playerName);
    });
  }

  void Function() createOnTapCallback(
    String playerName,
    String playerRole,
  ) {
    return () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(playerName),
            content: Container(
              height: 80,
              child: Column(
                children: [
                  Text(playerRole),
                  Divider(),
                ],
              ),
            ), // Replace with the appropriate content
            actions: [
              TextButton(
                onPressed: () {
                  hidePlayer(playerName);
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context, listen: false);
    final Map<String, Role> assignedRoles = playerData.assignedRoles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Roles'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: displayedPlayers.length,
        itemBuilder: (ctx, index) {
          final playerName = displayedPlayers[index];
          final playerRole = assignedRoles[playerName];

          return GestureDetector(
            onTap: createOnTapCallback(
              playerName,
              playerRole!.name,
            ),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(children: [
                  Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Has everyone seen their roles?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(
                      context,
                      DayScreen.routeName,
                    );
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
