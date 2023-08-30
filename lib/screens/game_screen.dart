import 'package:flutter/material.dart';
import 'package:god_father/providers/db_provider.dart';
import 'package:provider/provider.dart';
import '../screens/naming_screen.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game';
  GameScreen({super.key});

  // late int scenario;

  // Define a method to handle button press and navigate to the NamingScreen
  void navigateToNamingScreen(BuildContext context) {
    print(context.read<AppDbProvider>().playersListFuture);
    Navigator.pushNamed(
      context,
      NamingScreen.routeName, /*  arguments: scenario */
    );
  }

  Widget MyPlayerNumberButton(int playerNumber, [VoidCallback? onPressed]) {
    return TextButton(
      onPressed: onPressed, // Use the provided onPressed callback
      child: CircleAvatar(
        minRadius: 40,
        child: Text(
          '$playerNumber players',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scenario'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      navigateToNamingScreen(
                          context); // Call the method to navigate
                    },
                    child: MyPlayerNumberButton(7),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: MyPlayerNumberButton(8),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: MyPlayerNumberButton(9),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: MyPlayerNumberButton(10),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: MyPlayerNumberButton(11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
