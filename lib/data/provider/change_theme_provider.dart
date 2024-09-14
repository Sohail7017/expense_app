import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeProvider extends ChangeNotifier{
  bool _isDark = false;
  SharedPreferences? prefs;
  void updateTheme(bool value) async{
    _isDark =value;
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool('theme', _isDark);
    notifyListeners();
  }

  bool getTheme() => _isDark;

  void getInitialTheme() async{
    prefs = await SharedPreferences.getInstance();
    _isDark = prefs!.getBool("theme")!;
    notifyListeners();
  }
}