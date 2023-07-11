import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_data.dart';

class ThreeRemained extends StatelessWidget {
  static const routeName = '/three-remained';

  const ThreeRemained({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context);
    final alives = playerData.alives;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Three Remained'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Three Survivals Are'),
                content: SizedBox(
                  height: 200,
                  width: 200,
                  child: ListView.separated(
                    itemCount: alives.length,
                    itemBuilder: (context, index) {
                      final player = alives[index];
                      final role = playerData.assignedRoles[player]!.name;
                      return Material(
                        child: ListTile(
                          title: Text('Name: $player'),
                          subtitle: Text('Role: $role'),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ),
            );
          },
          child: const Icon(Icons.nightlight_outlined),
        ),
      ),
    );
  }
}
