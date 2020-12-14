import 'package:flutter/material.dart';

final theme = ThemeData.dark().copyWith(
  accentColor: const Color(0xFF36B6DE),
  scaffoldBackgroundColor: const Color(0xFF1C1F3E),
  splashColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    splashColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    buttonColor: Color(0xFF36B6DE),
    focusColor: Color(0xFF36B6DE),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 64,
        color: Colors.white,
        fontFamily: 'NeutrifPro',
        fontWeight: FontWeight.w500),
    headline2:
        TextStyle(fontSize: 55, color: Colors.white, fontFamily: 'NeutrifPro'),
    headline3:
        TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'TTCommons'),
    headline4:
        TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'TTCommons'),
    headline5:
        TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'ApercuPro'),
    headline6:
        TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'ApercuPro'),
  ),
  iconTheme: const IconThemeData(color: Colors.white, size: 24),
);
