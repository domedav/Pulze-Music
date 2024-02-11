import 'package:flutter/material.dart';

class AppTheme{
  final Map<String, ThemeData> _themes = {};
  static AppTheme? _instance;

  AppTheme(){
    _instance = this;
    _themes.addEntries({
      'Dark': ThemeData.from(
        colorScheme: const ColorScheme.dark(
          primary: Color.fromRGBO(0x5B, 0x5B, 0x5B, 1.0),
          onPrimary: Color.fromRGBO(0xDD, 0xDD, 0xDD, 1.0),
          secondary: Color.fromRGBO(0x30, 0x30, 0x30, 1.0),
          onSecondary: Color.fromRGBO(0xE9, 0xE9, 0xE9, 1.0),
        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      'Light': ThemeData.from(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(0xEC, 0xAF, 0x96, 1.0),
          onPrimary: Color.fromRGBO(0x1E, 0x1E, 0x1E, 1.0),
          secondary: Color.fromRGBO(0xFF, 0xDC, 0xCA, 1.0),
          onSecondary: Color.fromRGBO(0x22, 0x22, 0x22, 1.0),
        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      'DarkHighContrast': ThemeData.from(
        colorScheme: ColorScheme.highContrastDark(
          primary: Color.fromRGBO(0x68, 0x68, 0x68, 1.0),
          onPrimary: Color.fromRGBO(0xFF, 0xFF, 0xFF, 1.0),
          secondary: Color.fromRGBO(0x18, 0x18, 0x18, 1.0),
          onSecondary: Color.fromRGBO(0xFF, 0xFF, 0xFF, 1.0),
        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      'LightHighContrast': ThemeData.from(
        colorScheme: ColorScheme.highContrastLight(
          primary: Color.fromRGBO(0xFF, 0x4A, 0x0, 1.0),
          onPrimary: Color.fromRGBO(0x0, 0x0, 0x0, 1.0),
          secondary: Color.fromRGBO(0xFF, 0xDC, 0xCA, 1.0),
          onSecondary: Color.fromRGBO(0x0, 0x0, 0x0, 1.0),
        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
    }.entries);
  }

  static ThemeData? getThemeByName(String name){
    return _instance!._themes[name];
  }
}