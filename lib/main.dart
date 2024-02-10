import 'package:flutter/material.dart';
import 'package:pulze_music/Pages/home_page.dart';
import 'package:pulze_music/Themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppTheme();
    return MaterialApp(
      title: 'Pulze',
      theme: AppTheme.getThemeByName('Light'),
      darkTheme: AppTheme.getThemeByName('Dark'),
      highContrastTheme: AppTheme.getThemeByName('LightHighContrast'),
      highContrastDarkTheme: AppTheme.getThemeByName('DarkHighContrast'),
      color: AppTheme.getCurrentTheme().primaryColor,
      home: HomePage(),
    );
  }
}