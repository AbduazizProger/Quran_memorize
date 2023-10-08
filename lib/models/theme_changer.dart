import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDefiner extends ChangeNotifier {
  ThemeMode themeMode;
  final SharedPreferences prefs;

  ThemeDefiner({required this.themeMode, required this.prefs});

  void changeTheme() {
    prefs.setBool('isDark', themeMode.name == 'light' ? true : false);
    themeMode = themeMode.name == 'light' ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
