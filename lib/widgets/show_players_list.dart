import 'package:flutter/material.dart';

class ShowPlayersListWidget extends StatelessWidget {
  final List<String> alives;
  final VoidCallback action;

  const ShowPlayersListWidget(this.alives, this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
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
            onTap: action,
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 8,
      ),
      itemCount: alives.length,
    );
  }
}
