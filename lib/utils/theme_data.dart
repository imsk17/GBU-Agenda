import 'package:flutter/material.dart';

abstract class Colours {
  static const accent = Color(0xFF36B6DE);
  static const scaffold = Color(0xFF1C1F3E);
  static const lightScaffold = Color(0xFF272846);
  static const error = Color(0xffE57A7A);
  static const timing = Color(0xFFB6ADAD);
}

var theme = ThemeData(
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colours.accent,
          width: 3.0,
        ),
      ),
    ),
  ),
  accentColor: Colours.accent,
  scaffoldBackgroundColor: Colours.scaffold,
  splashColor: Colors.white,
  buttonTheme: ButtonThemeData(
    padding: const EdgeInsets.all(12),
    splashColor: Colors.white,
    buttonColor: Colours.accent,
    focusColor: Colours.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 55,
        color: Colors.white,
        fontFamily: 'NeutrifPro',
        fontWeight: FontWeight.w500),
    headline2:
        TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'TTCommons'),
    headline3:
        TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'TTCommons'),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 24,
  ),
);
