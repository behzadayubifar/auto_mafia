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
      textColor: const Color.fromARGB(255, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    primarySwatch: Colors.brown,
    iconTheme: const IconThemeData(color: Colors.white70, size: 40),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 50,
      ),
      displayMedium: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 40,
      ),
      displaySmall: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 30,
      ),
      titleLarge: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 15,
      ),
      titleSmall: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 10,
      ),
      labelLarge: TextStyle(
        color: Colors.white70,
        fontSize: 40,
      ),
      labelMedium: TextStyle(
        color: Color.fromARGB(179, 5, 5, 5),
        fontSize: 30,
      ),
      labelSmall: TextStyle(
        color: Color.fromARGB(179, 5, 5, 5),
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 40,
      ),
      bodyMedium: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 30,
      ),
      bodySmall: TextStyle(
        color: Color.fromARGB(179, 30, 30, 30),
        fontSize: 20,
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
