import 'package:flutter/material.dart';

import 'colours.dart';

extension StringExtension on String {
  String get titleCase =>
      split(" ").map((e) => "${e[0].toUpperCase()}${e.substring(1)}").join(" ");
}

extension Style on TextStyle {
  TextStyle toAccent() {
    return apply(color: Colours.accent);
  }
}
