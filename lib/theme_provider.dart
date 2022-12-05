import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  final lightMode = ThemeData(
    primarySwatch: Colors.blue,
  );

  final darkMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
    ),
  );
}
