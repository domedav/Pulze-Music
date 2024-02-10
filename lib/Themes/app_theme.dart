import 'package:flutter/material.dart';

class AppTheme{
  final Map<String, ThemeData> _themes = {};
  static AppTheme? _instance;

  AppTheme(){
    _instance = this;

    _themes.addEntries({
      'Dark': ThemeData.from(
        colorScheme: ColorScheme.dark(

        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      'Light': ThemeData.from(
        colorScheme: ColorScheme.light(

        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      'DarkHighContrast': ThemeData.from(
        colorScheme: ColorScheme.highContrastDark(

        ),
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      'LightHighContrast': ThemeData.from(
        colorScheme: ColorScheme.highContrastLight(

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

  static ThemeData getCurrentTheme(){
    return getThemeByName('Dark')!;
  }
}