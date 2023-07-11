import 'package:flutter/material.dart';

class ErrorHandlingUtils {
  static void showErrorMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('The number of players should be 7.'),
      ),
    );
  }

  // Add more error handling functions if needed
}
