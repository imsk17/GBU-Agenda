import 'package:flutter/material.dart';

abstract class Colours {
  static const accent = Color(0xFFF7484E);
  static const scaffold = Color(0xFF292929);
  static const lightScaffold = Color(0x26757575);
  static const error = Color(0xffE57A7A);
  static const timing = Color(0xFFB6ADAD);
  static const chips = Color(0x66F7484E);
}

extension Style on TextStyle {
  TextStyle toAccent() {
    return apply(color: theme.accentColor);
  }
}

var theme = ThemeData(
  cardTheme: const CardTheme(elevation: 0),
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
        fontFamily: 'Aileron',
        fontWeight: FontWeight.w900),
    headline2:
        TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Aileron'),
    headline3:
        TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Aileron'),
    headline4:
        TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Aileron'),
    headline5:
        TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'Aileron'),
    headline6:
        TextStyle(fontSize: 11, color: Colors.white, fontFamily: 'Aileron'),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 24,
  ),
);
