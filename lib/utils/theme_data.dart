import 'package:flutter/material.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/extensions.dart';
import 'package:gbuagenda/utils/text_theme.dart';

final theme = ThemeData(
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
  // ignore: deprecated_member_use
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
  textTheme: textTheme,
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 24,
  ),
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: textTheme.headline4.toAccent(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    backgroundColor: Colors.grey[300],
  ),
);
