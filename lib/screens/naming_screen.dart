import 'package:flutter/material.dart';
import 'package:god_father/data/local/db/app_db.dart';
import 'package:provider/provider.dart';

import '../providers/player_data.dart';
import '../screens/show_roles_screen.dart';

class NamingScreen extends StatefulWidget {
  static const routeName = '/naming';

  @override
  _NamingScreenState createState() => _NamingScreenState();
}

class _NamingScreenState extends State<NamingScreen> {
  List<TextEditingController> controllers = [];
  int playersNumber = 7;

  List<String> initialNames = [
    'فاطمه',
    'بهزاد',
    'مرتضی',
    'زهرا جمشیدی',
    'زهرا درمسجدی',
    'مریم',
    'محسن',
    'مرضیه',
    'حمید',
    'محبوبه',
    'نرگس',
  ];

  @override
  void initState() {
    super.initState();
    // initialNames.shuffle();
    controllers = List.generate(playersNumber, (index) {
      final String inititalText =
          index < initialNames.length ? initialNames[index] : '';
      return TextEditingController(text: inititalText);
    });
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerData = Provider.of<PlayerData>(context);
    final _db = Provider.of<AppDb>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Player\'s Names'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton<int>(
                items: <int>[7, 8, 9, 10, 11].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    playersNumber = value!;
                    controllers = List.generate(playersNumber, (index) {
                      final inititalText = index < initialNames.length
                          ? initialNames[index]
                          : '';
                      return TextEditingController(text: inititalText);
                    });
                  });
                },
                value: playersNumber,
                hint: Text('Select players Numbers'),
              ),
              const SizedBox(height: 16),
              Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < controllers.length; i++)
                        buildTextField('Player ${i + 1}', controllers[i]),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final List<String> playersNames =
                      controllers.map((controller) => controller.text).toList();
                  playerData.assignRandomRoles(context, playersNames);
                  playerData.newGame(playersNames, context);
                },
                child: const Text('Start Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
