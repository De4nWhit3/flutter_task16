import 'package:flutter/material.dart';

class GameTheme {
  GameTheme._();

  static const _lightSeed = Color.fromARGB(255, 164, 213, 253);
  static const _darkSeed = Color.fromARGB(255, 20, 59, 165);

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _lightSeed,
        brightness: Brightness.light,
      ));

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _darkSeed,
        brightness: Brightness.dark,
      ));
}
