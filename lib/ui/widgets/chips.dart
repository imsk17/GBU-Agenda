import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';

class ClassChip extends StatelessWidget {
  final String text;

  const ClassChip({this.text});
  @override
  Widget build(BuildContext context) {
    if (text == "G - 0") {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: const Color(0x6636B6DE),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                text,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
