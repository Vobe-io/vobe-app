import 'package:flutter/material.dart';

class VobeThemes {
  static var _themes = {
    'dark': ThemeData.dark().copyWith(
        backgroundColor: Colors.black45,
        accentColor: Colors.purple,
        
        textTheme: TextTheme(subtitle: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white)),
    'light': ThemeData.light().copyWith()
  };

  static themes() => _themes;
}
