// settings.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  static final Map<String, ThemeData> _theme = {
    'light': ThemeData(
        primarySwatch: Colors.brown,
        iconTheme: const IconThemeData(color: Colors.red),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.red),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.brown,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
  };

  // Define a custom text style for the button labels
  static const TextStyle _buttonLabelStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  ThemeData? _themeData = _theme['light'];

  SharedPreferences? _prefs;

  Future<void> readSetting() async {
    _prefs = await SharedPreferences.getInstance();
    _themeData = (_prefs!.getBool('darkMode') ?? false)
        ? _theme['dark']
        : _theme['light'];
    notifyListeners();
  }

  ThemeData get themeData => _themeData!;

  ThemeData get darkTheme => _theme['dark']!;

  bool get darkMode => _themeData == _theme['dark'];

  set switchTheme(bool status) {
    _themeData = status ? _theme['dark'] : _theme['light'];
    _prefs?.setBool('darkMode', status);
    notifyListeners();
  }

  // Get the custom button label text style
  TextStyle get buttonLabelStyle => _buttonLabelStyle;
}
