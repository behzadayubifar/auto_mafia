import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_data.dart';

class Victory extends StatelessWidget {
  static const routeName = '/victory';
  const Victory({super.key});

  @override
  Widget build(BuildContext context) {
    final winner = Provider.of<PlayerData>(context).statistics().toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Victory'),
      ),
      body: Center(child: Text('$winner win')),
    );
  }
}
