import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';

class MadeByMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.scaffold,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Made with",
            style: theme.textTheme.headline3,
          ),
          Image.asset("assets/icons/heart.png", scale: 3,),
          Text(
            "by",
            style: theme.textTheme.headline3,
          ),
          Text(
            " @imsk17",
            style: theme.textTheme.headline3.copyWith(color: Colours.accent),
          )
        ],
      ),
    );
  }
}
