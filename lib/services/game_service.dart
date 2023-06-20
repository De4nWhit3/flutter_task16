import 'package:flutter/material.dart';

class GameService extends ChangeNotifier {
  bool isDarkModeOn = false;
  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}
