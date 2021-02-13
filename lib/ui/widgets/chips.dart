import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';

class ClassChip extends StatelessWidget {
  final String text;

  const ClassChip({this.text});
  @override
  Widget build(BuildContext context) {
    if (text == "G-0") {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colours.chips,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                text,
                style: theme.textTheme.headline6.copyWith(
                  color: Colours.accent,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
