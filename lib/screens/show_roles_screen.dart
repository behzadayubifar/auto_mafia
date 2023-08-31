import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:god_father/data/local/db/app_db.dart';
import 'package:god_father/providers/db_provider.dart';
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
  final List<String> displayedPlayers = [];

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
    final db = Provider.of<AppDb>(context, listen: false);
    final isLoading =
        context.select<AppDbProvider, bool>((notifier) => notifier.isLoading);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Roles'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
            },
            icon: const Icon(Icons.help_center_rounded),
            label: const Text(
              'Help',
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<InCommonData>>(
        future: db.getAllPlayers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final List<InCommonData> players = snapshot.data!;
            return ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return ListTile(
                  title: Text(player.playerName),
                  onTap: createOnTapCallback(
                    player.playerName,
                    player.roleName,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
