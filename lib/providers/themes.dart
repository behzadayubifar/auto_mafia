import 'package:flutter/material.dart';

enum ThemeType {
  day,
  night,
}

class DayNightThemeManager with ChangeNotifier {
  ThemeType _currentTheme = ThemeType.day;

  ThemeData get currentTheme => _currentTheme == ThemeType.day
      ? DayTheme.themeData
      : NightTheme.themeData;

  void switchToDayTheme() {
    _currentTheme = ThemeType.day;
    notifyListeners();
  }

  void switchToNightTheme() {
    _currentTheme = ThemeType.night;
    notifyListeners();
  }
}

class DayTheme {
  static final ThemeData themeData = ThemeData(
    primaryIconTheme: const IconThemeData(),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.all(const Color.fromARGB(179, 255, 255, 255)),
      checkColor: MaterialStateProperty.all(const Color.fromARGB(179, 0, 0, 0)),
    ),
    listTileTheme: ListTileThemeData(
      visualDensity: VisualDensity.comfortable,
      iconColor: Colors.white,
      dense: true,
      tileColor: const Color.fromARGB(255, 104, 72, 66),
      contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    primarySwatch: Colors.brown,
    iconTheme: const IconThemeData(color: Colors.white70, size: 40),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Colors.white70,
        fontSize: 40,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white70),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        iconSize: MaterialStateProperty.all(60),
      ),
    ),
  );
}

class NightTheme {
  static final ThemeData themeData = ThemeData(
    primaryIconTheme: const IconThemeData(),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
      checkColor:
          MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
    ),
    listTileTheme: ListTileThemeData(
      visualDensity: VisualDensity.comfortable,
      iconColor: Colors.black,
      dense: true,
      tileColor: const Color.fromARGB(255, 24, 40, 48),
      contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    primarySwatch: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.white70, size: 40),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: Colors.white70, fontSize: 40),
    ).apply(),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white70),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        iconSize: MaterialStateProperty.all(60),
      ),
    ),
  );
}
